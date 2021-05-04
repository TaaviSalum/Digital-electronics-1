----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Francisca Campos
-- 
-- Create Date: 24.04.2021 19:50:29
-- Design Name: ultraSonicSensor
-- Module Name: ultraSonic - Behavioral
-- Project Name: Parking assistant
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations
use ieee.numeric_std.all;   -- Package for arithmetic operations
use ieee.std_logic_unsigned.all;


entity ultraSonic is
    generic(
        DIV_1u  : natural := 100;      -- Number of clk pulses to generate
        DIV_1m  : natural := 1000;     -- Number of clk pulses to generate
        DIV_60m : natural := 60        -- Number of clk pulses to generate
                                  
    );  -- Note that there IS a semicolon between generic and port
        -- sections
    port(
        clk   : in  std_logic;      -- Main clock
        reset : in  std_logic;      -- Synchronous reset
        act   : in  std_logic;      -- Activating signal system 
        echo  : in  std_logic;      -- Signal sent by the sensor
        trigger  : out std_logic;    -- Signal sent to the sensor to enable the measure
        distanceRange : out std_logic_vector(3 downto 0) -- Distance range. From 0 - less than 10 cm to 9 - less than 1 m 
    );
end ultraSonic;

architecture Behavioral of ultraSonic is
 
  -- Signals for timing
  signal tic_1u   : std_logic; -- Tic to count 1u
  signal cnt_1u   : std_logic_vector(6 downto 0); -- Tic to count 1u 
  signal tic_1m   : std_logic; -- Tic to count 1m
  signal cnt_1m   : std_logic_vector(9 downto 0); -- Tic to count 1m
  signal tic_60m   : std_logic; -- Tic to count 1m
  signal cnt_60m   : std_logic_vector(5 downto 0); -- Tic to count 60m
 
  -- Signals for sensor 
  signal echo_value : std_logic_vector(12 downto 0);  -- See how many cm has counted 0 less than 10, 1 less than 20, 2 less than 30... Until 9 less than 1 m  
  signal cnt_trig : std_logic_vector(4 downto 0);  -- Counter to get 15 u 
  signal cnt_echo : std_logic_vector(12 downto 0); -- Counter to get how many us the echo has been up. 5800 is the maximum because it corresponds to 1 m 
  
begin
    -- Timer 1us
    p_tim_1u : process(clk,reset)
    begin
            if (reset = '1') then       -- High active reset
               cnt_1u <= (others => '0');
            -- If the system is not on, nothing has to happen 
            elsif rising_edge(clk) then 
                if tic_1u = '1' then 
                    cnt_1u <= (others => '0');
                else
                    cnt_1u <= cnt_1u + 1;
                end if;
            end if;
    end process p_tim_1u;
     
  tic_1u <= '1' when cnt_1u = DIV_1u else '0';
   
  -- Timer 1ms
  p_tim_1ms : process(clk,reset)
    begin
            if (reset = '1') then       -- High active reset
               cnt_1m <= (others => '0');
            -- If the system is not on, nothing has to happen 
            elsif rising_edge(clk) then 
                if tic_1m = '1' then 
                    cnt_1m <= (others => '0');
                elsif tic_1u = '1' then
                    cnt_1m <= cnt_1m + 1;
                end if;
            end if;
    end process p_tim_1ms;
     
  tic_1m <= '1' when cnt_1m = DIV_1m else '0';
  
  -- Timer 60ms
  p_tim_60ms : process(clk,reset)
    begin
            if (reset = '1') then       -- High active reset
               cnt_60m <= (others => '0');
            -- If the system is not on, nothing has to happen 
            elsif rising_edge(clk) then 
                if tic_60m = '1' then 
                    cnt_60m <= (others => '0');
                elsif tic_1m = '1' then
                    cnt_60m <= cnt_60m + 1;
                end if;
            end if;
    end process p_tim_60ms;
     
  tic_60m <= '1' when cnt_60m = DIV_60m else '0';
  
  p_send : process(clk,reset)
    begin
            if (reset = '1') then       -- High active reset
               cnt_trig <= (others => '0');
               trigger <= '0';
            -- If the system is not on, nothing has to happen 
            elsif rising_edge(clk) then 
             if act = '0' then
               cnt_trig <= (others => '0');
               trigger <= '0';
             else
             
                if tic_60m = '1' then 
                    cnt_trig <= "00001";
                elsif cnt_trig /= "0000" and tic_1u = '1' then
                
                    if cnt_trig /= 16 then 
                        cnt_trig <= cnt_trig + 1;
                        trigger <= '1';
                    else
                        cnt_trig <= "00000";
                        trigger <= '0';  
                    end if;
                end if;
               end if;
             end if;
    end process p_send;
    
  p_rec : process(clk,reset)
    begin
           if (reset = '1') then       -- High active reset
               cnt_echo <= (others => '0'); 
               echo_value <= (others => '0'); 
            -- If the system is not on, nothing has to happen 
            elsif rising_edge(clk) then
             if act = '0' then 
                cnt_echo <= (others => '0');
             else   
                if ((echo = '0') and (cnt_echo /= "000000000000"))  then 
                    echo_value <= cnt_echo;
                    cnt_echo <= (others => '0');
                    
                elsif tic_1u = '1' and (echo = '1')  then
                    cnt_echo <= cnt_echo + 1;
                    
                end if;
             end if;
            end if;
    end process p_rec;
  
  
    -- The formula to calculate the distance in cm is us measured/58 = cm. Because of this, the us measured are 58*cm. So, to measure, 10cm, 20cm...
    -- we have to multiply those cm by 58
    distanceRange <= "0000" when echo_value <= 580  else
                     "0001" when echo_value <= 1160 else    
                     "0010" when echo_value <= 1740 else
                     "0011" when echo_value <= 2320 else
                     "0100" when echo_value <= 2900 else
                     "0101" when echo_value <= 3480 else
                     "0110" when echo_value <= 4060 else
                     "0111" when echo_value <= 4640 else
                     "1000" when echo_value <= 5220 else
                     "1001" when echo_value <= 5800 else
                     "1010";
  
end Behavioral;
