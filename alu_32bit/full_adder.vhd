library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port(
    i_Cin : in std_logic;
	 i_A : in std_logic;
	 i_B : in std_logic;
	 o_S : out std_logic;
	 o_Cout : out std_logic);
end full_adder;

architecture arch1 of full_adder is

signal w_connector_0 : std_logic;
signal w_connector_1 : std_logic;
signal w_connector_2 : std_logic;
signal w_connector_3 : std_logic;
signal w_connector_4 : std_logic;
signal w_connector_5 : std_logic;

begin
  w_connector_0 <= (i_A xor i_B );
  w_connector_1 <= (i_A and i_B );
  w_connector_2 <= (i_A and i_Cin);
  w_connector_3 <= (i_Cin and i_B);
  
  w_connector_4 <= (w_connector_0 xor i_Cin);
  w_connector_5 <= (w_connector_1 or w_connector_2 or w_connector_3);
  
  o_S <= w_connector_4;
  o_Cout <= w_connector_5;

end arch1;