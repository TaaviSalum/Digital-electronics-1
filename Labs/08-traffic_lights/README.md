# **Digital-electronics-1**
# **Laboratory #8**


------------------------------------------------------------------------
## **Exercise 1: Preparation tasks**

### **Completed state table**
**Input P** | ```0``` | ```0``` | ```1``` | ```1``` | ```0``` | ```1``` | ```0``` | ```1``` | ```1``` | ```1``` | ```1``` | ```0``` | ```0``` | ```1``` | ```1``` | ```1```
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
**Clock** | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png) | ![Arrow up](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex1.1.png)
**State** | A | A | B | C | C | D | A | B | C | D | B | B | B | C | D | B
**Output R** | ```0``` | ```0``` | ```0``` | ```0``` | ```0``` | ```1``` | ```0``` | ```0``` | ```0``` | ```1``` | ```0``` | ```0``` | ```0``` | ```0``` | ```1``` | ```0```


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
    p_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= STOP1 ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits
            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is
                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when STOP1 =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= WEST_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
                    when WEST_GO =>
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= WEST_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                    when WEST_WAIT =>
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP2;
                            s_cnt   <= c_ZERO;
                        end if;
                    when STOP2 =>
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_GO;
                            s_cnt   <= c_ZERO;
                        end if;
                    when SOUTH_GO =>
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                    when SOUTH_WAIT =>
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP1;
                            s_cnt   <= c_ZERO;
                        end if;
                    -- It is a good programming practice to use the 
                    -- OTHERS clause, even if all CASE choices have 
                    -- been made. 
                    when others =>
                        s_state <= STOP1;
                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_traffic_fsm;
```


### **VHDL code of the combinatorial process ```p_output_fsm```:**
```vhdl 
    p_output_fsm : process(s_state)
    begin
        case s_state is
            when STOP1 =>
                south_o <= "100";   -- Red
                west_o  <= "100";   -- Red 
            when WEST_GO =>
                south_o <= "100";   -- Red 
                west_o  <= "010";   -- Green 
            when WEST_WAIT =>
                south_o <= "100";   -- Red 
                west_o  <= "110";   -- Yellow 
            when STOP2 =>
                south_o <= "100";   -- Red 
                west_o  <= "100";   -- Red 
            when SOUTH_GO =>
                south_o <= "010";   -- Green 
                west_o  <= "100";   -- Red 
            when SOUTH_WAIT =>
                south_o <= "110";   -- Yellow
                west_o  <= "100";   -- Red 
            when others =>
                south_o <= "100";   -- Red
                west_o  <= "100";   -- Red
        end case;
    end process p_output_fsm;
```


### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex2.2.png)




------------------------------------------------------------------------
## **Exercise 3: Smart controller**

### **State table**
**Input** | No cars | ```West_i``` | ```West_i``` | ```West_i``` | No cars | ```South_i``` | ```South_I``` | ```South_i``` AND ```West_i``` | ```South_i``` AND ```West_i``` | ```South_i``` AND ```West_i``` | ```South_i``` AND ```West_i```
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
**Delay** | 4 seconds | 1 second | 4 seconds | 4 seconds | 4 seconds | 1 second | 4 seconds | 1 second | 4 seconds | 1 second | 4 seconds 
**State** | ```South_go``` | ```South_wait``` | ```West_go``` | ```West_go``` | ```West_go``` | ```West_wait``` | ```South_go``` | ```South_wait``` | ```West_go``` | ```West_wait``` | ```South_go```
**Output** | S: Green; W: Red | S: Yellow; W: Red | S: Red; W: Green |  S: Red; W: Green | S: Red; W: Green | S: Red; W: Yellow | S: Green; W: Red | S: Yellow; W: Red | S: Red; W: Green | S: Red; W: Yellow | S: Green; W: Red 


### **State diagram**
![State diagram](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Pictures/Ex3.jpg)


### **VHDL code of the sequential process ```p_smart_traffic_fsm```:**
```vhdl 

```





------------------------------------------------------------------------