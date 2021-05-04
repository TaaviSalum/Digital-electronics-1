
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_LED_decoder is
--  Port ( );
end tb_LED_decoder;

architecture Behavioral of tb_LED_decoder is

    signal s_DecoderInput    : std_logic_vector(4 - 1 downto 0);  -- Input signal which controls the LEDs; Signal comes from top design
    signal s_Green1          : std_logic;                         -- Output signal which controls 1st Green LED; CK IO30 - R11
    signal s_Green2          : std_logic;                         -- Output signal which controls 2nd Green LED; CK IO29 - R10
    signal s_Green3          : std_logic;                         -- Output signal which controls 3rd Green LED; CK IO28 - M13
    signal s_Yellow1         : std_logic;                         -- Output signal which controls 1st Yellow LED; CK IO27 - V16
    signal s_Yellow2         : std_logic;                         -- Output signal which controls 2nd Yellow LED; CK IO26 - U11
    signal s_Yellow3         : std_logic;                         -- Output signal which controls 3rd Yellow LED; CK IO7 - T16
    signal s_Yellow4         : std_logic;                         -- Output signal which controls 4th Yellow LED; CK IO6 - T15
    signal s_Red1            : std_logic;                         -- Output signal which controls 1st Red LED; CK IO5 - T14
    signal s_Red2            : std_logic;                         -- Output signal which controls 2nd Red LED; CK IO4 - R12
    signal s_Red3            : std_logic;                         -- Output signal which controls 3rd Red LED; CK IO3 - T11
    
begin

    uut_LED_decoder : entity work.LED_decoder
        port map(
            DecoderInput_i  => s_DecoderInput,
            Green1_o        => s_Green1,
            Green2_o        => s_Green2,
            Green3_o        => s_Green3,
            Yellow1_o       => s_Yellow1,
            Yellow2_o       => s_Yellow2,
            Yellow3_o       => s_Yellow3,
            Yellow4_o       => s_Yellow4,
            Red1_o          => s_Red1,
            Red2_o          => s_Red2,
            Red3_o          => s_Red3
        );

    p_stimulus : process
    begin
        
        report "Stimulus process started" severity note;
        
        s_DecoderInput <= "0000"; -- Input 0
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '0') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0000 - 0" severity error;
        
        s_DecoderInput <= "0001"; -- Input 1 (Quick test)
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0001 - 1" severity error;
        
        s_DecoderInput <= "0000"; -- Input 0 (Full reset)
        wait for 50 ns;
        -- Expected output
        assert ((s_Green1 = '0') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0000 - 0" severity error;
        
        s_DecoderInput <= "0001"; -- Input 1
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0001 - 1" severity error;
        
        s_DecoderInput <= "0010"; -- Input 2
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0010 - 2" severity error;
        
        s_DecoderInput <= "0011"; -- Input 3
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0011 - 3" severity error;
        
        s_DecoderInput <= "0100"; -- Input 4
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '1') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0100 - 4" severity error;
        
        s_DecoderInput <= "0101"; -- Input 5
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '1') AND (s_Yellow2 = '1') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0101 - 5" severity error;
        
        s_DecoderInput <= "0110"; -- Input 6
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '1') AND (s_Yellow2 = '1') AND (s_Yellow3 = '1') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0110 - 6" severity error;
        
        s_DecoderInput <= "0111"; -- Input 7
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '1') AND (s_Yellow2 = '1') AND (s_Yellow3 = '1') AND (s_Yellow4 = '1') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0111 - 7" severity error;
        
        s_DecoderInput <= "1000"; -- Input 8
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '1') AND (s_Yellow2 = '1') AND (s_Yellow3 = '1') AND (s_Yellow4 = '1') AND (s_Red1 = '1') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 1000 - 8" severity error;
        
        s_DecoderInput <= "1001"; -- Input 9
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '1') AND (s_Yellow2 = '1') AND (s_Yellow3 = '1') AND (s_Yellow4 = '1') AND (s_Red1 = '1') AND (s_Red2 = '1') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 1001 - 9" severity error;
        
        s_DecoderInput <= "1010"; -- Input 10
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '1') AND (s_Yellow2 = '1') AND (s_Yellow3 = '1') AND (s_Yellow4 = '1') AND (s_Red1 = '1') AND (s_Red2 = '1') AND (s_Red3 = '1'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 1010 - 10" severity error;
        
        s_DecoderInput <= "1011"; -- Input 11 (Error Test)
        wait for 50 ns;
        -- Expected output
        assert ((s_Green1 = '0') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 1011 - 11" severity error;
        
        s_DecoderInput <= "1100"; -- Input 12 (Error Test)
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '0') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 1100 - 12" severity error;
        
        s_DecoderInput <= "1101"; -- Input 13 (Error Test)
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '0') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 1101 - 13" severity error;
        
        s_DecoderInput <= "1110"; -- Input 14 (Error Test)
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '0') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 1110 - 14" severity error;
        
        s_DecoderInput <= "1111"; -- Input 15 (Error Test)
        wait for 10 ns;
        -- Expected output
        assert ((s_Green1 = '0') AND (s_Green2 = '0') AND (s_Green3 = '0') AND (s_Yellow1 = '0') AND (s_Yellow2 = '0') AND (s_Yellow3 = '0') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 1111 - 15" severity error;
        
        s_DecoderInput <= "0110"; -- Input 6 (Error Test)
        wait for 100 ns;
        -- Expected output
        assert ((s_Green1 = '1') AND (s_Green2 = '1') AND (s_Green3 = '1') AND (s_Yellow1 = '1') AND (s_Yellow2 = '1') AND (s_Yellow3 = '1') AND (s_Yellow4 = '0') AND (s_Red1 = '0') AND (s_Red2 = '0') AND (s_Red3 = '0'))
        -- If false, then report an error
        report "Test failed if DecoderInput is 0110 - 6" severity error;
        
        report "Stimulus process finished" severity note;
        
    end process p_stimulus;             

end architecture Behavioral;