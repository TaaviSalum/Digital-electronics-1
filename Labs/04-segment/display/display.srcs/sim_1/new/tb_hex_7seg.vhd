----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 11:48:14 AM
-- Design Name: 
-- Module Name: tb_hex_7seg - Behavioral
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

entity tb_hex_7seg is
    -- Always empty for testbecnh
end tb_hex_7seg;

architecture Behavioral of tb_hex_7seg is

    signal s_hex    : std_logic_vector(4 - 1 downto 0);
    signal s_seg    : std_logic_vector(7 - 1 downto 0);

begin

    uut_hex_7seg : entity work.hex_7seg
        port map(
            hex_i   => s_hex,
            seg_o   => s_seg
        );
        
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        -- 0, 1, 2, 3, 4, 5, 6, 7, 8
        
        s_hex <= "0000"; wait for 10 ns;
        assert (s_seg = "0000001" AND s_LED = '1')
        report "Test failed for input: 0000 which is 0" severity error;
        
        s_hex <= "0001"; wait for 10 ns;
        assert (s_seg = "1001111")
        report "Test failed for input: 0001 which is 1" severity error;
        
        s_hex <= "0010"; wait for 10 ns;
        assert (s_seg = "0010010")
        report "Test failed for input: 0010 which is 2" severity error;
        
        s_hex <= "0011"; wait for 10 ns;
        assert (s_seg = "0000110")
        report "Test failed for input: 0011 which is 3" severity error;
        
        s_hex <= "0100"; wait for 10 ns;
        assert (s_seg = "1001100")
        report "Test failed for input: 0100 which is 4" severity error;
        
        s_hex <= "0101"; wait for 10 ns;
        assert (s_seg = "0100100")
        report "Test failed for input: 0101 which is 5" severity error;
        
        s_hex <= "0110"; wait for 10 ns;
        assert (s_seg = "0100000")
        report "Test failed for input: 0110 which is 6" severity error;
        
        s_hex <= "0111"; wait for 10 ns;
        assert (s_seg = "0001111")
        report "Test failed for input: 0111 which is 7" severity error;
        
        s_hex <= "1000"; wait for 10 ns;
        assert (s_seg = "0000000")
        report "Test failed for input: 1000 which is 8" severity error;
        
        -- 9, A, B, C, D, E, F
        
        s_hex <= "1001"; wait for 10 ns;
        assert (s_seg = "0001100")
        report "Test failed for input: 1001 which is 9" severity error;
        
        s_hex <= "1010"; wait for 10 ns;
        assert (s_seg = "0001000")
        report "Test failed for input: 1010 which is A" severity error;
        
        s_hex <= "1011"; wait for 10 ns;
        assert (s_seg = "1100000")
        report "Test failed for input: 1011 which is B" severity error;
        
        s_hex <= "1100"; wait for 10 ns;
        assert (s_seg = "0110001")
        report "Test failed for input: 1100 which is C" severity error;
        
        s_hex <= "1101"; wait for 10 ns;
        assert (s_seg = "1000010")
        report "Test failed for input: 1101 which is D" severity error;
        
        s_hex <= "1110"; wait for 10 ns;
        assert (s_seg = "0110000")
        report "Test failed for input: 1110 which is E" severity error;
        
        s_hex <= "1111"; wait for 10 ns;
        assert (s_seg = "0111000")
        report "Test failed for input: 111 which is F" severity error;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus; 


end architecture Behavioral;
