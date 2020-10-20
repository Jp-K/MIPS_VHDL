library ieee;
use ieee.std_logic_1164.all;

entity decoder_5x32bits is
  port(
		i_ADDR : in std_logic_vector(4 downto 0);
		o_SEL : out std_logic_vector(31 downto 0)
		);
end decoder_5x32bits;

architecture arch_1 of decoder_5x32bits is

  component decoder_2x4bits is
    port(
		    i_Ent0      : in std_logic;
			 i_Ent1      : in std_logic;
			 o_Sel0      : out std_logic;
			 o_Sel1      : out std_logic;
			 o_Sel2      : out std_logic;
			 o_Sel3      : out std_logic
		  );
  end component;
  
  signal w_ADDR_1x0 : std_logic_vector(1 downto 0);
  signal w_Sa0, w_Sa1, w_Sa2, w_Sa3 : std_logic;
  
  component decoder_3x8 is
    port(
	       i_SelInput : in std_logic;
		    i_Vec      : in std_logic_vector(2 downto 0);
			 o_Sel      : out std_logic_vector(7 downto 0)

		  );
  end component;
  
  signal w_ADDR_3x0 : std_logic_vector(2 downto 0);
  signal w_SelInput0, w_SelInput1, w_SelInput2, w_SelInput3 : std_logic;
  signal w_S0, w_S1, w_S2, w_S3, w_S4, w_S5, w_S6, w_S7 : std_logic;
  signal w_S8, w_S9, w_S10, w_S11, w_S12, w_S13, w_S14, w_S15 : std_logic;
  signal w_S16, w_S17, w_S18, w_S19, w_S20, w_S21, w_S22, w_S23 : std_logic;
  signal w_S24, w_S25, w_S26, w_S27, w_S28, w_S29, w_S30, w_S31 : std_logic;
  
  
begin
  
  selReg: decoder_2x4bits port map(
											   i_Ent0 => w_ADDR_1x0(0),
											   i_Ent1 => w_ADDR_1x0(1),
											   o_Sel0 => w_Sa0,
											   o_Sel1 => w_Sa1,
											   o_Sel2 => w_Sa2,
											   o_Sel3 => w_Sa3);
  
  reg_0: decoder_3x8 port map(
									    i_SelInput => w_SelInput0,
										 i_Vec      => w_ADDR_3x0,
										 o_Sel(0)     => w_S0,
										 o_Sel(1)     => w_S1,
										 o_Sel(2)     => w_S2,
										 o_Sel(3)     => w_S3,
										 o_Sel(4)     => w_S4,
										 o_Sel(5)     => w_S5,
										 o_Sel(6)     => w_S6,
										 o_Sel(7)     => w_S7);
  reg_1: decoder_3x8 port map(
									    i_SelInput => w_SelInput1,
										 i_Vec      => w_ADDR_3x0,
										 o_Sel(0)     => w_S8,
										 o_Sel(1)     => w_S9,
										 o_Sel(2)     => w_S10,
										 o_Sel(3)     => w_S11,
										 o_Sel(4)     => w_S12,
										 o_Sel(5)     => w_S13,
										 o_Sel(6)     => w_S14,
										 o_Sel(7)     => w_S15);
    
  reg_2: decoder_3x8 port map(
									    i_SelInput => w_SelInput2,
										 i_Vec      => w_ADDR_3x0,
										 o_Sel(0)     => w_S16,
										 o_Sel(1)     => w_S17,
										 o_Sel(2)     => w_S18,
										 o_Sel(3)     => w_S19,
										 o_Sel(4)     => w_S20,
										 o_Sel(5)     => w_S21,
										 o_Sel(6)     => w_S22,
										 o_Sel(7)     => w_S23);
	
  reg_3: decoder_3x8 port map(
									    i_SelInput => w_SelInput3,
										 i_Vec      => w_ADDR_3x0,
										 o_Sel(0)     => w_S24,
										 o_Sel(1)     => w_S25,
										 o_Sel(2)     => w_S26,
										 o_Sel(3)     => w_S27,
										 o_Sel(4)     => w_S28,
										 o_Sel(5)     => w_S29,
										 o_Sel(6)     => w_S30,
										 o_Sel(7)     => w_S31);

  process(i_ADDR)
  begin

    w_ADDR_1x0(0) <= i_ADDR(3);
    w_ADDR_1x0(1) <= i_ADDR(4);
  
    w_ADDR_3x0(0) <= i_ADDR(0);
    w_ADDR_3x0(1) <= i_ADDR(1);
    w_ADDR_3x0(2) <= i_ADDR(2);
    		 
    w_SelInput0 <= w_Sa0;
    w_SelInput1 <= w_Sa1;
    w_SelInput2 <= w_Sa2;
    w_SelInput3 <= w_Sa3;
    
    o_SEL(0) <= w_S0;
    o_SEL(1) <= w_S1;
    o_SEL(2) <= w_S2;
    o_SEL(3) <= w_S3;
    o_SEL(4) <= w_S4;
    o_SEL(5) <= w_S5;
    o_SEL(6) <= w_S6;
    o_SEL(7) <= w_S7;
    o_SEL(8) <= w_S8;
    o_SEL(9) <= w_S9;
    o_SEL(10) <= w_S10;
    o_SEL(11) <= w_S11;
    o_SEL(12) <= w_S12;
    o_SEL(13) <= w_S13;
    o_SEL(14) <= w_S14;
    o_SEL(15) <= w_S15;
    o_SEL(16) <= w_S16;
    o_SEL(17) <= w_S17;
    o_SEL(18) <= w_S18;
    o_SEL(19) <= w_S19;
    o_SEL(20) <= w_S20;
    o_SEL(21) <= w_S21;
    o_SEL(22) <= w_S22;
    o_SEL(23) <= w_S23;
    o_SEL(24) <= w_S24;
    o_SEL(25) <= w_S25;
    o_SEL(26) <= w_S26;
    o_SEL(27) <= w_S27;
    o_SEL(28) <= w_S28;
    o_SEL(29) <= w_S29;
    o_SEL(30) <= w_S30;
    o_SEL(31) <= w_S31;
    
  end process;
end arch_1;
  