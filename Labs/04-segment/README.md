# **Digital-electronics-1**
# **Laboratory #4**


------------------------------------------------------------------------
## **Exercise 1: Preparation tasks**

### **Connection of 7-segment displays on Nexys A7 board**
![Nexys A7 board](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/04-segment/Pictures/Ex1.png)


### **7-segment display truth table**
**Hex** | **Inputs** | **A** | **B** | **C** | **D** | **E** | **F** | **G** 
--- | --- | --- | --- | --- | --- | --- | --- | ---
0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 
1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 
2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0
3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0
4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0
5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0
6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0
7 | 0111 | 0 | 0 | 0 | 1 | 1 | 1 | 1
8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0
9 | 1001 | 0 | 0 | 0 | 1 | 1 | 0 | 0
A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 0
B | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0
C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1
D | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0
E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0
F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0





------------------------------------------------------------------------
## **Exercise 2: Seven-segment display decoder**

### **VHDL architecture from source file:**
```vhdl 

```


### **VHDL stimulus process from testbench file:**
```vhdl 

```

### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/04-segment/Pictures/Ex2.png)


### **VHDL code from source file with 7-segment module instantiation:**
```vhdl 

```





------------------------------------------------------------------------
## **Exercise 3: LED(7:4) indicators**

### **Truth table for LEDs(7:4)**
**Hex** | **Inputs** | **A** | **B** | **C** | **D** | **E** | **F** | **G** 
--- | --- | --- | --- | --- | --- | --- | --- | ---
0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 
1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 
2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0
3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0
4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0
5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0
6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0
7 | 0111 | 0 | 0 | 0 | 1 | 1 | 1 | 1
8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0
9 | 1001 | 0 | 0 | 0 | 1 | 1 | 0 | 0
A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 0
B | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0
C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1
D | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0
E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0
F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0

**NOT DONE**

### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/04-segment/Pictures/Ex3.png)





------------------------------------------------------------------------