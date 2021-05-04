
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_decoder is
    Port ( 
            DecoderInput_i  : in  std_logic_vector(4 - 1 downto 0);  -- Input signal which controls the LEDs; Signal comes from top design
            Green1_o        : out std_logic;                         -- Output signal which controls 1st Green LED; CK IO30 - R11
            Green2_o        : out std_logic;                         -- Output signal which controls 2nd Green LED; CK IO29 - R10
            Green3_o        : out std_logic;                         -- Output signal which controls 3rd Green LED; CK IO28 - M13
            Yellow1_o       : out std_logic;                         -- Output signal which controls 1st Yellow LED; CK IO27 - V16
            Yellow2_o       : out std_logic;                         -- Output signal which controls 2nd Yellow LED; CK IO26 - U11
            Yellow3_o       : out std_logic;                         -- Output signal which controls 3rd Yellow LED; CK IO7 - T16
            Yellow4_o       : out std_logic;                         -- Output signal which controls 4th Yellow LED; CK IO6 - T15
            Red1_o          : out std_logic;                         -- Output signal which controls 1st Red LED; CK IO5 - T14
            Red2_o          : out std_logic;                         -- Output signal which controls 2nd Red LED; CK IO4 - R12
            Red3_o          : out std_logic                          -- Output signal which controls 3rd Red LED; CK IO3 - T11
    );
end LED_decoder;

architecture Behavioral of LED_decoder is
begin
                -- DecoderInput_i "0000" is when every output is turned off
                -- DecoderInput_i "1011" is when every output is turned off
                -- DecoderInput_i "1100" is when every output is turned off
                -- DecoderInput_i "1101" is when every output is turned off
                -- DecoderInput_i "1110" is when every output is turned off
                -- DecoderInput_i "1111" is when every output is turned off
    
    Green1_o <= '1' when (DecoderInput_i = "0001") else -- Input 1
                '1' when (DecoderInput_i = "0010") else -- Input 2
                '1' when (DecoderInput_i = "0011") else -- Input 3
                '1' when (DecoderInput_i = "0100") else -- Input 4
                '1' when (DecoderInput_i = "0101") else -- Input 5
                '1' when (DecoderInput_i = "0110") else -- Input 6
                '1' when (DecoderInput_i = "0111") else -- Input 7
                '1' when (DecoderInput_i = "1000") else -- Input 8
                '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';
                
    Green2_o <= '1' when (DecoderInput_i = "0010") else -- Input 2
                '1' when (DecoderInput_i = "0011") else -- Input 3
                '1' when (DecoderInput_i = "0100") else -- Input 4
                '1' when (DecoderInput_i = "0101") else -- Input 5
                '1' when (DecoderInput_i = "0110") else -- Input 6
                '1' when (DecoderInput_i = "0111") else -- Input 7
                '1' when (DecoderInput_i = "1000") else -- Input 8
                '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';           
 
    Green3_o <= '1' when (DecoderInput_i = "0011") else -- Input 3
                '1' when (DecoderInput_i = "0100") else -- Input 4
                '1' when (DecoderInput_i = "0101") else -- Input 5
                '1' when (DecoderInput_i = "0110") else -- Input 6
                '1' when (DecoderInput_i = "0111") else -- Input 7
                '1' when (DecoderInput_i = "1000") else -- Input 8
                '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';      
                
    Yellow1_o <='1' when (DecoderInput_i = "0100") else -- Input 4
                '1' when (DecoderInput_i = "0101") else -- Input 5
                '1' when (DecoderInput_i = "0110") else -- Input 6
                '1' when (DecoderInput_i = "0111") else -- Input 7
                '1' when (DecoderInput_i = "1000") else -- Input 8
                '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0'; 
                    
    Yellow2_o <='1' when (DecoderInput_i = "0101") else -- Input 5
                '1' when (DecoderInput_i = "0110") else -- Input 6
                '1' when (DecoderInput_i = "0111") else -- Input 7
                '1' when (DecoderInput_i = "1000") else -- Input 8
                '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';
                
    Yellow3_o <='1' when (DecoderInput_i = "0110") else -- Input 6
                '1' when (DecoderInput_i = "0111") else -- Input 7
                '1' when (DecoderInput_i = "1000") else -- Input 8
                '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';

    Yellow4_o <='1' when (DecoderInput_i = "0111") else -- Input 7
                '1' when (DecoderInput_i = "1000") else -- Input 8
                '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';

    Red1_o <=   '1' when (DecoderInput_i = "1000") else -- Input 8
                '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';      
                
    Red2_o <=   '1' when (DecoderInput_i = "1001") else -- Input 9
                '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';  
                
    Red3_o <=   '1' when (DecoderInput_i = "1010") else -- Input 10
                '0';   
                                                      
end architecture Behavioral;