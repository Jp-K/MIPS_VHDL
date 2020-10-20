library ieee;
use ieee.std_logic_1164.all;

entity decoder_2x4bits is

port (
	  i_Ent0      : in std_logic;
	  i_Ent1      : in std_logic;
	  o_Sel0      : out std_logic;
	  o_Sel1      : out std_logic;
	  o_Sel2      : out std_logic;
	  o_Sel3      : out std_logic
	  );
end decoder_2x4bits;

architecture arch_1 of decoder_2x4bits is

begin

  process(i_Ent0, i_Ent1)
  begin
    
	 o_Sel0 <= (not i_Ent0) and (not i_Ent1);
	 o_Sel1 <= (i_Ent0 and (not i_Ent1));
	 o_Sel2 <= ((not i_Ent0) and i_Ent1);
	 o_Sel3 <= (i_Ent0 and i_Ent1);

  end process;
end arch_1;