library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Logical_Operator is
  Port (
    A, B     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    OP       : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    Result   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    Carry    : OUT STD_LOGIC
  );
end Logical_Operator;

architecture Behavioral of Logical_Operator is
  signal UN_A, UN_B       : UNSIGNED(7 DOWNTO 0);
  signal ALU_Result       : UNSIGNED(7 DOWNTO 0);
  signal temp             : UNSIGNED(8 DOWNTO 0); -- For carry in Add/Sub
begin

  UN_A <= unsigned(A);
  UN_B <= unsigned(B);

  process(UN_A, UN_B, OP)
  begin
    -- Default values
    ALU_Result <= (others => '0');
    Carry <= '0';

    case OP is

      when "000" => -- ADD
        temp <= ('0' & UN_A) + ('0' & UN_B);
        ALU_Result <= temp(7 DOWNTO 0);
        Carry <= temp(8);

      when "001" => -- SUB
        temp <= ('0' & UN_A) - ('0' & UN_B);
        ALU_Result <= temp(7 DOWNTO 0);
        Carry <= temp(8);

      when "010" => -- MUL
        ALU_Result <= to_unsigned(to_integer(UN_A) * to_integer(UN_B), 8);
        Carry <= '0';

      when "011" => -- DIV
        if UN_B /= 0 then
          ALU_Result <= to_unsigned(to_integer(UN_A) / to_integer(UN_B), 8);
        else
          ALU_Result <= (others => '0');
        end if;
        Carry <= '0';

      when "100" => -- A == B
        if UN_A = UN_B then
          ALU_Result <= x"01";
        else
          ALU_Result <= x"00";
        end if;
        Carry <= '0';

      when "101" => -- A > B
        if UN_A > UN_B then
          ALU_Result <= x"01";
        else
          ALU_Result <= x"00";
        end if;
        Carry <= '0';

      when "110" => -- XOR
        ALU_Result <= UN_A xor UN_B;
        Carry <= '0';

      when "111" => -- XNOR
        ALU_Result <= not (UN_A xor UN_B);
        Carry <= '0';

      when others =>
        ALU_Result <= (others => '0');
        Carry <= '0';

    end case;
  end process;

  Result <= std_logic_vector(ALU_Result);

end Behavioral;
