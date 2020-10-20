library ieee;
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity Program_counter is
port(
		i_nextPC : in std_logic_vector(31 downto 0);
		i_CLK : in std_logic;
		i_rst : in std_logic;
		o_PC : out std_logic_vector(31 downto 0));
end Program_counter;

architecture arch_1 of Program_counter is

component lpm_ff
   generic (LPM_WIDTH: POSITIVE := 32;
      LPM_AVALUE: STRING := "UNUSED";
      LPM_SVALUE: STRING := "UNUSED";
      LPM_PVALUE: STRING := "UNUSED";
      LPM_FFTYPE: STRING := "DFF";
      LPM_TYPE: STRING := "LPM_FF";
      LPM_HINT: STRING := "UNUSED");
   port (data: in STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0);
      clock: in STD_LOGIC;
      enable: in STD_LOGIC := '1';
      sload, sclr, sset, aload, aclr: in STD_LOGIC := '0';
		aset : in std_logic;
      q: out STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0));
end component;

begin

u_1 : lpm_ff port map(
		data => i_nextPC,
		clock => i_CLK,
		aset => i_rst,
		q => o_PC);
		
end arch_1;
		
