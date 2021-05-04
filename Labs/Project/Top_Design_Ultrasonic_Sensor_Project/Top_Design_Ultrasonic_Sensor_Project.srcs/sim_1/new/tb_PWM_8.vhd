library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_PWM_8 is
    -- Entity of testbench is always empty
end entity tb_PWM_8;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_PWM_8 is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_PWMOutput  : std_logic;
    signal s_PWM8_en    : std_logic;
    signal s_cntTest8   : std_logic_vector(7 - 1 downto 0);
    
begin
    uut_cnt : entity work.PWM_8
        port map(
            clk           => s_clk_100MHz,
            reset         => s_reset,
            PWMOutput_o   => s_PWMOutput,
            PWM8_en_i     => s_PWM8_en,
            cntTest8_o     => s_cntTest8
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
               
        s_PWM8_en <= '1';
        wait for 1600 ns;
        
        s_PWM8_en <= '0';
        wait for 1600 ns;
        
        s_PWM8_en <= '1';
        wait for 900 ns;
        
        s_PWM8_en <= '0';
        wait for 500 ns;
        
        s_PWM8_en <= '1';
        wait for 800 ns;
        
        s_PWM8_en <= '0';
        wait for 500 ns;         
             
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
   
end architecture testbench;