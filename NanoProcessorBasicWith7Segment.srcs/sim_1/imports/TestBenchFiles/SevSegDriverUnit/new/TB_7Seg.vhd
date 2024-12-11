----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 05:26:51 PM
-- Design Name: 
-- Module Name: TB_7Seg - Behavioral
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

ENTITY TB_7Seg IS
    --  Port ( );
END TB_7Seg;

ARCHITECTURE Behavioral OF TB_7Seg IS

    COMPONENT SevenSegDriver IS
        PORT (
            Clk : IN STD_LOGIC;
            Data : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Reset : IN STD_LOGIC;
            Address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            LightOut : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
            Anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    signal Clk : STD_LOGIC := '0';
    signal Data : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    signal LightOut : STD_LOGIC_VECTOR (6 DOWNTO 0);
    signal Reset : STD_LOGIC := '0';
    signal Anode : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal Address : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";


    BEGIN

    UUT: SevenSegDriver PORT MAP (
        Clk => Clk,
        Data => Data,
        Address => Address,
        LightOut => LightOut,
        Reset => Reset,
        Anode => Anode);

        --Clock Process
        ClkProcess: PROCESS
        begin
            wait for 10ns;
            Clk <= not Clk;
        end process;

        --Stimulus Process
        Stimulus: PROCESS
        begin
            Reset <= '1';
            wait for 100ns;

            Reset <= '0';

            -- INDEX NU 220727G - 110101111000110111
            -- 11 0101 1110 0011 0111
            -- 110 101 111 000 110 111
            

            Data <= "1101";
            Address <= "110";
            wait for 100ns;

            Data <= "1110";
            Address <= "101";
            wait for 100ns;

            Data <= "0011";
            Address <= "111";
            wait for 100ns;

            Data <= "0111";
            Address <= "000";
            wait for 100ns;
        end process;

    END Behavioral;