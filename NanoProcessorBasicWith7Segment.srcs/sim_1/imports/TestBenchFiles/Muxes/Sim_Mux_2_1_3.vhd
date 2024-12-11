----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 08:42:14 PM
-- Design Name: 
-- Module Name: Sim_Mux_2_1_3 - Behavioral
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

entity Sim_Mux_2_1_3 is
--  Port ( );
end Sim_Mux_2_1_3;

architecture Behavioral of Sim_Mux_2_1_3 is
component Mux_2_1_3 
    Port ( IN_0 : in STD_LOGIC_VECTOR (2 downto 0);
            IN_1 : in STD_LOGIC_VECTOR (2 downto 0);
            SEL : in STD_LOGIC;
            O : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal in_0, in_1, mux_out : STD_LOGIC_VECTOR(2 downto 0);
signal sel : STD_LOGIC;

begin
    UUT: Mux_2_1_3 port map(
        IN_0 => in_0,
        IN_1 => in_1,
        SEL => sel,
        O => mux_out
    );
    
    process
        begin   
            sel <= '0';
            in_0 <= "001";
            in_1 <= "101";
            wait for 50 ns;

            in_0 <= "010";
            in_1 <= "110";
            wait for 50 ns;

            sel <= '1';
            in_0 <= "011";
            in_1 <= "111";
            wait for 50 ns;

            in_0 <= "100";
            in_1 <= "000";
            wait;
    
        end process;



end Behavioral;
