----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.04.2021 01:27:06
-- Design Name: 
-- Module Name: tb_ultraSonic - Behavioral
-- Project Name: 
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_ultraSonic is
--  Port ( );
end tb_ultraSonic;
 
architecture test of tb_ultraSonic is


 -- Number of bits for testbench counter
    constant DIV_1u         : natural := 1;
    constant DIV_1m         : natural := 100;
    constant DIV_60m        : natural := 60;
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz    : std_logic;
    signal s_reset         : std_logic;
    signal s_act           : std_logic;
    signal s_echo          : std_logic;
    signal s_trigger       : std_logic;
    signal s_distanceRange : std_logic_vector(3 downto 0);
begin

 uut_ultrSonic : entity work.ultraSonic
        generic map(
            DIV_1u   => DIV_1u,
            DIV_1m   => DIV_1m,
            DIV_60m  => DIV_60m
        )
        port map(
            clk      => s_clk_100MHz,
            reset    => s_reset,
            act      => s_act,
            echo     => s_echo,
            trigger  => s_trigger,
            distanceRange => s_distanceRange
        );
        
        
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 2000 ms loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 12 ns;
        
        -- Reset activated
        s_reset <= '1';
        wait for 73 ns;

        s_reset <= '0';
        wait;
    end process p_reset_gen;
    
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_act <= '0';
        s_echo <=  '0';
        wait for 380 ns;
        
        -- Enable system
        s_act <= '1';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 2000*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 3000*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 4400*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 5600*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 6400*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 8000*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 9000*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
  
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 10000*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 11000*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
        -- Wait for a trigger and generate the echo
        wait until s_trigger = '1';
        wait until s_trigger = '0';
        wait for 30*c_CLK_100MHZ_PERIOD;
        s_echo <= '1';
        wait for 12000*c_CLK_100MHZ_PERIOD; -- Less than 50 cm
        s_echo <= '0';
        
--        -- Wait for a trigger and generate the echo
--        wait until s_trigger = '1';
--        wait until s_trigger = '0';
--        wait for 30*c_CLK_100MHZ_PERIOD;
--        s_echo <= '1';
--        wait for 3380*c_CLK_100MHZ_PERIOD; -- Less than 60 cm
--        s_echo <= '0';
  
--        -- Wait for a trigger and generate the echo
--        wait until s_trigger = '1';
--        wait until s_trigger = '0';
--        wait for 30*c_CLK_100MHZ_PERIOD;
--        s_echo <= '1';
--        wait for 4050*c_CLK_100MHZ_PERIOD; -- Less than 70 cm
--        s_echo <= '0';
        
--        -- Wait for a trigger and generate the echo
--        wait until s_trigger = '1';
--        wait until s_trigger = '0';
--        wait for 30*c_CLK_100MHZ_PERIOD;
--        s_echo <= '1';
--        wait for 4630*c_CLK_100MHZ_PERIOD; -- Less than 40 cm
--        s_echo <= '0';
        
--        -- Wait for a trigger and generate the echo
--        wait until s_trigger = '1';
--        wait until s_trigger = '0';
--        wait for 30*c_CLK_100MHZ_PERIOD;
--        s_echo <= '1';
--        wait for 5210*c_CLK_100MHZ_PERIOD; -- Less than 40 cm
--        s_echo <= '0';
        
--        -- Wait for a trigger and generate the echo
--        wait until s_trigger = '1';
--        wait until s_trigger = '0';
--        wait for 30*c_CLK_100MHZ_PERIOD;
--        s_echo <= '1';
--        wait for 5500*c_CLK_100MHZ_PERIOD; -- Less than 40 cm
--        s_echo <= '0';
        
        wait for 30*c_CLK_100MHZ_PERIOD;
        
        
       
        report "Stimulus process finished" severity failure;
        wait;
    end process p_stimulus;


end test;