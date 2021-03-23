# **Digital-electronics-1**
# **Laboratory #6**


------------------------------------------------------------------------
## **Exercise 1: Preparation tasks**

### **Timing diagram figure for displaying value ```3.142```**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/06-display_driver/Pictures/Ex1.png)





------------------------------------------------------------------------
## **Exercise 2: Display driver**

### **VHDL code of the process ```p_mux```:**
```vhdl 
    p_mux : process(s_cnt, data0_i, data1_i, data2_i, data3_i, dp_i)
    begin
        case s_cnt is
            when "11" =>
                s_hex <= data3_i;
                dp_o  <= dp_i(3);
                dig_o <= "0111";

            when "10" =>
                s_hex <= data2_i;
                dp_o  <= dp_i(2);
                dig_o <= "1011";

            when "01" =>
                s_hex <= data1_i;
                dp_o  <= dp_i(1);
                dig_o <= "1101";

            when others =>
                s_hex <= data0_i;
                dp_o  <= dp_i(0);
                dig_o <= "1110";
        end case;
    end process p_mux;
```


### **VHDL testbench file ```tb_driver_7seg_4digits```:**
```vhdl 

```


### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/06-display_driver/Pictures/Ex2.png)


### **VHDL code of the top layer architecture:**
```vhdl 
architecture Behavioral of top is
    -- No internal signals
begin

    --------------------------------------------------------------------
    -- Instance (copy) of driver_7seg_4digits entity
    driver_seg_4 : entity work.driver_7seg_4digits
        port map(
            clk        => CLK100MHZ,
            reset      => BTNC,
            data0_i(3) => SW(3),
            data0_i(2) => SW(2),
            data0_i(1) => SW(1),
            data0_i(0) => SW(0),
            data1_i(3) => SW(7),
            data1_i(2) => SW(6),
            data1_i(1) => SW(5),
            data1_i(0) => SW(4),
            data2_i(3) => SW(11),
            data2_i(2) => SW(10),
            data2_i(1) => SW(9),
            data2_i(0) => SW(8),
            data3_i(3) => SW(15),
            data3_i(2) => SW(14),
            data3_i(1) => SW(13),
            data3_i(0) => SW(12),
            
            dp_i       => "0111",
            dp_o       => DP,
            seg_o(6)   => CA,
            seg_o(5)   => CB,
            seg_o(4)   => CC,
            seg_o(3)   => CD,
            seg_o(2)   => CE,
            seg_o(1)   => CF,
            seg_o(0)   => CG,
            dig_o(3)   => AN(3), 
            dig_o(2)   => AN(2), 
            dig_o(1)   => AN(1), 
            dig_o(0)   => AN(0) 
            
        );

    -- Disconnect the top four digits of the 7-segment display
    AN(7 downto 4) <= b"1111";

end architecture Behavioral;
``` 





------------------------------------------------------------------------
## **Exercise 3: Eight-digit driver**

### **Sketch of the driver schematic:**
![Sketch of the driver schematic](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/06-display_driver/Pictures/Ex3.jpg)





------------------------------------------------------------------------