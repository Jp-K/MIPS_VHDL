library ieee;
use ieee.std_logic_1164.all;

entity alu_operation is
port(
    i_ALUOp : in std_logic_vector(1 downto 0);
	 i_F : in std_logic_vector(5 downto 0);
	 o_Operation : out std_logic_vector(2 downto 0)
	 );
end alu_operation;

architecture arch1 of alu_operation is
signal w_connector_0 : std_logic;

begin
o_Operation(2)<=((i_ALUOp(1) and i_F(1)) or i_ALUOp(0));

o_Operation(1)<=(not(i_F(2)) or not(i_ALUOp(1)));

o_Operation(0)<=((i_F(3) or i_F(0)) and i_ALUOp(1));

end arch1;