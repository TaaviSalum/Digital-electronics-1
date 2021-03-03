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

#### **Quick tutorial for Vivado design flow: how to create new project, how to add source file, testbench file and XDC constraints file and how to run simulation**

#### **Step 1: Click "Create Project"**
![Step 1](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_1.jpg)

#### **Step 2: Click "Next"**
![Step 2](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_2.jpg)

#### **Step 3: Decide where do you want to save the project and click "Next"**
![Step 3](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_3.jpg)

#### **Step 4: Make sure the project is a "RTL Project" and click "Next"**
![Step 4](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_4.jpg)

#### **Step 5: To add source files click on one of the options but to make a new one click on "Create File"**
![Step 5](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_5.jpg)

#### **Step 6: Make sure the file type is "VHDL" then name the source file and click "OK"**
![Step 6](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_6.jpg)

#### **Step 7: Once all of the source files have been added click "Next"**
![Step 7](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_7.jpg)

#### **Step 8: To add XDC constraint files click on of the options but to make a new one click on "Create File"**
![Step 8](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_8.jpg)

#### **Step 9: Make sure the file type is "XDC" then name the XDC constraint file and click "OK"**
![Step 9](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_9.jpg)

#### **Step 10: Once all of the XDC constraint files have been added click "Next"**
![Step 10](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_10.jpg)

#### **Step 11: Find the FPGA you are using under "Parts" or "Boards"**
![Step 11](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_11.jpg)

#### **Step 12: Once you have find it, select it and click "Next"**
![Step 12](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_12.jpg)

#### **Step 13: Have a quick overview of the project and once everything is correct click "Finish"**
![Step 13](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_13.jpg)

#### **Step 14: A window will pop-up and there you can add the testbench file and once everything is correct click "OK"**
![Step 14](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_14.jpg)

#### **Step 15: Click "Yes"**
![Step 15](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_15.jpg)

#### **Step 16: To run the simulation click "Run Simulation**
![Step 16](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_16.jpg)

#### **Step 17: Click "Run Behavioral Simulation"**
![Step 17](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_17.jpg)

#### **Step 18: Simulated time waveforms will appear on the right window *(For current tutorial there is no simulated time waveform)***
![Step 18](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/03-vivado/Pictures/Ex3_18.jpg)





------------------------------------------------------------------------