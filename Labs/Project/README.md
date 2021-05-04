# **Digital-electronics-1**
# **Parking assistant with HC-SR04 ultrasonic sensor, sound signaling using PWM, signaling by LED bargraph**


------------------------------------------------------------------------
## **Team members**
Taavi Salum, Henri Oru, Ana Sampaio, Francisca Campos, Ugur Erdem Yurt.


**https://github.com/TaaviSalum/Digital-electronics-1/tree/main/Labs/Project**


## **Project objectives**
Project objective is to make parking assistant using HC-SR04 ultrasonic sensor, using PWM for sound signaling and LED bargraph for visual signaling.  

This parking assistant is made for close quarters meaning that it will start detecting the range of object from 1 meter.
Once the object gets closer to the ultrasonic sensor the sound signaling system will start beeping faster and faster and more LEDs will turn on.  

We have total of 10 LEDs: 3 green ones, 4 yellow ones and 3 red ones. If the object is far then one green LED will turn on and once the object gets closer then more LEDs will turn on and finally once the object is really close all of the LEDs will be turned on.  

Green LEDs show that the object is still far. Yellow LEDs show that the object is in midrange. Red LEDs show that the object is really close to the ultrasonic sensor.


### **Flowchart of the project**
![Flowchart](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/Flowchart.png)





------------------------------------------------------------------------
## **Hardware description**
For FPGA board we are using Arty A7-35T because it has enough external ports for us to use. We also have external 2 layer PCB which we use. It connects straight on top of Arduino/chipKIT shield connectors (IO33 - IO26 and IO7 - IO0). We are using 13 external I/O pins of the shield connectors. Additional 3 external wires are required to connect from the FPGA board to external PCB and those are 5V0, GND and GND. There is also a possibility to get 3.3V on the external PCB by connecting 3V3 from FPGA board to external PCB 3V3 pin via external wire.

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

Small disclaimer: the actual colours of the U3 (HDSP-4832 / LED bar) is different than in the picture because we couldn't find the correct 3D model. Starting from the bottom the first three LEDs are green, then four yellow LEDs and then three red LEDs.

### **External PCB 3D model from bottom side**
![External PCB 3D model from bottom side](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/External_PCB_3D_BOT.png)





------------------------------------------------------------------------
## **VHDL modules description and simulations**

### **LED_decoder module description**
LED_decoder module is made out of 1 input and 10 outputs. The input is a four bit signal which controls the 10 outputs which are different coloured LEDs.  

The signal for the input comes directly from the top design. Inputs "0000", "1011", "1100", "1101", "1110" and "1111" turn all of the LEDs off because our top design has 10 different levels and those levels are between values "0001" and "1010". The higher the value goes the more LEDs will turn on. At input value of "0001" only 1 LED will be turned on (which is green) and at the input value of "1010" all of the LEDs will be turned on.

### **Links to source file**
https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/LED_decoder.vhd


### **Links to test testbench**
https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_LED_decoder.vhd


### **LED_decoder simulation**
![LED_decoder simulation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/LED_decoder_simulation.png)


### **PWM module description**
PWM module is made out of only one input and no outputs because it doesn’t need to give feedback, its only purpose is to make sound according to the signal received. The input is a 4bit signal which gives 10 output signals to the buzzer to make a sound according to the signal.  

The signals are activated the same as LED_decoder, from ‘0001’ to ‘1010’. When one signal is activated, lets take the signal ‘1001’ (9) for example, the module will do 9 continuous beeps divided between 1-100, after each beep is a quick reset and it moves onto another beep. After that, when it has gotten to 100, it starts again at 0 and also resets itself after which it starts again with counting from 1 according to the signal value it has. The higher the value in the input is, the more intensely the PWM module will beep.

### **Links to source files**
https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/clock_enable.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/cnt_up_down.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_1.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_2.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_3.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_4.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_5.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_6.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_7.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_8.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_9.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_10.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/PWM_KY012.vhd  


### **Links to test testbenches**
https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_clock_enable.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_cnt_up_down.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_1.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_2.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_3.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_4.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_5.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_6.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_7.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_8.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_9.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_10.vhd  

https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_PWM_KY012.vhd  


