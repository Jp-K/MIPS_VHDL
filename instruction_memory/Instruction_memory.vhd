library ieee;
use ieee.std_logic_1164.all;

entity Instruction_memory is
port(
	i_address : in std_logic_vector(31 downto 0);
	i_clk     : in std_logic;
	o_instruction : out std_logic_vector(31 downto 0));
end Instruction_memory;

architecture arch_1 of Instruction_memory is

component ROM is
port(
		i_address : in std_logic_vector(7 downto 0);
		i_CLK     : in std_logic;
		o_instruction : out std_logic_vector(31 downto 0));
end component;


begin

		
u_2 : ROM port map(
		i_address => i_address(7 downto 0),
		i_CLK  => i_clk,
		o_instruction => o_instruction);
		
end arch_1;
