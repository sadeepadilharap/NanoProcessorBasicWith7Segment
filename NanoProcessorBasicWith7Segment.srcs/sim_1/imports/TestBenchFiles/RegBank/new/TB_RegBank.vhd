----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:21:55 AM
-- Design Name: 
-- Module Name: TB_RegBank - Behavioral
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

entity TB_RegBank is
--  Port ( );
end TB_RegBank;

architecture Behavioral of TB_RegBank is

-- Component Declaration for the Unit Under Test (UUT)
component RegBankv2
port (
reg_en      : in  std_logic_vector(2 downto 0);
clk         : in  std_logic;
reset_bank  : in  std_logic;
data_in     : in  std_logic_vector(3 downto 0);
data_out_0  : out std_logic_vector(3 downto 0);
data_out_1  : out std_logic_vector(3 downto 0);
data_out_2  : out std_logic_vector(3 downto 0);
data_out_3  : out std_logic_vector(3 downto 0);
data_out_4  : out std_logic_vector(3 downto 0);
data_out_5  : out std_logic_vector(3 downto 0);
data_out_6  : out std_logic_vector(3 downto 0);
data_out_7  : out std_logic_vector(3 downto 0)
);
end component;

-- Inputs signals

signal reg_en     : std_logic_vector(2 downto 0) := (others => '0');
signal clk        : std_logic := '0';
signal reset_bank : std_logic := '0';
signal data_in    : std_logic_vector(3 downto 0) := (others => '0');

-- Outputs signals

signal data_out_0, data_out_1, data_out_2, data_out_3,
      data_out_4, data_out_5, data_out_6, data_out_7 : std_logic_vector(3 downto 0);

-- Clock period

constant clk_period : time := 10 ns;

begin
-- Instantiate the Unit Under Test (UUT)
uut : RegBankv2
port map (
   reg_en      => reg_en,
   clk         => clk,
   reset_bank  => reset_bank,
   data_in     => data_in,
   data_out_0  => data_out_0,
   data_out_1  => data_out_1,
   data_out_2  => data_out_2,
   data_out_3  => data_out_3,
   data_out_4  => data_out_4,
   data_out_5  => data_out_5,
   data_out_6  => data_out_6,
   data_out_7  => data_out_7
);


process
 begin
 --wait for 1ns
 clk<=not(clk);
 wait for 1ns;
end process;

-- Stimulus process
stim_proc : process
begin
-- Reset the register bank
reset_bank <= '1';
wait for 25ns;
reset_bank <= '0';

--INDEX NUMBER -220154 : 0011 0101 1011 1111 1010
-- Write data to register 1
reg_en   <= "001";
data_in  <= "0011";
wait for 50ns;

-- Write data to register 2
reg_en   <= "010";
data_in  <= "0101";
wait for 50ns;


-- Write data to register 3
reg_en   <= "011";
data_in  <= "1010";
wait for 50ns;

-- Write data to register 4
reg_en   <= "100";
data_in  <= "1111";
wait for 50ns;

wait; -- End the simulation
end process;

end Behavioral;
