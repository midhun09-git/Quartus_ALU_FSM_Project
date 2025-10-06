library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity ALU is
port
(
A,B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
OP : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
RESULT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
CARRY : OUT STD_LOGIC
);
end ALU;

Architecture Behavioral of ALU is
Signal ALU_RESULT : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin
Process(A,B,OP)
begin
case(OP) is
when "000" => --addition
ALU_RESULT <= A+B;
when "001" => --subtraction
ALU_RESULT <= A-B;
when others =>
ALU_RESULT <= A;
end case;
end process;

RESULT <= ALU_RESULT;
end behavioral;