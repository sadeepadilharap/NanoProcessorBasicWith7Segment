----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 10:54:33 PM
-- Design Name: 
-- Module Name: Sim_Mux_2_1_4 - Behavioral
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

entity Sim_Mux_2_1_4 is
--  Port ( );
end Sim_Mux_2_1_4;

architecture Behavioral of Sim_Mux_2_1_4 is
component Mux_2_1_4 
    Port ( IN_0 : in STD_LOGIC_VECTOR (3 downto 0);
            IN_1 : in STD_LOGIC_VECTOR (3 downto 0);
            SEL : in STD_LOGIC;
            O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal in_0, in_1, mux_out : STD_LOGIC_VECTOR (3 downto 0);
signal sel : STD_LOGIC;

begin
    UUT: Mux_2_1_4 port map (
        IN_0 => in_0,
        IN_1 => in_1,
        SEL => sel,
        O => mux_out
    );

    process
    begin   
        sel <= '0';
        in_0 <= "0010";
        in_1 <= "1010";
        wait for 50 ns;

        in_0 <= "0101";
        in_1 <= "1101";
        wait for 50 ns;

        sel <= '1';
        in_0 <= "0111";
        in_1 <= "1111";
        wait for 50 ns;

        in_0 <= "1000";
        in_1 <= "0001";
        wait;

    end process;


end Behavioral;
