library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_1bits is
  port(
	   i_SEL : in std_logic;
		i_A   : in std_logic;
		i_B   : in std_logic;
		o_S   : out std_logic
		);

end mux_2x1_1bits;

architecture arch_1 of mux_2x1_1bits is

begin

  process(i_SEL, i_A, i_B)
  begin

	 o_S <= (i_A and (not i_SEL)) or (i_SEL and i_B);

  end process;
end arch_1;
