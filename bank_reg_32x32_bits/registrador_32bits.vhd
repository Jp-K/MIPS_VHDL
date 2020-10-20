library ieee;
use ieee.std_logic_1164.all;

entity registrador_32bits is 
  port(
		  i_CLK : in std_logic;
		  i_CLR : in std_logic;
		  i_ena : in std_logic;
		  i_N   : in std_logic_vector(31 downto 0);
		  o_S   : out std_logic_vector(31 downto 0)
		);
		
end registrador_32bits;

architecture arch_1 of registrador_32bits is

begin

  process(i_CLK, i_CLR)
  begin
    if(i_CLR = '1') then
	   o_S <= "00000000000000000000000000000000";
	 elsif (i_CLK'event and i_CLK = '1' and i_ena = '1') then
	   o_S <= i_N;
	 end if;
  end process;
end arch_1;