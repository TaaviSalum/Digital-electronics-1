# **Digital-electronics-1**
# **Laboratory #4**


------------------------------------------------------------------------
## **Exercise 1: Preparation tasks**

**Hex** | **Inputs** | **A** | **B** | **C** | **D** | **E** | **F** | **G** 
--- | --- | --- | --- | --- | --- | --- | --- | ---
0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 
1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 
2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0
3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0
4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0
5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0
6 | 0110 | 0 | 0 | 0 | 0 | 0 | 0 | 0
7 | 0111 | 0 | 0 | 0 | 0 | 0 | 0 | 0
8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0
9 | 1001 | 0 | 0 | 0 | 0 | 0 | 0 | 0
A | 1010 | 0 | 0 | 0 | 0 | 0 | 0 | 0
B | 1011 | 0 | 0 | 0 | 0 | 0 | 0 | 0
C | 1100 | 0 | 0 | 0 | 0 | 0 | 0 | 0
D | 1101 | 0 | 0 | 0 | 0 | 0 | 0 | 0
E | 1110 | 0 | 0 | 0 | 0 | 0 | 0 | 0
F | 1111 | 0 | 0 | 0 | 0 | 0 | 0 | 0


**NOT DONE**





------------------------------------------------------------------------
## **Exercise 2: 2-bit wide 4-to-1 multiplexer**

### **VHDL architecture:**
```vhdl 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2bit_4to1 is
    port(
        a_i     : in  std_logic_vector(2 - 1 downto 0);
        b_i     : in  std_logic_vector(2 - 1 downto 0);
        c_i     : in  std_logic_vector(2 - 1 downto 0);
        d_i     : in  std_logic_vector(2 - 1 downto 0);
        sel_i   : in  std_logic_vector(2 - 1 downto 0);
        f_o     : out std_logic_vector(2 - 1 downto 0)
    );
end mux_2bit_4to1;

architecture Behavioral of mux_2bit_4to1 is
begin
    f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i; 
    
end architecture Behavioral;
```


### **VHDL testbench:**
```vhdl 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux_2bit_4to1 is
    -- Entity of testbench is always empty
end tb_mux_2bit_4to1;

architecture Behavioral of tb_mux_2bit_4to1 is

    -- Local signals
    signal s_a      : std_logic_vector(2 - 1 downto 0);
    signal s_b      : std_logic_vector(2 - 1 downto 0);
    signal s_c      : std_logic_vector(2 - 1 downto 0);
    signal s_d      : std_logic_vector(2 - 1 downto 0);
    signal s_sel    : std_logic_vector(2 - 1 downto 0);
    signal s_f      : std_logic_vector(2 - 1 downto 0);
        
begin

    uut_mux_2bit_4tol : entity work.mux_2bit_4to1
        port map(
            a_i   => s_a,
            b_i   => s_b,
            c_i   => s_c,
            d_i   => s_d,
            sel_i => s_sel,
            f_o   => s_f
        );

    p_stimulus : process
    begin
        
        report "Stimulus process started" severity note;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00";
        s_sel <= "00"; wait for 100 ns;
        s_sel <= "01"; wait for 100 ns;
        s_sel <= "10"; wait for 100 ns;
        s_sel <= "11"; wait for 100 ns; 
    end process p_stimulus; 
        
end architecture Behavioral;
```

### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex2.jpg)





------------------------------------------------------------------------
## **Exercise 3: A Vivado tutorial**

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 11:22:51 AM
-- Design Name: 
-- Module Name: hex_7seg - Behavioral
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

entity hex_7seg is
    Port (
        signal hex_i    : std_logic_vector(4 - 1 downto 0);  -- Input binary data
        signal seg_o    : std_logic_vector(7 - 1 downto 0)   -- Cathode values
    );
end hex_7seg;

architecture Behavioral of hex_7seg is
begin

    p_7seg_decoder : process(hex_i)
    begin
        case hex_i is
            when "0000" =>
                seg_o <= "0000001";     -- 0
            when "0001" =>
                seg_o <= "1001111";     -- 1
            when "0010" =>
                seg_o <= "0010010";     -- 2
            when "0011" =>
                seg_o <= "0000110";     -- 3
            when "0100" =>
                seg_o <= "1001100";     -- 4
            when "0101" =>
                seg_o <= "0100100";     -- 5
            when "0110" =>
                seg_o <= "0100000";     -- 6
            when "0111" =>
                seg_o <= "0001111";     -- 7
            when "1000" =>
                seg_o <= "0000000";     -- 8
    
            -- 9, A, B, C, D, E, F
            
            when "1001" =>
                seg_o <= "0001100";     -- 9
            when "1010" =>
                seg_o <= "0001000";     -- A
            when "1011" =>
                seg_o <= "1100000";     -- B
            when "1100" =>
                seg_o <= "0110001";     -- C
            when "1101" =>
                seg_o <= "1000010";     -- D
            when "1110" =>
                seg_o <= "0110000";     -- E
            when others =>
                seg_o <= "0111000";     -- F
        end case;
    end process p_7seg_decoder;

end architecture behavioral;






------------------------------------------------------------------------