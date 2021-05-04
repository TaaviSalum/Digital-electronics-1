library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_design is
    generic(
        DIV_1u  : natural := 100;      -- Number of clk pulses to generate
        DIV_1m  : natural := 1000;     -- Number of clk pulses to generate
        DIV_60m : natural := 60        -- Number of clk pulses to generate
                                  
    );  -- Note that there IS a semicolon between generic and port
        -- sections
    Port (  
            SW              : in std_logic;    -- On/Off button for the system  --  A8
            BTN             : in std_logic;    -- Reset button   --  D9
            CLK100MHZ       : in std_logic;    -- CLK signal
            echo            : in std_logic;    -- Tells the ultrasonic sensor how far the object is
            T11             : out std_logic;   -- Red3 LED
            R12             : out std_logic;   -- Red2 LED
            T14             : out std_logic;   -- Red1 LED
            T15             : out std_logic;   -- Yellow 4 LED
            T16             : out std_logic;   -- Yellow 3 LED
            U11             : out std_logic;   -- Yellow 2 LED
            V16             : out std_logic;   -- Yellow 1 LED
            M13             : out std_logic;   -- Green 3 LED
            R10             : out std_logic;   -- Green 2 LED
            R11             : out std_logic;   -- Green 1 LED
            P14             : out std_logic;   -- Buzzer output
            trigger         : out std_logic;   -- Signal which is sent by the ultrasonic sensor
            DistanceTest_o  : out std_logic_vector(3 downto 0) -- Used for seeing the top module different range modes
     );
     
end top_design;

architecture Behavioral of top_design is
 
    signal s_Distance_i    : std_logic_vector (3 downto 0);       -- Range
    signal s_SensorOnOff_o : std_logic;                           -- On Off for sensor module (OUTPUT)
    signal s_PWM_o         : std_logic_vector(4 - 1 downto 0);    -- PWM for buzzer
    signal s_reset         : std_logic;
    signal s_LEDs_o        : std_logic_vector(4 -1 downto 0);

begin

    Sensor : entity work.ultraSonic
        generic map(
            DIV_1u  => 100,      -- Number of clk pulses to generate
            DIV_1m  => 1000,     -- Number of clk pulses to generate
            DIV_60m => 60        -- Number of clk pulses to generate
        )
        port map(
           
           clk              => CLK100MHZ,
           reset            => s_reset, 
           act              => s_SensorOnOff_O,
           echo             => echo,
           trigger          => trigger,
           distanceRange    => s_Distance_i
        );

    LED_decoder : entity work.LED_decoder
        port map(
        
            DecoderInput_i  => s_LEDS_o,  
            Green1_o        => R11,        
            Green2_o        => R10, 
            Green3_o        => M13, 
            Yellow1_o       => V16,
            Yellow2_o       => U11,
            Yellow3_o       => T16,
            Yellow4_o       => T15,
            Red1_o          => T14,   
            Red2_o          => R12,  
            Red3_o          => T11     
        );
         
    PWM_KY012 : entity work.PWM_KY012
        port map(
           
           clk              => CLK100MHZ,
           reset            => s_reset, 
           PWMOutput_o      => P14, 
           PWMInput_i       => s_PWM_o 
        );
        
p_top: process(s_Distance_i, SW, BTN, echo)
    begin
        if SW = '1' then
            s_SensorOnOff_o <= '1'; 
            if BTN = '1' then                  -- To reset the system (Needs testing if works or needs to be moved somewhere else)
               s_reset <= '1';
            else
               s_reset <= '0';
                if s_Distance_i = "1001" then     -- Range 1/10 (The furthest away)
                    s_LEDs_o <= "0001";
                    s_PWM_o  <= "0001";
                
                elsif s_Distance_i = "1000" then  -- Range 2/10
                    s_LEDs_o <= "0010";
                    s_PWM_o  <= "0010";  
                 
                elsif s_Distance_i = "0111" then  -- Range 3/10
                    s_LEDs_o <= "0011";
                    s_PWM_o  <= "0011";
                
                elsif s_Distance_i = "0110" then  -- Range 4/10
                    s_LEDs_o <= "0100";
                    s_PWM_o  <= "0100";
                        
               elsif s_Distance_i = "0101" then  -- Range 5/10
                     s_LEDs_o <= "0101";
                     s_PWM_o  <= "0101";   
                    
               elsif s_Distance_i = "0100" then  -- Range 6/10
                     s_LEDs_o <= "0110";
                     s_PWM_o  <= "0110";
                    
               elsif s_Distance_i = "0011" then  -- Range 7/10
                     s_LEDs_o <= "0111";
                     s_PWM_o  <= "0111";
                        
               elsif s_Distance_i = "0010" then  -- Range 8/10
                     s_LEDs_o <= "1000";
                     s_PWM_o  <= "1000";
                        
               elsif s_Distance_i = "0001" then  -- Range 9/10
                     s_LEDs_o <= "1001";
                     s_PWM_o  <= "1001";        
                    
               elsif s_Distance_i = "0000" then  -- Range 10/10 (The closest)
                     s_LEDs_o <= "1010";
                     s_PWM_o  <= "1010";                     
               else
                     s_LEDs_o <= "0000";
                     s_PWM_o  <= "0000";
               end if;     
            end if;  
         else
            s_SensorOnOff_o <= '0';
            s_reset <= '0';
            s_LEDs_o <= "0000";
            s_PWM_o  <= "0000";
         end if;             
    end process p_top;        
        
DistanceTest_o <= std_logic_vector(s_Distance_i);
end Behavioral;