----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2021 11:27:51 AM
-- Design Name: 
-- Module Name: tb_d_latch - Behavioral
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

entity tb_d_latch is
--  Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is

    signal s_en     : std_logic;
    signal s_d      : std_logic;    
    signal s_arst   : std_logic;
    signal s_q      : std_logic;
    signal s_q_bar  : std_logic;
    
begin

    uut_d_latch : entity work.d_latch
        port map(
            en          => s_en,
            d           => s_d,
            arst        => s_arst,   
            q           => s_q,
            q_bar       => s_q_bar
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
p_stimulus : process
    begin
        report "Stimulus process started" severity note;


        --s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        --assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        --report "Test failed for input combination: 0000, 0000" severity error;

      

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
    
end Behavioral;
