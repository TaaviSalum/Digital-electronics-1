----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2021 12:05:33 PM
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

    signal s_SW    : std_logic_vector(4 - 1 downto 0);
    signal s_LED   : std_logic_vector(8 - 1 downto 0);
    
begin


    uut_top : entity work.top
        port map(
            SW   => s_SW,
            LED  => s_LED
        );
        
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        -- 0, 1, 2, 3, 4, 5, 6, 7, 8
        
        s_SW <= "0000"; wait for 10 ns;
        assert (s_LED(4) = '1')
        report "Test failed for input: 0000 which is 0" severity error;
        
        s_SW <= "0001"; wait for 10 ns;
        assert (s_LED(6) = '1' AND s_LED(7) = '1')
        report "Test failed for input: 0001 which is 1" severity error;
        
        s_SW <= "0010"; wait for 10 ns;
        assert (s_LED(7) = '1')
        report "Test failed for input: 0010 which is 2" severity error;
        
        s_SW <= "0011"; wait for 10 ns;
        assert (s_LED(6) = '1')
        report "Test failed for input: 0011 which is 3" severity error;
        
        s_SW <= "0100"; wait for 10 ns;
        assert (s_LED(7) = '1')
        report "Test failed for input: 0100 which is 4" severity error;
        
        s_SW <= "0101"; wait for 10 ns;
        assert (s_LED(6) = '1')
        report "Test failed for input: 0101 which is 5" severity error;
        
        s_SW <= "0110"; wait for 10 ns;
        report "Test failed for input: 0110 which is 6" severity error;
        
        s_SW <= "0111"; wait for 10 ns;
        assert (s_LED(6) = '1')
        report "Test failed for input: 0111 which is 7" severity error;
        
        s_SW <= "1000"; wait for 10 ns;
        assert (s_LED(7) = '1')
        report "Test failed for input: 1000 which is 8" severity error;
        
        -- 9, A, B, C, D, E, F
        
        s_SW <= "1001"; wait for 10 ns;
        assert (s_LED(6) = '1')
        report "Test failed for input: 1001 which is 9" severity error;
        
        s_SW <= "1010"; wait for 10 ns;
        assert (s_LED(5) = '1')
        report "Test failed for input: 1010 which is A" severity error;
        
        s_SW <= "1011"; wait for 10 ns;
        assert (s_LED(5) = '1' AND s_LED(6) = '1')
        report "Test failed for input: 1011 which is B" severity error;
        
        s_SW <= "1100"; wait for 10 ns;
        assert (s_LED(5) = '1')
        report "Test failed for input: 1100 which is C" severity error;
        
        s_SW <= "1101"; wait for 10 ns;
        assert (s_LED(5) = '1' AND s_LED(6) = '1')
        report "Test failed for input: 1101 which is D" severity error;
        
        s_SW <= "1110"; wait for 10 ns;
        assert (s_LED(5) = '1')
        report "Test failed for input: 1110 which is E" severity error;
        
        s_SW <= "1111"; wait for 10 ns;
        assert (s_LED(5) = '1' AND s_LED(6) = '1')
        report "Test failed for input: 111 which is F" severity error;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus; 


end architecture Behavioral;