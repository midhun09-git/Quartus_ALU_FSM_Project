Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity D_Latch is 
port(
D : IN STD_LOGIC;
clk : IN STD_LOGIC;
Q : OUT STD_LOGIC);
end D_Latch;


Architecture behavioral of D_Latch is
begin
process(clk,D)
begin
if (clk='1') then
Q <= D;
end if;
end process;
end behavioral;