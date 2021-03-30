----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2021 12:13:46 PM
-- Design Name: 
-- Module Name: jk_ff_rst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jk_ff_rst is
    Port ( 
           clk   : in STD_LOGIC;
           j     : in STD_LOGIC;
           k     : in STD_LOGIC;
           rst   : in STD_LOGIC;
           q     : out STD_LOGIC;
           q_bar : out STD_LOGIC
          );
end jk_ff_rst;

architecture Behavioral of jk_ff_rst is

    signal s_q     : STD_LOGIC;
    signal s_q_bar : STD_LOGIC;
    
begin
       p_jk_ff_rst : process (clk)
       begin
            if rising_edge(clk) then
                if (rst = '1') then
                    q     <= '0';
                    q_bar <= '1';
                else
                    if (j = '0' AND k = '0') then
                        s_q     <= s_q;
                        s_q_bar <= s_q_bar;
                    elsif (j = '0' AND k = '1') then
                        s_q     <= '0';
                        s_q_bar <= '0';
                    elsif (j = '1' AND k = '0') then
                        s_q     <= '1';
                        s_q_bar <= '1';
                    else
                        s_q     <= not s_q;
                        s_q_bar <= not s_q_bar;
                    end if;
                end if;
            end if;
       end process p_jk_ff_rst;
       
       q     <= s_q;
       q_bar <= s_q_bar;
       
end Behavioral;
