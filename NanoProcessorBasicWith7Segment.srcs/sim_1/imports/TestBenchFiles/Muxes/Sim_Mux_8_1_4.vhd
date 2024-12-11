----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2024 12:14:02 AM
-- Design Name: 
-- Module Name: Sim_Mux_8_1_4 - Behavioral
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

entity Sim_Mux_8_1_4 is
--  Port ( );
end Sim_Mux_8_1_4;

architecture Behavioral of Sim_Mux_8_1_4 is
component Mux_8_1_4 
    Port ( RegSel : in STD_LOGIC_VECTOR (2 downto 0);
            Reg_0 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_1 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_2 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_3 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_4 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_5 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_6 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_7 : in STD_LOGIC_VECTOR (3 downto 0);
            O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal regsel : STD_LOGIC_VECTOR (2 downto 0);
signal reg_0, reg_1, reg_2, reg_3, reg_4, reg_5, reg_6, reg_7, mux_out : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT: Mux_8_1_4 port map (
        RegSel => regsel,
        Reg_0 => reg_0,
        Reg_1 => reg_1,
        Reg_2 => reg_2,
        Reg_3 => reg_3,
        Reg_4 => reg_4,
        Reg_5 => reg_5,
        Reg_6 => reg_6,
        Reg_7 => reg_7,
        O => mux_out
    );

    process
    begin
        regsel <= "000";
        reg_0 <= "0000";
        reg_1 <= "0001";
        reg_2 <= "0010";
        reg_3 <= "0011";
        reg_4 <= "0100";
        reg_5 <= "0101";
        reg_6 <= "0110";
        reg_7 <= "0111";
        wait for 50 ns;
        
        regsel <= "001";
        reg_0 <= "1000";
        reg_1 <= "1001";
        reg_2 <= "1010";
        reg_3 <= "1011";
        reg_4 <= "1100";
        reg_5 <= "1101";
        reg_6 <= "1110";
        reg_7 <= "1111";
        wait for 50 ns;
        
        regsel <= "010";
        reg_0 <= "0000";
        reg_1 <= "0001";
        reg_2 <= "0010";
        reg_3 <= "0011";
        reg_4 <= "0100";
        reg_5 <= "0101";
        reg_6 <= "0110";
        reg_7 <= "0111";
        wait for 50 ns;
        
        regsel <= "011";
        reg_0 <= "1000";
        reg_1 <= "1001";
        reg_2 <= "1010";
        reg_3 <= "1011";
        reg_4 <= "1100";
        reg_5 <= "1101";
        reg_6 <= "1110";
        reg_7 <= "1111";
        wait for 50 ns;
        
        regsel <= "100";
        reg_0 <= "0000";
        reg_1 <= "0001";
        reg_2 <= "0010";
        reg_3 <= "0011";
        reg_4 <= "0100";
        reg_5 <= "0101";
        reg_6 <= "0110";
        reg_7 <= "0111";
        wait for 50 ns;
        
        regsel <= "101";
        reg_0 <= "1000";
        reg_1 <= "1001";
        reg_2 <= "1010";
        reg_3 <= "1011";
        reg_4 <= "1100";
        reg_5 <= "1101";
        reg_6 <= "1110";
        reg_7 <= "1111";
        wait;
    end process;

end Behavioral;
