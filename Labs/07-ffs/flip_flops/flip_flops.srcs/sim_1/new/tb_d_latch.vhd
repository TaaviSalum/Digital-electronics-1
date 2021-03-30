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
-- Reset generation process
--------------------------------------------------------------------
    p_reset_gen : process
        begin
	       s_arst <= '0';
	       wait for 152 ns;
	       s_arst <= '1';  -- Reset
	       wait for 212 ns;
	       s_arst <= '0';
	       wait for 320 ns;
	       s_arst <= '1';  -- Reset
	       wait;
    end process p_reset_gen;

--------------------------------------------------------------------
-- Data generation process
--------------------------------------------------------------------
    p_stimulus : process
        begin
	       report "Stimulus process started" severity note;
	
	       s_en <= '0';
	       s_d  <= '0';
	       wait for 40 ns;
	       s_d  <= '1';
	       wait for 40 ns;
	       s_d  <= '0';
	       wait for 40 ns;
	       s_d  <= '1';
	       wait for 40 ns;
	       s_d  <= '0';
	       wait for 20 ns;
		
	       assert ((s_arst = '1') and (s_en = '0') and (s_q = '0') and (s_q_bar = '1'))
	       report "Test failed for RESET is '1', EN is '0' and D is '0'" severity error;
	
	       wait for 20 ns;
	       s_d  <= '1';
	       wait for 20 ns;
	
	       assert ((s_arst = '1') and (s_en = '0') and (s_q = '0') and (s_q_bar = '1'))
	       report "Test failed for RESET is '1', EN is '0' and D is '1'" severity error;
	
	       wait for 20 ns;
	       s_d  <= '0';
	       s_en <= '1';
	       wait for 40 ns;
	       s_d  <= '1';
	       wait for 20 ns;
	
	       assert ((s_arst = '1') and (s_en = '1') and (s_q = '0') and (s_q_bar = '1'))
	       report "Test failed for RESET is '1', EN is '1' and D is '1'" severity error;
	
	       wait for 20 ns;
	       s_d  <= '0';
	       wait for 20 ns;
		
	       assert ((s_arst = '1') and (s_en = '1') and (s_q = '0') and (s_q_bar = '1'))
	       report "Test failed for RESET is '1', EN is '1' and D is '0'" severity error;          
	
	       wait for 20 ns;
	       s_d  <= '1';
	       wait for 40 ns;
	       s_d  <= '0';
	       wait for 40 ns;
	       s_d  <= '1';
	       wait for 20 ns;
	
	       assert ((s_arst = '0') and (s_en = '1') and (s_q = '1') and (s_q_bar = '0'))
	       report "Test failed for RESET is '0', EN is '1' and D is '1'" severity error;
	
	       wait for 60 ns;
	       s_d  <= '0';
	       wait for 20 ns;
	
	       assert ((s_arst = '0') and (s_en = '1') and (s_q = '0') and (s_q_bar = '1'))
	       report "Test failed for RESET is '0', EN is '1' and D i '0'" severity error;

	       wait for 20 ns;
	       s_d  <= '1';
	       wait for 20 ns;
	       s_en <= '0';
	       wait for 20 ns;
	       s_d  <= '0';
	       wait for 40 ns;
	       s_d  <= '1';
	       wait for 40 ns;
	       s_d  <= '0';
	       wait for 40 ns;
	       s_d  <= '1';
	       wait for 40 ns;
	       s_d  <= '0';

	       report "Stimulus process finished" severity note;
	       wait;
    end process p_stimulus;
end Behavioral;