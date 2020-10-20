library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_32bit is
port(
  i_a: in std_logic_vector(31 downto 0);
  i_b: in std_logic_vector(31 downto 0);
  o_Resultado: out std_logic_vector(31 downto 0)
);
end adder_32bit;

architecture arch1 of adder_32bit is
begin 

o_Resultado <= std_logic_vector(unsigned(i_a(31 downto 0))+unsigned(i_b(31 downto 0)));

end arch1;