----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 04:32:47 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

ENTITY TB_4_RCA IS
    --  Port ( );
END TB_4_RCA;

ARCHITECTURE Behavioral OF TB_4_RCA IS
    COMPONENT RCA_4
        PORT (
            A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            C_out : OUT STD_LOGIC;
            Overflow : OUT STD_LOGIC
        );
    END COMPONENT;

    signal A_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal B_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal C_in_tb : STD_LOGIC;
    signal S_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal C_out_tb : STD_LOGIC;
    signal Overflow_tb : STD_LOGIC;
BEGIN

    uut : RCA_4 PORT MAP(
        A => A_tb,
        B => B_tb,
        C_in => C_in_tb,
        S => S_tb,
        C_out => C_out_tb,
        Overflow => Overflow_tb
    );

    PROCESS
    BEGIN
        -- index nu 220727G = 0011 0101 1110 0011 0111
        -- Test case 1: 0111 + 0011 = 1010
        C_in_tb <= '0';

        A_tb <= "0111";
        B_tb <= "0011";

        WAIT FOR 100 ns;

        -- Test case 2: 1110 + 0101 = 0011
        C_in_tb <= '0';

        A_tb <= "1110";
        B_tb <= "0101";

        Wait for 100 ns;

        -- Test case 3: 0101 + 0011 =  1000
        C_in_tb <= '0';
        
        A_tb <= "0101";
        B_tb <= "0011";
        
        WAIT;
    END PROCESS;

END Behavioral;