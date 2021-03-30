----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 06:49:10 PM
-- Design Name: 
-- Module Name: t_ff_rst - Behavioral
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

entity t_ff_rst is
    Port ( 
           clk   : in STD_LOGIC;
           t     : in STD_LOGIC;
           rst  : in STD_LOGIC;
           q     : out STD_LOGIC;
           q_bar : out STD_LOGIC);
end t_ff_rst;

architecture Behavioral of t_ff_rst is

    signal s_q     : STD_LOGIC;
    signal s_q_bar : STD_LOGIC;
    
begin

    p_t_ff_rst : process (clk)
        begin
            if rising_edge(clk) then
                if (rst = '1') then
                    s_q <= '0';
                elsif (t = '1') then
                    s_q <= not s_q;
                end if;
            end if;
    end process p_t_ff_rst;

    q <= s_q;
    q_bar <= not s_q;

end Behavioral;