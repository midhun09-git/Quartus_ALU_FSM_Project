library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_GATE is
port
(
Input_A, Input_B : IN STD_LOGIC;
Output : OUT STD_LOGIC
);
end OR_GATE;


Architecture behavioral of OR_GATE is
begin

Output <= Input_A OR Input_B;

end behavioral;