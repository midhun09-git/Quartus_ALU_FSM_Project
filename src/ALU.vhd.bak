library IEEE;
use IEEE.STD_LOGIC_1164.All;

entity MUX21_8 is
port
(
d0 : IN STD_LOGIC_VECTOR(7 downto 0);
d1 : IN STD_LOGIC_VECTOR(7 downto 0);
Sel : IN STD_LOGIC;
Data_out : Out STD_LOGIC_VECTOR(7 downto 0) 
);
end Mux21_8;


Architecture behavioral of MUX21_8 is
begin 

Data_out <= d0 when (Sel = '0') else d1 when (Sel = '1');

end behavioral;