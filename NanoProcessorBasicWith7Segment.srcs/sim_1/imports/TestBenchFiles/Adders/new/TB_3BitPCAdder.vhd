----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 03:41:02 AM
-- Design Name: 
-- Module Name: TB_3BitPCAdder - Behavioral
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

ENTITY TB_3BitPCAdder IS
    --  Port ( );
END TB_3BitPCAdder;

ARCHITECTURE Behavioral OF TB_3BitPCAdder IS

    COMPONENT PCAdder IS
        PORT (
            I1 : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            I2 : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            S : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
    END COMPONENT;

    SIGNAL I1 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
    SIGNAL I2 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
    SIGNAL S : STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

    UUT : PCAdder PORT MAP(
        I1 => I1,
        I2 => I2,
        S => S
    );

    PROCESS
    BEGIN
        WAIT FOR 50 ns;

        -- index nu 220727G = 110 101 111 000 110 111
        I1 <= "110";
        I2 <= "111";
        WAIT FOR 50 ns;

        I1 <= "111";
        I2 <= "000";
        WAIT FOR 50 ns;

        I1 <= "110";
        I2 <= "111";

        WAIT;
    END PROCESS;
END Behavioral;