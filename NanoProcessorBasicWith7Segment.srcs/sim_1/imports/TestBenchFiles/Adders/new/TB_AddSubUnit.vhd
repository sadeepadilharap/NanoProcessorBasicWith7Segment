----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:17:37 AM
-- Design Name: 
-- Module Name: TB_AddSubUnit - Behavioral
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

ENTITY TB_AddSubUnit IS
    --  Port ( );
END TB_AddSubUnit;

ARCHITECTURE Behavioral OF TB_AddSubUnit IS

    COMPONENT AddSubUnit IS
        PORT (
            R1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            R2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            SubSel : IN STD_LOGIC;
            S : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            OverFlow : INOUT STD_LOGIC;
            Zero : OUT STD_LOGIC;
            Carry : INOUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL R1, R2, S : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL SubSel, OverFlow, Zero, Carry : STD_LOGIC;

BEGIN
    UUT : AddSubUnit PORT MAP(
        R1 => R1,
        R2 => R2,
        SubSel => SubSel,
        S => S,
        OverFlow => OverFlow,
        Zero => Zero,
        Carry => Carry
    );

    PROCESS
    BEGIN
        -- index nu 220727G = 0011 0101 1110 0011 0111

        --Test Case 1 : 0011 + 0011 = 0110
        R1 <= "0011";
        R2 <= "0011";
        SubSel <= '0';

        WAIT FOR 50 ns;

        --Test Case 2 : 0101 - 0011 = 0010
        R1 <= "0101";
        R2 <= "0011";
        SubSel <= '1';

        WAIT FOR 50 ns;

        --Test Case 3 : 0111 - 0111 = 0000 (Zero)
        R1 <= "0111";
        R2 <= "0111";
        SubSel <= '1';

        WAIT FOR 50 ns;

        --Test Case 4 : 0111 + 0111 = 1110 (Overflow)
        R1 <= "0111";
        R2 <= "0111";
        SubSel <= '0';

        WAIT FOR 50 ns;

        --Test Case 5 : 1000 + 1000 = 0000 (Overflow) (not Zero even S = 0000)
        R1 <= "1000";
        R2 <= "1000";
        SubSel <= '0';

        WAIT;
    END PROCESS;
END Behavioral;