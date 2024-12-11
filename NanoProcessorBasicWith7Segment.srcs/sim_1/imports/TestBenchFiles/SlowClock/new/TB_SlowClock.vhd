----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 09:26:46 PM
-- Design Name: 
-- Module Name: TB_SlowClock - Behavioral
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

ENTITY TB_SlowClock IS
    --  Port ( );
END TB_SlowClock;

ARCHITECTURE Behavioral OF TB_SlowClock IS

    COMPONENT Slow_Clk IS
        PORT (
            Clk_in : IN STD_LOGIC;
            Clk_out : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL Clk_in : STD_LOGIC := '0';
    SIGNAL Clk_out : STD_LOGIC;

BEGIN
    
        UUT : Slow_Clk
        PORT MAP (
            Clk_in => Clk_in,
            Clk_out => Clk_out);
    
        --Clock process
        Clk_Process : PROCESS
        BEGIN
            Clk_in <= NOT Clk_in;
            WAIT FOR 5 ns;
        END PROCESS Clk_Process;
        
END Behavioral;