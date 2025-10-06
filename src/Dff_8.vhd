Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dff_8 is
port
(
D : IN STD_LOGIC_VECTOR(7 Downto 0);
clk,R : IN STD_LOGIC;
Q : OUT STD_LOGIC_VECTOR(7 Downto 0)
);
end Dff_8;


Architecture behavioral of Dff_8 is

begin
process(clk,R)
begin
if (R = '1') then
Q <= (Others=>'0') ;
elsif (rising_edge(clk)) then
Q <= D;
end if;
end process;
end behavioral;