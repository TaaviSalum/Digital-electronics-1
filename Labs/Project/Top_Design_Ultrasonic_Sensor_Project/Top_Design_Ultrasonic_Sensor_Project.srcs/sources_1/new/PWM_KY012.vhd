
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity PWM_KY012 is
    Port ( 
            clk         : in  std_logic;                          -- Signal for Clock
            reset       : in  std_logic;                          -- Signal for Reset
            PWMInput_i  : in  std_logic_vector(4 - 1 downto 0);   -- Input to control the PWM
            PWMOutput_o : out  std_logic                          -- Output of the PWM
    );
end PWM_KY012;

architecture Behavioral of PWM_KY012 is

    signal s_PWM1_en    : std_logic; -- To enable PWM 1
    signal s_PWM2_en    : std_logic; -- To enable PWM 2
    signal s_PWM3_en    : std_logic; -- To enable PWM 3
    signal s_PWM4_en    : std_logic; -- To enable PWM 4
    signal s_PWM5_en    : std_logic; -- To enable PWM 5
    signal s_PWM6_en    : std_logic; -- To enable PWM 6
    signal s_PWM7_en    : std_logic; -- To enable PWM 7
    signal s_PWM8_en    : std_logic; -- To enable PWM 8
    signal s_PWM9_en    : std_logic; -- To enable PWM 9
    signal s_PWM10_en   : std_logic; -- To enable PWM 10
              
begin

            --- All of the different PWM entities are connected to the top design
    PWM_1 : entity work.PWM_1
        port map(
        clk         => clk,
        reset       => reset,
        PWM1_en_i   => s_PWM1_en,
        PWMOutput_o => PWMOutput_o        
        );
        
    PWM_2 : entity work.PWM_2
        port map(
        clk         => clk,
        reset       => reset,
        PWM2_en_i   => s_PWM2_en,
        PWMOutput_o => PWMOutput_o        
        );
        
    PWM_3 : entity work.PWM_3
        port map(
        clk         => clk,
        reset       => reset,
        PWM3_en_i   => s_PWM3_en,
        PWMOutput_o => PWMOutput_o        
        );
    
    PWM_4 : entity work.PWM_4
        port map(
        clk         => clk,
        reset       => reset,
        PWM4_en_i   => s_PWM4_en,
        PWMOutput_o => PWMOutput_o        
        );
     
     PWM_5 : entity work.PWM_5
        port map(
        clk         => clk,
        reset       => reset,
        PWM5_en_i   => s_PWM5_en,
        PWMOutput_o => PWMOutput_o        
        );
    
    PWM_6 : entity work.PWM_6
        port map(
        clk         => clk,
        reset       => reset,
        PWM6_en_i   => s_PWM6_en,
        PWMOutput_o => PWMOutput_o        
        );
        
     PWM_7 : entity work.PWM_7
        port map(
        clk         => clk,
        reset       => reset,
        PWM7_en_i   => s_PWM7_en,
        PWMOutput_o => PWMOutput_o        
        );
        
     PWM_8 : entity work.PWM_8
        port map(
        clk         => clk,
        reset       => reset,
        PWM8_en_i   => s_PWM8_en,
        PWMOutput_o => PWMOutput_o        
        );
        
     PWM_9 : entity work.PWM_9
        port map(
        clk         => clk,
        reset       => reset,
        PWM9_en_i   => s_PWM9_en,
        PWMOutput_o => PWMOutput_o        
        );
        
     PWM_10 : entity work.PWM_10
        port map(
        clk         => clk,
        reset       => reset,
        PWM10_en_i   => s_PWM10_en,
        PWMOutput_o => PWMOutput_o        
        );      
             
            --- Till this point
            
    p_pwm_decoder : process(PWMInput_i) -- Depending on the Input signal of the module, the selected PWM will be turned on
    begin
        case PWMInput_i is
            when "0000" =>      -- 0 
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';

            when "0001" =>      -- 1 (The furthest away / Slowest output signal)
                s_PWM1_en  <= '1';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';
                               
            when "0010" =>      -- 2
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '1';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';
                            
            when "0011" =>      -- 3
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '1';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';
                  
            when "0100" =>      -- 4
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '1';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';
                
            when "0101" =>      -- 5
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '1';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';
                
            when "0110" =>      -- 6
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '1';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';
                
            when "0111" =>      -- 7
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '1';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';
                
            when "1000" =>      -- 8
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '1';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '0';
                
            when "1001" =>      -- 9
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '1';
                s_PWM10_en  <= '0';
                
            when "1010" =>      -- 10 (The closest / Fastest output signal)
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en  <= '1';
                
            when others =>
                s_PWM1_en  <= '0';
                s_PWM2_en  <= '0';
                s_PWM3_en  <= '0';
                s_PWM4_en  <= '0';
                s_PWM5_en  <= '0';
                s_PWM6_en  <= '0';
                s_PWM7_en  <= '0';
                s_PWM8_en  <= '0';
                s_PWM9_en  <= '0';
                s_PWM10_en <= '0';
        end case;
    end process p_pwm_decoder;
end Behavioral;