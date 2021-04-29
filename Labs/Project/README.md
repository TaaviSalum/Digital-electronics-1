# **Digital-electronics-1**
# **Parking assistant with HC-SR04 ultrasonic sensor, sound signaling using PWM, signaling by LED bargraph**


------------------------------------------------------------------------
## **Team members**
Francisca Campos, Henri Oru, Taavi Salum, Ana Sampaio, Ugur Erdem Yurt.


**https://github.com/TaaviSalum/Digital-electronics-1/tree/main/Labs/Project**


## **Project objectives**
Project objective is to make parking assistant using HC-SR04 ultrasonic sensor, using PWM for sound signaling and LED bargraph for visual signaling.
This parking assistant is made for close quarters meaning that it will start detecting the range of object from 1 meter.
Once the object gets closer to the ultrasonic sensor the sound signaling system will start beeping faster and faster and more LEDs will turn on.
We have total of 10 LEDs: 3 green ones, 4 yellow ones and 3 red ones.
If the object is far then one green LED will turn on and once the object gets closer then more LEDs will turn on and finally once the object is really close all of the LEDs will be turned on.
Green LEDs show that the object is still far. Yellow LEDs show that the object is in midrange. Red LEDs show that the object is really close to the ultrasonic sensor.



### **Flowchart of the project**
![Flowchart](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/Flowchart.png)




------------------------------------------------------------------------
## **Hardware description**
For FPGA board we are using Arty A7-35T because it has enough external ports for us to use. We also have external 2 layer PCB which we use. 
It connects straight on top of Arduino/chipKIT shield connectors (IO33 - IO26 and IO7 - IO0). We are using 13 external I/O pins of the shield connectors. Additional 3 external wires are required to connect from the FPGA board to external PCB and those are 5V0, GND and GND. There is also a possibility to get 3.3V on the external PCB by connecting 3V3 from FPGA board to external PCB 3V3 pin via external wire.

IO0 for ultrasonic sensor module HC-SR04 signal "Trig" which is to trigger the ultrasonic sensor to start measuring the distance of the object.  
IO1 for ultrasonic sensor module HC-SR04 signal "Echo" which is to send received signal from the object to FPGA to calculate the range of the object.  
IO2 for Active buzzer module KY-012 signal "S" which is for sound signaling.  
IO3 for 10 LED bar array HDSP-4832 signal "Anode a" which is for third red LED.  
IO4 for 10 LED bar array HDSP-4832 signal "Anode b" which is for second red LED.  
IO5 for 10 LED bar array HDSP-4832 signal "Anode c" which is for first red LED.  
IO6 for 10 LED bar array HDSP-4832 signal "Anode d" which is for fourth yellow LED.  
IO7 for 10 LED bar array HDSP-4832 signal "Anode e" which is for third yellow LED.  
IO26 for 10 LED bar array HDSP-4832 signal "Anode f" which is for second yellow LED.  
IO27 for 10 LED bar array HDSP-4832 signal "Anode g" which is for first yellow LED.  
IO28 for 10 LED bar array HDSP-4832 signal "Anode h" which is for third green LED.  
IO29 for 10 LED bar array HDSP-4832 signal "Anode i" which is for second green LED.  
IO30 for 10 LED bar array HDSP-4832 signal "Anode j" which is for first green LED.  
IO31 is not used.  
IO32 is not used.  
IO33 is not used.  


### **Bill of materials for the external PCB**
**Designator** | **Component name** | **Manufacturer** | **Description** | **Link**
--- | --- | --- | --- | ---
U1 | HC-SR04 | OSEPP Electronics | Ultrasonic sensor module - 5V | https://www.mouser.ee/ProductDetail/OSEPP-Electronics/HC-SR04?qs=wNBL%252BABd93PqZEhuhHkuOw%3D%3D
U2 | KY-012 | Her | Active Buzzer Module Arduino Raspberry | https://www.amazon.de/-/en/012-Active-Buzzer-Module-Arduino-Raspberry/dp/B073TML8PT/ref=sr_1_5?dchild=1&keywords=KY-012&qid=1619692686&sr=8-5
U3 | HDSP-4832 | Broadcom / Avago | LED Bars and Arrays, R/Y/G, light bar, 2.1V, 3.5mcd | https://www.mouser.ee/ProductDetail/Broadcom-Avago/HDSP-4832?qs=%2Fha2pyFadujUAZRX1FYp7tBzfQWM0sDDiSsmqcN7Nns%3D
R1 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R2 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R3 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R4 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R5 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R6 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R7 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R8 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R9 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
R10 | TR0603KR-07330RL | Yageo | Thick Film Resistor - SMD, 330 ohm, 1/10W, 0603, 10% | https://www.mouser.ee/ProductDetail/Yageo/TR0603KR-07330RL?qs=k2KEx2DUIRSUX7nKwK5F8A%3D%3D
J1 | 5-103327-1 | TE Connectivity | Header & Wire Housing, Through-hole, Pitch - 2.54mm, 4 position, 1 row, straight | https://www.mouser.ee/ProductDetail/TE-Connectivity/5-103327-1?qs=%2Fha2pyFadugqHF9saaqqEKCHTw7qvwlVMnSAsuvf0mM%3D
J2 | 5-146254-8 | TE Connectivity | Header & Wire Housing, Through-hole, Pitch - 2.54mm, 16 position, 2 row, straight | https://www.mouser.ee/ProductDetail/TE-Connectivity/5-146254-8?qs=bwpFY26eRVeR6qljXzz%2FRg%3D%3D


### **Arty A7-35T from TOP side**
![Arty A7-35T](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/Arty_A7-35T.jpg)

### **External PCB Schematic**
![External PCB Schemati](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/External_PCB_Schematic.png)

### **External PCB 3D model from top side**
![External PCB 3D model from top side](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/External_PCB_3D_TOP.png)

### **External PCB 3D model from bottom side**
![External PCB 3D model from bottom side](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/External_PCB_3D_BOT.png)





------------------------------------------------------------------------
## **VHDL modules description and simulations**

### **LED_decoder module description**



### **LED_decoder simulation**
![LED_decoder simulation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/LED_decoder_simulation.png)


### **PWM module description**



### **PWM simulation**
![PWM simulation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/PWM_simulation.png)


### **Ultrasonic sensor module description**



### **Ultrasonic sensor simulation**
![Ultrasonic sensor simulation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/Ultrasonic_sensor_simulation.png)





------------------------------------------------------------------------
## **TOP module description and simulations**

### **TOP design description**



### **TOP design simulation**
![TOP design simulation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/Top_designr_simulation.png)

### **Block diagram of final application**
![Block diagram of final application](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/Final_block_diagram.png)








------------------------------------------------------------------------
## **Video presentation**
[![Video presentation](https://img.youtube.com/vi/VIDEO-ID/0.jpg)](http://www.youtube.com/watch?v=VIDEO-ID)








------------------------------------------------------------------------
## **Discussion of results**










------------------------------------------------------------------------
## **References**
1. 
2. 
3. 
4. 
5. 







------------------------------------------------------------------------