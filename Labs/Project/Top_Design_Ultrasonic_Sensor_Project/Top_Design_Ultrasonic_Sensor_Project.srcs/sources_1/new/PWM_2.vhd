
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------------------
-- Entity declaration for display driver
------------------------------------------------------------------------
entity PWM_2 is
    port(
        clk          : in  std_logic;                        -- Main clock
        reset        : in  std_logic;                        -- Synchronous reset
        PWM2_en_i    : in  std_logic;                        -- Enable signal of the PWM_1 module to let this module know that it has to start counting.
        PWMOutput_o  : out std_logic;                        -- Output of the PWM_1 module (signal goes to buzzer)
        cntTest2_o   : out std_logic_vector(7 - 1 downto 0)  -- This is used for testing purpose and can be removed. Shows us the counter value.
    );
end entity PWM_2;

------------------------------------------------------------------------
-- Architecture declaration for display driver
------------------------------------------------------------------------
architecture Behavioral of PWM_2 is

    signal internalReset : std_logic;                         -- Used to have second reset for the module. Separate from the button reset.
    signal s_en          : std_logic;                         -- Internal clock enable 
    signal s_cnt         : std_logic_vector(7 - 1 downto 0);  -- Internal 7-bit counter

begin
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates an enable pulse
    -- every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 400000
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity performs a 7-bit counter
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH  => 7
        )
        port map(
            clk             => clk,
            internalReset   => internalreset,
            reset           => reset,
            en_i            => PWM2_en_i,
            cnt_up_i        => '1',            -- Tells the counter to only count up.
            cnt_o           => s_cnt    
        );

    --------------------------------------------------------------------
    p_counter : process(s_cnt)
    begin
        case s_cnt is
            when "0000001" =>         -- At count 1 the PWM module sends out 1 quick signal and internal reset is 0
                PWMOutput_O   <= '1';
                internalReset <= '0';
                
            when "0110011" =>         -- At count 51 the PWM module sends out 1 quick signal and internal reset is 0
                PWMOutput_O   <= '1';
                internalReset <= '0';
            
            when "1100100" =>         -- At count 100 the internal reset is 1 and resets the counter 
                internalReset <= '1';
                
            when others =>            -- At all other numbers the PWM module sends out no signals and internal reset is 0
                PWMOutput_O   <= '0';
                internalReset <= '0';
        end case;
    end process p_counter;
    
cntTest2_o <= std_logic_vector(s_cnt); -- To be able to see the counter values.
end architecture Behavioral;