# **Digital-electronics-1**
# **Laboratory #5**


------------------------------------------------------------------------
## **Exercise 1: Preparation tasks**

### **Connection of push buttons on Nexys A7 board**
![Nexys A7 board](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/05-counter/Pictures/Ex1.png)


### **Table with calculated values**
**Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** 
--- | --- | --- | --- 
2 ms | 200 000 | x"3_0d40" | b"0011_0000_1101_0100_0000"  
4 ms | 400 000 | x"6_1A80" | b"0110_0001_1010_1000_0000" 
10 ms | 1 000 000  | x"F_4240" | b"1111_0100_0010_0100_0000" 
250 ms | 250 000 000 | x"EE6_B280" | b"1110_1110_0110_1011_0010_1000_0000" 
500 ms | 500 000 000 | x"1DCD_6500" | b"0001_1101_1100_1101_0110_0101_0000_0000" 
1 sec | 1 000 000 000 | x"3B9A_CA00" | b"0011_1011_1001_1010_1100_1010_0000_0000" 






------------------------------------------------------------------------
## **Exercise 2: Bidirectional counter**

### **VHDL code of the process:**
```vhdl 
p_cnt_up_down : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then               -- Synchronous reset
                s_cnt_local <= (others => '0'); -- Clear all bits

            elsif (en_i = '1' AND cnt_up_i = '1') then    -- Adds +1 if enable is '1' and count up is '1'
                s_cnt_local <= s_cnt_local + 1;

                -- TEST COUNTER DIRECTION HERE
            elsif (en_i = '1' AND cnt_up_i = '0') then    -- Adds -1 if enable is '1' and count up is '0'
                s_cnt_local <= s_cnt_local - 1;


            end if;
        end if;
    end process p_cnt_up_down;
```

### **VHDL reset and stimulus processes from testbench file:**
```vhdl 
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 12 ns;
        
        -- Reset activated
        s_reset <= '1';
        wait for 73 ns;

        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- Enable counting
        s_en     <= '1';
        
        s_cnt_up <= '1';
        wait for 380 ns;
        s_cnt_up <= '0';
        wait for 380 ns;


        -- Disable counting
        s_en     <= '0';

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

### **Simulated time waveforms**
![Simulated time waveforms](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/05-counter/Pictures/Ex2.png)





------------------------------------------------------------------------
## **Exercise 3: Top level**

### **VHDL code from source file**
```vhdl 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (0 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

    -- Internal clock enable
    signal s_en  : std_logic;
    -- Internal counter
    signal s_cnt : std_logic_vector(4 - 1 downto 0);

begin

    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 10
        )
        port map(
            clk   => CLK100MHZ,
            reset => BTNC,
            ce_o  => s_en
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH  => 4
        )
        port map(
            clk         => CLK100MHZ,
            reset       => BTNC,
            en_i        => s_en,
            cnt_up_i    => SW(0),
            cnt_o       => s_cnt
        );

    -- Display input value on LEDs
    LED(3 downto 0) <= s_cnt;

    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => s_cnt,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );

    -- Connect one common anode to 3.3V
    AN <= b"1111_1110";
              
end architecture Behavioral;
```

### **Sketch of the top layer:**
![Sketch of the top layer](https://github.com/TaaviSalum/Digital-electronics-1/blob/main/Labs/05-counter/Pictures/Ex3.png)





------------------------------------------------------------------------