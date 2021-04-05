# **Digital-electronics-1**
# **Laboratory #8**


------------------------------------------------------------------------
## **Exercise 1: Preparation tasks**

### **Completed state table**
**Input P** | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0```
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
**Clock** | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png)
**State** | A | A | A | A | A | A | A | A | A | A | A | A | A | A | A | A
**Output R** | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```0```


### **Connection of RGB LEDs on Nexys A7 board and completed table with colour settings**
![RGB LEDs on Nexys A7 board](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.2.png)

![RGB LEDs on Nexys A7 board](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.3.png)

**RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** 
--- | --- | --- | --- | ---
LD16 | N15, M16, R12 | ```1,0,0``` | ```1,1,0``` | ```0,1,0```
LD17 | N16, R11, G14 | ```1,0,0``` | ```1,1,0``` | ```0,1,0```





------------------------------------------------------------------------
## **Exercise 2: Traffic light controller**

### **State diagram**
![State diagram](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex2.1.jpg)


### **VHDL code of the sequential process ```p_traffic_fsm```:**
```vhdl 

```


### **VHDL code of the combinatorial process ```p_output_fsm```:**
```vhdl 

```


### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex2.2.png)




------------------------------------------------------------------------
## **Exercise 3: Smart controller**

### **State table**



### **State diagram**
![State diagram](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex3.jpg)


### **VHDL code of the sequential process ```p_smart_traffic_fsm```:**
```vhdl 

```





------------------------------------------------------------------------