library ieee;
use ieee.std_logic_1164.all;

entity decoder_3x8 is

port( 
	 i_SelInput : in std_logic;
	 i_Vec      : in std_logic_vector(2 downto 0);
	 o_Sel      : out std_logic_vector(7 downto 0)
	 );
end decoder_3x8;

architecture arch_1 of decoder_3x8 is
begin
  process(i_SelInput, i_Vec)
  begin
  
     o_Sel(0) <= ((not i_Vec(0)) and (not i_Vec(1)) and (not i_Vec(2))) and i_SelInput;
  	 o_Sel(1) <= ((i_Vec(0)) and (not i_Vec(1)) and (not i_Vec(2))) and i_SelInput; 
	 o_Sel(2) <= ((not i_Vec(0)) and (i_Vec(1)) and (not i_Vec(2))) and i_SelInput;
	 o_Sel(3) <= ((i_Vec(0)) and (i_Vec(1)) and (not i_Vec(2))) and i_SelInput;
	 o_Sel(4) <= ((not i_Vec(0)) and (not i_Vec(1)) and (i_Vec(2))) and i_SelInput;
	 o_Sel(5) <= ((i_Vec(0)) and (not i_Vec(1)) and (i_Vec(2))) and i_SelInput;	 
	 o_Sel(6) <= ((not i_Vec(0)) and (i_Vec(1)) and (i_Vec(2))) and i_SelInput;
	 o_Sel(7) <= ((i_Vec(0)) and (i_Vec(1)) and (i_Vec(2))) and i_SelInput;
	 
   
  end process;
end arch_1;