### **PWM simulation**
![PWM simulation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/PWM_simulation.png)


### **Ultrasonic sensor module description**
The ultrasonic module contains a controller for the HC-SR04 Sensor. 

It generates several ticks to synchronize the sensor with the system clock. A microsecond tick has been generated in order to count that the trigger is active for about 15 us. In addition, the 1ms and 60 ms ticks have been created so that the trigger can be generated every 60 ms as indicated in the datasheet timing specification.   

Two processes have been created, one to send the trigger and the other to receive the echo, which are the signals received and sent by the sensor respectively.  

In the process that sends the trigger, when it detects that 60 ms have passed, the trigger count is activated and the trigger is high for 15 us.  

In the receiving process, the echo counts how long the echo is at high level. As to know the distance it is necessary to count the time at high level and divide it by 58 to obtain the cm, some ranges have been created with the desired distances. So, if the sensor is a time less than or equal to 58 * 10cm = 580, the distance range is 0, the next 58 * 2 * 10 = 1160 and so on.  

It has been thought that the range of distances covers from 10 cm to 1 m since it is a parking assistant, so these distances are considered as the most suitable for parking.


### **Links to source file**
https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/ultraSonic.vhd  


### **Links to test testbench**
https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_ultraSonic.vhd  


### **Ultrasonic sensor simulation**
![Ultrasonic sensor simulation](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Pictures/Ultrasonic_sensor_simulation.PNG)





------------------------------------------------------------------------
## **TOP module description and simulations**

### **TOP design description**
TOP design for the whole project is made out of 3 outputs and 3 inputs. Outputs are ‘Sensor ON’ for activating the Pulse generator for Ultrasonic Sensor, ‘Object range by sound’ is for PWM to give signal to Buzzer to make sound according to the signal received and the last output is for ‘Object range by LEDs’ that gives the LED_decoder a signal which led/leds to turn on depending what signal is received. Inputs are the ‘Object range’ feedback that is received from the Ultrasonic sensor decoder when the Ultrasonic sensor detects that its in range for measuring, the second input is ON/OFF switch which switches the whole system off and the third input is a system reset button which resets all of the modules.

When the Ultrasonic sensor reads a signal in its reading range with Ultrasonic sensor, it sends the signal to the Arty A7-35T development board. The development board then sends the signal forward to LED_decoder and PWM input. LED-s will turn on according to the given signal, same with the Buzzer. For example: If the Ultrasonic sensor detects the first range distance, which is ‘0001’, the Green1_o LED will turn on, the principle is the same with the Buzzer, if the first distance is detected it will give out the slowest “beeps” out of the ten settings it has. If the object is very close, Ultrasonic sensor will give out the ‘1010’ signal to LED_decoder and PWM, so all the LED-s will turn on and the Buzzer will go onto the fastest “beeping” setting.  


### **Links to source file**
https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sources_1/new/Top_design.vhd  


### **Links to test testbench**
https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/Project/Top_Design_Ultrasonic_Sensor_Project/Top_Design_Ultrasonic_Sensor_Project.srcs/sim_1/new/tb_top_design.vhd 



------------------------------------------------------------------------
## **Video presentation**
[![Video presentation](https://img.youtube.com/vi/VIDEO-ID/0.jpg)](http://www.youtube.com/watch?v=VIDEO-ID)





------------------------------------------------------------------------
## **Discussion of results**
All the individual VHDL sub-projects came out nicely and worked well. But there is an issue in the projects Top testbench, everything matches and seems to work, every signal comes through but the Ultrasonic sensor ‘echo’ and ‘trigger’ signals are just not coming through and that causes the whole design to collapse.  

Overall the project was executed pretty well.





------------------------------------------------------------------------
## **References**
1. https://docs.broadcom.com/doc/AV02-1798EN
2. https://github.com/tomas-fryza/Digital-electronics-1/tree/master/Labs/05-counter
3. https://arduinomodules.info/ky-012-active-buzzer-module/
4. https://www.instructables.com/Simple-Arduino-and-HC-SR04-Example/ 
5. https://cdn.sparkfun.com/datasheets/Sensors/Proximity/HCSR04.pdf





------------------------------------------------------------------------