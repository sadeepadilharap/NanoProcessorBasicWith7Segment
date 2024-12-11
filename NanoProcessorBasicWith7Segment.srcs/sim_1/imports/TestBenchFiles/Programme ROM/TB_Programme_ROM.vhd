----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 10:05:49 AM
-- Design Name: 
-- Module Name: TB_Programme_ROM - Behavioral
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY TB_Programme_ROM IS
    --  Port ( );
END TB_Programme_ROM;

ARCHITECTURE Behavioral OF TB_Programme_ROM IS
    COMPONENT Programme_ROM
        PORT (
            PC_out : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            ROM_out : OUT STD_LOGIC_VECTOR (11 DOWNTO 0));
    END COMPONENT;

    SIGNAL PC_out : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL ROM_out : STD_LOGIC_VECTOR (11 DOWNTO 0);

BEGIN
    UUT : Programme_ROM PORT MAP(
        PC_out => PC_out,
        ROM_out => ROM_out);

    PROCESS
    BEGIN
        PC_out <= "000";
        WAIT FOR 100 ns;
        PC_out <= "001";
        WAIT FOR 100 ns;
        PC_out <= "010";
        WAIT FOR 100 ns;
        PC_out <= "011";
        WAIT FOR 100 ns;
        PC_out <= "100";
        WAIT FOR 100 ns;
        PC_out <= "101";
        WAIT FOR 100 ns;
        PC_out <= "110";
        WAIT FOR 100 ns;
        PC_out <= "111";
        WAIT FOR 100 ns;
        WAIT;
    END PROCESS;
END Behavioral;