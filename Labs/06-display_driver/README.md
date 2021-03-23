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
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    -- 4-bit input values for individual digits
    signal s_data0      : std_logic_vector(4 - 1 downto 0);
    signal s_data1      : std_logic_vector(4 - 1 downto 0);
    signal s_data2      : std_logic_vector(4 - 1 downto 0);
    signal s_data3      : std_logic_vector(4 - 1 downto 0);
    -- 4-bit input value for decimal points
    signal s_dpi        : std_logic_vector(4 - 1 downto 0);
    -- Decimal point for specific digit
    signal s_dpo        : std_logic;
    -- Cathode values for individual segments
    signal s_seg        : std_logic_vector(7 - 1 downto 0);
    -- Common anode signals to individual displays
    signal s_dig        : std_logic_vector(4 - 1 downto 0);
    
begin
    -- Connecting testbench signals with driver_7seg_4digits entity
    -- (Unit Under Test)
    uut_cnt : entity work.driver_7seg_4digits
        port map(
            clk       => s_clk_100MHz,
            reset     => s_reset,
            data0_i   => s_data0,
            data1_i   => s_data1,
            data2_i   => s_data2,
            data3_i   => s_data3,
            dp_i      => s_dpi,
            dp_o      => s_dpo,
            seg_o     => s_seg,
            dig_O     => s_dig  
        
        );
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 40 ms loop         
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 12 ns;
        
        -- Reset activated
        s_reset <= '1';
        wait for 88 ns;

        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    --- WRITE YOUR CODE HERE
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        wait for 100 ns;
        
        s_data3  <= "0011"; -- 3
        s_dpi    <= "0111"; -- .
        s_data2  <= "0001"; -- 1
        s_data1  <= "0100"; -- 4
        s_data0  <= "0010"; -- 2
        
        wait for 1 ms;
        
        assert ((s_dig = "0111") and (s_seg = "0000110") and (s_dpo = '0'))
        report "Test failed for input: 3" severity error;
        wait for 1 ms;
        
        assert ((s_dig = "1011") and (s_seg = "1001111") and (s_dpo = '1'))
        report "Test failed for input: 1" severity error;
        wait for 1 ms;
        
        assert ((s_dig = "1101") and (s_seg = "1001100") and (s_dpo = '1'))
        report "Test failed for input: 4" severity error;
        wait for 1 ms;
        
        assert ((s_dig = "1110") and (s_seg = "0010010") and (s_dpo = '1'))
        report "Test failed for input: 2" severity error;
        wait for 1 ms;     
             
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
   
end architecture testbench;
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