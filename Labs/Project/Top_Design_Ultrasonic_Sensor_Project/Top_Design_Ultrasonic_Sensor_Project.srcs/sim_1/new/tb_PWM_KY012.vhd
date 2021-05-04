
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_PWM_KY012 is
--  Port ( );
end tb_PWM_KY012;

architecture Behavioral of tb_PWM_KY012 is
    
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
    
    signal s_clk_100MHz : std_logic;                        -- Clock signal
    signal s_reset      : std_logic;                        -- Reset signal
    signal s_PWMInput   : std_logic_vector(4 - 1 downto 0); -- Input signal of the PWM module
    signal s_PWMOutput  : std_logic;                        -- Output signal of the PWM module
    
begin
    uut_PWM_top : entity work.PWM_KY012                     -- Entity of top PWM module
        port map(
            clk           => s_clk_100MHz,
            reset         => s_reset,
            PWMInput_i    => s_PWMInput,
            PWMOutput_o   => s_PWMOutput
        );
--------------------------------------------------------------------
-- Clock generation process
--------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 40 ms loop        
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
        wait for 88 ns;
        
        s_reset <= '0';
        wait;
    end process p_reset_gen;

--------------------------------------------------------------------
-- Data generation process
--------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
                                -- Small test to see if it even works
        s_PWMInput <= "0000";   -- Input 0 
        wait for 200 ns;
        
        s_PWMInput <= "0001";   -- Input 1 (Object is far and the buzzer beeps slowly)
        wait for 2000 ns;
        
                                -- Test to show that the output changes according to input             
        s_PWMInput <= "0000";   -- Input 0 
        wait for 2000 ns;
         
        s_PWMInput <= "0001";   -- Input 1 (Object is far and the buzzer beeps slowly)
        wait for 800 ns;

        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
         
        s_PWMInput <= "0010";   -- Input 2
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
         
        s_PWMInput <= "0011";   -- Input 3
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
              
        s_PWMInput <= "0100";   -- Input 4
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
              
        s_PWMInput <= "0101";   -- Input 5
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "0110";   -- Input 6
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "0111";   -- Input 7
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "1000";   -- Input 8
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "1001";   -- Input 9
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "1010";   -- Input 10
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "1011";   -- Input 11
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "1100";   -- Input 12
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "1101";   -- Input 13
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "1110";   -- Input 14
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
        s_PWMInput <= "1111";   -- Input 15
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
        
                                -- To test what happens if there are no input 0-s in between
        s_PWMInput <= "0110";   -- Input 6
        wait for 1000 ns;
        
        s_PWMInput <= "0111";   -- Input 7
        wait for 1000 ns;
        
        s_PWMInput <= "0110";   -- Input 6
        wait for 1000 ns;
        
        s_PWMInput <= "0101";   -- Input 5
        wait for 1000 ns; 
        
        s_PWMInput <= "0100";   -- Input 4
        wait for 1000 ns;
        
        s_PWMInput <= "0011";   -- Input 3
        wait for 1000 ns;
        
        s_PWMInput <= "0100";   -- Input 4
        wait for 1000 ns;
        
        s_PWMInput <= "0101";   -- Input 5
        wait for 1000 ns;
        
        s_PWMInput <= "0000";   -- Input 0
        wait for 400 ns;
           
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;
