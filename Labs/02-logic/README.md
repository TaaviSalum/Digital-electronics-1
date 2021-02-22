# **Digital-electronics-1**
# **Laboratory #2**


------------------------------------------------------------------------
## **Exercise 1: 2-bit comparator truth table**

**Dec.equivalent** | **B[1:0]** | **A[1:0]** | B is greater than A | B equals A | B is less than A 
--- | --- | --- | --- | --- | ---
0 | 0 0 | 0 0 | 0 | 1 | 0 
1 | 0 0 | 0 1 | 0 | 0 | 1 
2 | 0 0 | 1 0 | 0 | 0 | 1 
3 | 0 0 | 1 1 | 0 | 0 | 1 
4 | 0 1 | 0 0 | 1 | 0 | 0 
5 | 0 1 | 0 1 | 0 | 1 | 0 
6 | 0 1 | 1 0 | 0 | 0 | 1 
7 | 0 1 | 1 1 | 0 | 0 | 1 
8 | 1 0 | 0 0 | 1 | 0 | 0 
9 | 1 0 | 0 1 | 1 | 0 | 0 
10 | 1 0 | 1 0 | 0 | 1 | 0 
11 | 1 0 | 1 1 | 0 | 0 | 1 
12 | 1 1 | 0 0 | 1 | 0 | 0 
13 | 1 1 | 0 1 | 1 | 0 | 0 
14 | 1 1 | 1 0 | 1 | 0 | 0 
15 | 1 1 | 1 1 | 0 | 1 | 0 





------------------------------------------------------------------------
## **Exercise 2: 2-bit comparator**

### **Karnaugh maps**

#### **Greater than function Karnaugh map**
![Karnaugh map #1](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/02-logic/Pictures/GreaterThan.jpg)


#### **Equal to function Karnaugh map**
![Karnaugh map #2](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/02-logic/Pictures/EqualsTo.jpg)


#### **Less than function Karnaugh map**
![Karnaugh map #3](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/02-logic/Pictures/LessThan.jpg)


### **Simplified SoP form of the "greater than" function**
![Greater than function](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/02-logic/Pictures/Greater_SoP.png)


### **Simplified PoS form of the "less than" function**
![Less than function](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/02-logic/Pictures/Less_PoS.png)


### **EDA playground example: https://www.edaplayground.com/x/8Qjr**




------------------------------------------------------------------------
## **Exercise 3: 4-bit binary comparator**

### **VHDL design code:**
```vhdl 

```


### **VHDL testbench code:**
```vhdl 

```


### **Simulator console output**




### **EDA playground example: **
------------------------------------------------------------------------