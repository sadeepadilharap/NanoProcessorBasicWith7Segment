LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY InstructionDecoder IS
    PORT (
        Ins : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
        RegChk : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        RegEn : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        LoadSel : OUT STD_LOGIC;
        ImVal : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        RegSel1 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        RegSel2 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        AddSubSel : OUT STD_LOGIC;
        JumpFlg : OUT STD_LOGIC;
        JumpAdd : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
    );
END InstructionDecoder;

ARCHITECTURE Behavioral OF InstructionDecoder IS
BEGIN
    PROCESS (RegChk, Ins)
    BEGIN
         CASE Ins(11 DOWNTO 10) IS
             WHEN "10" => -- MOVI
                 AddSubSel <= '0';
                 LoadSel <= '1';
                 JumpFlg <= '0';
             WHEN "00" => -- ADD
                 AddSubSel <= '0';
                 LoadSel <= '0';
                 JumpFlg <= '0';
             WHEN "01" => -- NEG
                 AddSubSel <= '1';
                 LoadSel <= '0';
                 JumpFlg <= '0';
             WHEN "11" => -- JZR
                 AddSubSel <= '0';
                 LoadSel <= '0';
                 IF RegChk = "0000" THEN
                     JumpFlg <= '1';
                 ELSE
                     JumpFlg <= '0';
                 END IF;
             WHEN OTHERS => -- Default
                 AddSubSel <= '0';
                 LoadSel <= '0';
                 JumpFlg <= '0';
         END CASE;
         RegEn <= Ins(9 DOWNTO 7);
         RegSel1 <= Ins(9 DOWNTO 7);
         RegSel2 <= Ins(6 DOWNTO 4);
         JumpAdd <= Ins(2 DOWNTO 0);
         ImVal <= Ins(3 DOWNTO 0);
    END PROCESS;
END Behavioral;