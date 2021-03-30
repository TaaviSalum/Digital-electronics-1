# **Digital-electronics-1**
# **Laboratory #7**


------------------------------------------------------------------------
## **Exercise 1: Preparation tasks**

### **D-type flip-flop equation and truth table**
![D-type flip-flop equation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.1.gif)

**clk** | **d** | **q(n)** | **q(n+1)** | **Comments**
--- | --- | --- | --- | ---
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 0 | 0 | 0 | Remembers values, no change
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 0 | 1 | 0 | Remembers values, no change
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 1 | 0 | 1 | Sampled abd stored
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 1 | 1 | 1 | Sampled and stored


### **JK-type flip-flop equation and truth table**
![JK-type flip-flop equation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.3.gif)

**clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments**
--- | --- | --- | --- | --- | --- 
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 0 | 0 | 0 | 0 | No change
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 0 | 0 | 1 | 1 | No change
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 0 | 1 | 0 | 0 | Reset
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 0 | 1 | 1 | 0 | Reset
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 1 | 0 | 0 | 1 | Set
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 1 | 0 | 1 | 1 | Set
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 1 | 1 | 0 | 1 | Toggle (Invert)
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 1 | 1 | 1 | 0 | Toggle (Invert)


### **T-type flip-flop equation and truth table**
![T-type flip-flop equation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.4.gif)

**clk** | **t** | **q(n)** | **q(n+1)** | **Comments**
--- | --- | --- | --- | ---
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 0 | 0 | 0 | No change
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 0 | 1 | 1 | No change
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 1 | 0 | 1 | Invert (Toggle)
![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex1.2.png) | 1 | 1 | 0 | Invert (Toggle)





------------------------------------------------------------------------
## **Exercise 2: D latch**

### **VHDL code of the process ```p_d_latch```:**
```vhdl 

```


### **VHDL testbench file ```tb_d_latch```:**
```vhdl 

```


### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex2.png)




------------------------------------------------------------------------
## **Exercise 3: Flip-fops**

### **VHDL code of the process ```p_d_ff_arst```:**
```vhdl 

```


### **VHDL testbench file ```tb_d_ff_arst```:**
```vhdl 

```


### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex3.1.png)





### **VHDL code of the process ```p_d_ff_rst```:**
```vhdl 

```


### **VHDL testbench file ```tb_d_ff_rst```:**
```vhdl 

```


### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex3.2.png)





### **VHDL code of the process ```p_jk_ff_rst```:**
```vhdl 

```


### **VHDL testbench file ```tb_jk_ff_rst```:**
```vhdl 

```


### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex3.3.png)





### **VHDL code of the process ```p_t_ff_rst```:**
```vhdl 

```


### **VHDL testbench file ```tb_t_ff_rst```:**
```vhdl 

```
### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/07-ffs/Pictures/Ex3.4.png)





------------------------------------------------------------------------
## **Exercise 4: Shift register schematic**

### **Sketch of the shift register schematic:**
![Sketch of the shift register schematic](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/06-display_driver/Pictures/Ex4.jpg)





------------------------------------------------------------------------