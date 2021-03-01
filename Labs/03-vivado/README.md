# **Digital-electronics-1**
# **Laboratory #3**


------------------------------------------------------------------------
## **Exercise 1: Preparation tasks**

#### **Connection of 16 slide switches and 16 LEDs on Nexys A7 board**
![Nexys A7 board](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex1.jpg)





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


### **VHDL testbench code:**
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

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_1.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_2.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_3.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_4.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_5.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_6.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_7.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_8.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_9.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_10.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_11.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_12.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_13.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_14.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_15.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_16.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_17.jpg)

#### **Simulator console output**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_18.jpg)





------------------------------------------------------------------------