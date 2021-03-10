----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 12:18:29 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture behavioral of top is
begin

    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => SW,
            seg_o(6) => CA,
            
            -- WRITE YOUR CODE HERE
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );
        
    -- Connect one common anode to 3.3V
    AN <= b"1111_0111";

    -- Display input value
    LED(3 downto 0) <= SW;

    -- Turn LED(4) on if input value is equal to 0, ie "0000"
    -- WRITE YOUR CODE HERE
    
    LED(4)  <= '1' when (SW = "0000") else  -- 0
               '0';
    
    -- Turn LED(5) on if input value is greater than 9
    -- WRITE YOUR CODE HERE
    LED(5)  <= '1' when (SW = "1010") else  -- A (10)
               '1' when (SW = "1011") else  -- B (11)
               '1' when (SW = "1100") else  -- C (12)
               '1' when (SW = "1101") else  -- D (13)
               '1' when (SW = "1110") else  -- E (14)
               '1' when (SW = "1111") else  -- F (15)
               '0';

    -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
    -- WRITE YOUR CODE HERE
    LED(6)  <= '1' when (SW = "0001") else  -- 1
               '1' when (SW = "0011") else  -- 3
               '1' when (SW = "0101") else  -- 5
               '1' when (SW = "0111") else  -- 7
               '1' when (SW = "1001") else  -- 9
               '1' when (SW = "1011") else  -- B (11)
               '1' when (SW = "1101") else  -- D (13)
               '1' when (SW = "1111") else  -- F (15)
               '0';

    -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
    -- WRITE YOUR CODE HERE
    LED(7)  <= '1' when (SW = "0001") else  -- 1
               '1' when (SW = "0010") else  -- 2
               '1' when (SW = "0100") else  -- 4
               '1' when (SW = "1000") else  -- 8
               '0';
              
end architecture behavioral;