# **Digital-electronics-1**
# **Laboratory #1**


## **[Link to my Digital-electronics-1 repository](https://github.com/TaaviSalum/Digital-electronics-1)**


------------------------------------------------------------------------
## **Exercise 1: Verification of De Morgan's laws:**


### **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula1.gif)**

**c** | **b** | **a** | ![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula2.gif) 
--- | --- | --- | ---
0 | 0 | 0 | 1
0 | 0 | 1 | 1
0 | 1 | 0 | 0
0 | 1 | 1 | 0
1 | 0 | 0 | 0
1 | 0 | 1 | 1
1 | 1 | 0 | 0
1 | 1 | 1 | 0


### **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula3.gif)**

**c** | **b** | **a** | ![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula4.gif) 
--- | --- | --- | ---
0 | 0 | 0 | 1
0 | 0 | 1 | 1
0 | 1 | 0 | 0
0 | 1 | 1 | 0
1 | 0 | 0 | 0
1 | 0 | 1 | 1
1 | 1 | 0 | 0
1 | 1 | 1 | 0


### **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula5.gif)**

**c** | **b** | **a** | **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula6.gif)** 
--- | --- | --- | ---
0 | 0 | 0 | 1
0 | 0 | 1 | 1
0 | 1 | 0 | 0
0 | 1 | 1 | 1
1 | 0 | 0 | 1
1 | 0 | 1 | 1
1 | 1 | 0 | 0
1 | 1 | 1 | 0

### **VHDL Code:**
```vhdl 
-- Example of basic OR, AND, XOR gates.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground

-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

-- Entity declaration for basic gates

entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;         -- Data input
        c_i    : in  std_logic;         -- Data input
        f_base : out std_logic;         -- Output function
        f_NAND : out std_logic;         -- Output function
        f_NOR  : out std_logic          -- Output function
    );
end entity gates;


-- Architecture body for basic gates

architecture dataflow of gates is
begin
	f_base <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
	f_NAND <= ((not b_i) nand a_i) nand ((not c_i) nand (not b_i));
	f_NOR  <= ((not b_i) nor a_i) nor (c_i nor (not b_i));

end architecture dataflow;
```

### **Waveform #1:**
![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Ex1.jpg)
### **[EDA Playground example](https://www.edaplayground.com/x/UGWZ)**




------------------------------------------------------------------------
## **Exercise 2: Verification of Distributive laws:**


### **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula7.gif)**

**c** | **b** | **a** | **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula8.gif)** | **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula9.gif)**
--- | --- | --- | --- | --- 
0 | 0 | 0 | 0 | 0
0 | 0 | 1 | 0 | 0
0 | 1 | 0 | 0 | 0
0 | 1 | 1 | 1 | 1
1 | 0 | 0 | 0 | 0
1 | 0 | 1 | 1 | 1
1 | 1 | 0 | 0 | 0
1 | 1 | 1 | 1 | 1


### **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula10.gif)**

**c** | **b** | **a** | **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula11.gif)** | **![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Formula12.gif)** 
--- | --- | --- | --- | ---
0 | 0 | 0 | 0 | 0
0 | 0 | 1 | 1 | 1
0 | 1 | 0 | 0 | 0
0 | 1 | 1 | 1 | 1
1 | 0 | 0 | 0 | 0
1 | 0 | 1 | 1 | 1
1 | 1 | 0 | 1 | 1
1 | 1 | 1 | 1 | 1

### **VHDL Code:**
```vhdl
-- Example of basic OR, AND, XOR gates.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground

-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.


library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

-- Entity declaration for basic gates

entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;         -- Data input
        c_i    : in  std_logic;         -- Data input
        f_m    : out std_logic;         -- Output function
        f_n    : out std_logic;         -- Output function
        f_o    : out std_logic;         -- Output function
        f_p    : out std_logic          -- Output function
    );
end entity gates;


-- Architecture body for basic gates

architecture dataflow of gates is
begin
    f_m <= (a_i and b_i) or (a_i and c_i);
    f_n <= a_i and (b_i or c_i);
    f_o <= (a_i or b_i) and (a_i or c_i);
    f_p <= a_i or (b_i and c_i);

end architecture dataflow;
```

### **Waveform #2:**
![Test logo](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/01-gates/pictures/Ex2.jpg)
### **[EDA Playground example](https://www.edaplayground.com/x/vvCM)**