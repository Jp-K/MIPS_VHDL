library ieee;
use ieee.std_logic_1164.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity DivisorFrequencia is
port(
  i_clkMem : in std_logic;
  o_clk : out std_logic
);
end DivisorFrequencia;




architecture arch1 of DivisorFrequencia is

signal w_connector_clock_0 : std_logic;
signal w_connector_clock_1 : std_logic;


component lpm_ff
   GENERIC (LPM_WIDTH: POSITIVE := 1;
      LPM_AVALUE: STRING := "UNUSED";
      LPM_SVALUE: STRING := "UNUSED";
      LPM_PVALUE: STRING := "UNUSED";
      LPM_FFTYPE: STRING := "TFF";
      LPM_TYPE: STRING := "LPM_FF";
      LPM_HINT: STRING := "UNUSED");
   PORT(
	   data: IN STD_LOGIC;
      clock: IN STD_LOGIC;
      enable: IN STD_LOGIC := '1';
		sload, sclr, sset, aload, aclr, aset: IN STD_LOGIC := '0';
      q: OUT std_logic);
end component;

begin
u0_lpm_ff: lpm_ff port map(
  data  =>'1',
  clock =>i_clkMem,
  enable=>'1',
  q => w_connector_clock_0
   );
	
u1_lpm_ff: lpm_ff port map(
  data  =>w_connector_clock_0,
  clock =>i_clkMem,
  enable=>'1',
  q => w_connector_clock_1
   );
	
u2_lpm_ff: lpm_ff port map(
  data  =>w_connector_clock_1,
  clock =>i_clkMem,
  enable=>'1',
  q => o_clk
   );
end arch1;