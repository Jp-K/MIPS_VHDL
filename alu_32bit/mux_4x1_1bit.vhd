library ieee;
use ieee.std_logic_1164.all;

entity mux_4x1_1bit is
port(
  i_sel : in std_logic_vector(1 downto 0);
  i_A,i_B,i_C,i_D : in std_logic;
  o_S : out std_logic);
end mux_4x1_1bit;

architecture arc1 of mux_4x1_1bit is

begin 
  o_S<= i_A when (i_sel = "00") else
  i_B when (i_sel = "01") else
  i_C when (i_sel = "10") else
  i_D;
end arc1;