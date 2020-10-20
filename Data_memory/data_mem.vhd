library IEEE;
use IEEE.STD_LOGIC_1164.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity data_mem is
port(
	i_din : in std_logic_vector(31 downto 0);
	i_address : in std_logic_vector(31 downto 0);
	i_clk : in std_logic;
	i_write : in std_logic;
	o_dout : out std_logic_vector(31 downto 0));
end data_mem;

architecture arch_1 of data_mem is

signal w_addr : std_logic_vector(31 downto 0);


COMPONENT lpm_add_sub
   GENERIC (LPM_WIDTH: POSITIVE := 32;
      LPM_DIRECTION: STRING := "SUB";
      LPM_REPRESENTATION: STRING := "UNSIGNED";
      LPM_PIPELINE: INTEGER := 0;
      LPM_TYPE: STRING := "LPM_ADD_SUB";
      LPM_HINT: STRING := "CIN_USED=NO";
      ONE_INPUT_IS_CONSTANT: STRING := "YES";
      MAXIMIZE_SPEED: INTEGER := 0; 
      USE_WYS: STRING :=	"OFF");
   PORT (dataa : IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0);
	   datab: IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := "00010000000000010000000000000000";
      aclr, clock, cin: IN STD_LOGIC := '0';
      clken, add_sub: IN STD_LOGIC := '1';
      result: OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0);
      cout, overflow: OUT STD_LOGIC := '0');
END COMPONENT;


component Data_memory is
port(
	clock   : in  std_logic;
	we      : in  std_logic;
	address : in  std_logic_vector(7 downto 0);
	datain  : in  std_logic_vector(31 downto 0);
	dataout : out std_logic_vector(31 downto 0));
end component;

begin

u_1 : lpm_add_sub port map(
		dataa => i_address,
		result => w_addr);

u_2 : Data_memory port map(
		clock  => i_clk,
      we     => i_write,
      address => w_addr(9 downto 2),
	   datain  => i_din,
	   dataout => o_dout);
end arch_1;
	