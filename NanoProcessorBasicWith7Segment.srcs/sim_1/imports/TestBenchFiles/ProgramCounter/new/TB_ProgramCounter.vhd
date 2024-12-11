----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 03:50:03 AM
-- Design Name: 
-- Module Name: TB_ProgramCounter - Behavioral
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

ENTITY TB_ProgramCounter IS
    --  Port ( );
END TB_ProgramCounter;

ARCHITECTURE Behavioral OF TB_ProgramCounter IS

    COMPONENT ProgramCounter IS
        PORT (
            AddressIn : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            AddressOut : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            Clk : IN STD_LOGIC;
            Reset : IN STD_LOGIC);
    END COMPONENT;

    signal AddressIn : STD_LOGIC_VECTOR(2 DOWNTO 0);
    signal AddressOut : STD_LOGIC_VECTOR(2 DOWNTO 0);
    signal Clk : STD_LOGIC := '0';
    signal Reset : STD_LOGIC;
BEGIN
    uut : ProgramCounter PORT MAP(
        AddressIn => AddressIn,
        AddressOut => AddressOut,
        Clk => Clk,
        Reset => Reset);

    --Clock process
    ClkProcess : PROCESS
    begin 
        wait for 10 ns;
        Clk <= not Clk;
    end process;

    --Simulation
    Simulation : PROCESS
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';

        --INDEX NU 220727G = 110 101 111 000 110 111
        AddressIn <= "110";
        wait for 50 ns;
        AddressIn <= "101";
        wait for 50 ns;
        AddressIn <= "111";
        wait for 50 ns;
        AddressIn <= "000";
        wait for 50 ns;
        AddressIn <= "110";
        wait for 50 ns;
        AddressIn <= "111";
        wait for 50 ns;
        AddressIn <= "000";
        wait;
    end process;
END Behavioral;