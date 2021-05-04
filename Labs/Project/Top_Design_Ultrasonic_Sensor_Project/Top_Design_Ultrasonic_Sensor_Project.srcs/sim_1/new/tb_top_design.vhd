
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top_design is
--  Port ( );
end tb_top_design;

architecture Behavioral of tb_top_design is
    constant DIV_1u              : natural := 1;
    constant DIV_1m              : natural := 100;
    constant DIV_60m             : natural := 60;
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
    
    --Local signals
    signal s_clk_100MHZ   : std_logic;
    signal BTN            : std_logic;
    signal SW             : std_logic;
    signal s_Red3         : std_logic;
    signal s_Red2         : std_logic;
    signal s_Red1         : std_logic;
    signal s_Yellow4      : std_logic;
    signal s_Yellow3      : std_logic;
    signal s_Yellow2      : std_logic;
    signal s_Yellow1      : std_logic;
    signal s_Green3       : std_logic;
    signal s_Green2       : std_logic;
    signal s_Green1       : std_logic;
    signal s_buzzer       : std_logic;
    signal s_echo         : std_logic;
    signal s_trigger      : std_logic;
    signal s_DistanceTest : std_logic_vector(3 downto 0);

begin

    uut_top_design : entity work.Top_design
        generic map(
            DIV_1u   => DIV_1u,
            DIV_1m   => DIV_1m,
            DIV_60m  => DIV_60m
        )
        port map(
            SW              => SW,
            BTN             => BTN,
            CLK100MHZ       => s_clk_100MHZ,         
            T11             => s_Red3,
            R12             => s_Red2,
            T14             => s_Red1,
            T15             => s_Yellow4,
            T16             => s_Yellow3,
            U11             => s_Yellow2,
            V16             => s_Yellow1,
            M13             => s_Green3,
            R10             => s_Green2,
            R11             => s_Green1,
            P14             => s_buzzer,
            echo            => s_echo,
            trigger         => s_trigger,
            DistanceTest_o  => s_DistanceTest

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
        BTN <= '0';
        wait for 300 ns;
        
        -- Reset activated
        BTN <= '1';
        wait for 150 ns;

        BTN <= '0';
        wait;
    end process p_reset_gen;
    

    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        SW <= '0';      -- Put the system off
        s_echo <= '0';  -- Make the s_echo '0'
        wait for 380 ns;
        
        -- Enable system
        SW <= '1';      -- Put the system on
        
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
        
        
        wait for 30*c_CLK_100MHZ_PERIOD;
        
        report "Stimulus process finished" severity failure;
        wait;
     end process p_stimulus;
        
end Behavioral;