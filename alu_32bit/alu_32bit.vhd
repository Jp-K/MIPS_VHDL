library ieee;
use ieee.std_logic_1164.all;

entity alu_32bit is
  port(
    i_Operation : in std_logic_vector(1 downto 0);
	 i_A : in std_logic_vector(31 downto 0);
	 i_B : in std_logic_vector(31 downto 0);
	 i_InvB : in std_logic;
	 o_Result : out std_logic_vector(31 downto 0);
	 o_Zero : out std_logic;
	 o_Overflow : out std_logic
	 );
end alu_32bit;

architecture arch1 of alu_32bit is
  
  component alu_1bit is
  port(
    i_Operation : in std_logic_vector(1 downto 0);
    i_invB : in std_logic;
    i_A,i_B : in std_logic;
    i_CarryIn :in std_logic;
    i_Less : in std_logic;
    o_Result : out std_logic;
    o_CarryOut : out std_logic
	 );
  end component;
  
  component alu_1bit_msb is
  port(
    i_Operation : in std_logic_vector(1 downto 0);
    i_invB : in std_logic;
    i_A,i_B : in std_logic;
    i_CarryIn :in std_logic;
    i_Less : in std_logic;
    o_Result : out std_logic;
    o_Set : out std_logic;
    o_Overflow : out std_logic);
  end component;

  signal w_connector_less : std_logic;
  
  signal w_Result : std_logic_vector(31 downto 0);
  signal w_Carry : std_logic_vector(31 downto 0);
  
  signal w_zero : std_logic_vector(3 downto 0);
  begin
  
	 
    u0_alu_1bit : alu_1bit port map(
      i_Operation => i_Operation,
      i_invB => i_invB,
      i_A => i_A(0),
		i_B => i_B(0),
      i_CarryIn => i_InvB,
      i_Less => w_connector_less,
      o_Result => w_Result(0),
      o_CarryOut => w_Carry(0)
    );
	 
	 u1_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(1),
		i_B =>i_B(1),
      i_CarryIn =>w_Carry(0),
      i_Less =>'0',
      o_Result =>w_Result(1),
      o_CarryOut =>w_Carry(1)
    );
	 
	 u2_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(2),
		i_B =>i_B(2),
      i_CarryIn =>w_Carry(1),
      i_Less =>'0',
      o_Result =>w_Result(2),
      o_CarryOut =>w_Carry(2)
    );
	 
	 u3_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(3),
		i_B =>i_B(3),
      i_CarryIn =>w_Carry(2),
      i_Less =>'0',
      o_Result =>w_Result(3),
      o_CarryOut =>w_Carry(3)
    );
	 
	 u4_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(4),
		i_B =>i_B(4),
      i_CarryIn =>w_Carry(3),
      i_Less =>'0',
      o_Result =>w_Result(4),
      o_CarryOut =>w_Carry(4)
    );
	 
	 u5_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(5),
		i_B =>i_B(5),
      i_CarryIn =>w_Carry(4),
      i_Less =>'0',
      o_Result => w_Result(5),
      o_CarryOut =>w_Carry(5)
    );
	 
	 u6_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(6),
		i_B =>i_B(6),
      i_CarryIn =>w_Carry(5),
      i_Less =>'0',
      o_Result =>w_Result(6),
      o_CarryOut =>w_Carry(6)
    );
	 
	 u7_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(7),
		i_B =>i_B(7),
      i_CarryIn =>w_Carry(6),
      i_Less =>'0',
      o_Result =>w_Result(7),
      o_CarryOut =>w_Carry(7)
    );
	 
	 u8_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(8),
		i_B =>i_B(8),
      i_CarryIn =>w_Carry(7),
      i_Less =>'0',
      o_Result =>w_Result(8),
      o_CarryOut =>w_Carry(8)
    );
	 
	 u9_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(9),
		i_B =>i_B(9),
      i_CarryIn =>w_Carry(8),
      i_Less =>'0',
      o_Result =>w_Result(9),
      o_CarryOut =>w_Carry(9)
    );

	u10_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(10),
		i_B =>i_B(10),
      i_CarryIn =>w_Carry(9),
      i_Less =>'0',
      o_Result =>w_Result(10),
      o_CarryOut =>w_Carry(10)
    );
	
   u11_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(11),
		i_B =>i_B(11),
      i_CarryIn =>w_Carry(10),
      i_Less =>'0',
      o_Result =>w_Result(11),
      o_CarryOut =>w_Carry(11)
    );
	 
	u12_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(12),
		i_B =>i_B(12),
      i_CarryIn =>w_Carry(11),
      i_Less =>'0',
      o_Result =>w_Result(12),
      o_CarryOut =>w_Carry(12)
    );
	
   u13_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(13),
		i_B =>i_B(13),
      i_CarryIn =>w_Carry(12),
      i_Less =>'0',
      o_Result =>w_Result(13),
      o_CarryOut =>w_Carry(13)
    );	
	 
	 u14_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(14),
		i_B =>i_B(14),
      i_CarryIn =>w_Carry(13),
      i_Less =>'0',
      o_Result =>w_Result(14),
      o_CarryOut =>w_Carry(14)
    );
	 
	 u15_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(15),
		i_B =>i_B(15),
      i_CarryIn =>w_Carry(14),
      i_Less =>'0',
      o_Result =>w_Result(15),
      o_CarryOut =>w_Carry(15)
    );
	 
	 u16_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(16),
		i_B =>i_B(16),
      i_CarryIn =>w_Carry(15),
      i_Less =>'0',
      o_Result =>w_Result(16),
      o_CarryOut =>w_Carry(16)
    );
	 
	 u17_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(17),
		i_B =>i_B(17),
      i_CarryIn =>w_Carry(16),
      i_Less =>'0',
      o_Result =>w_Result(17),
      o_CarryOut =>w_Carry(17)
    );
	 
	 u18_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(18),
		i_B =>i_B(18),
      i_CarryIn =>w_Carry(17),
      i_Less =>'0',
      o_Result =>w_Result(18),
      o_CarryOut =>w_Carry(18)
    );
	 
	 u19_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(19),
		i_B =>i_B(19),
      i_CarryIn =>w_Carry(18),
      i_Less =>'0',
      o_Result =>w_Result(19),
      o_CarryOut =>w_Carry(19)
    );
	 
	 u20_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(20),
		i_B =>i_B(20),
      i_CarryIn =>w_Carry(19),
      i_Less =>'0',
      o_Result =>w_Result(20),
      o_CarryOut =>w_Carry(20)
    );
	 
	 u21_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(21),
		i_B =>i_B(21),
      i_CarryIn =>w_Carry(20),
      i_Less =>'0',
      o_Result =>w_Result(21),
      o_CarryOut =>w_Carry(21)
    );
	 
	 u22_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(22),
		i_B =>i_B(22),
      i_CarryIn =>w_Carry(21),
      i_Less =>'0',
      o_Result =>w_Result(22),
      o_CarryOut =>w_Carry(22)
    );
	 
	 u23_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(23),
		i_B =>i_B(23),
      i_CarryIn =>w_Carry(22),
      i_Less =>'0',
      o_Result =>w_Result(23),
      o_CarryOut =>w_Carry(23)
    );
	 
	 u24_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(24),
		i_B =>i_B(24),
      i_CarryIn =>w_Carry(23),
      i_Less =>'0',
      o_Result =>w_Result(24),
      o_CarryOut =>w_Carry(24)
    );
	 
	 u25_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(25),
		i_B =>i_B(25),
      i_CarryIn =>w_Carry(24),
      i_Less =>'0',
      o_Result =>w_Result(25),
      o_CarryOut =>w_Carry(25)
    );
	 
	 u26_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(26),
		i_B =>i_B(26),
      i_CarryIn =>w_Carry(25),
      i_Less =>'0',
      o_Result =>w_Result(26),
      o_CarryOut =>w_Carry(26)
    );
	 
	 u27_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(27),
		i_B =>i_B(27),
      i_CarryIn =>w_Carry(26),
      i_Less =>'0',
      o_Result =>w_Result(27),
      o_CarryOut =>w_Carry(27)
    );
	 
	 u28_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(28),
		i_B =>i_B(28),
      i_CarryIn =>w_Carry(27),
      i_Less =>'0',
      o_Result =>w_Result(28),
      o_CarryOut =>w_Carry(28)
    );
	 
	 u29_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(29),
		i_B =>i_B(29),
      i_CarryIn =>w_Carry(28),
      i_Less =>'0',
      o_Result =>w_Result(29),
      o_CarryOut =>w_Carry(29)
    );
	 
	 u30_alu_1bit : alu_1bit port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A =>i_A(30),
		i_B =>i_B(30),
      i_CarryIn =>w_Carry(29),
      i_Less =>'0',
      o_Result =>w_Result(30),
      o_CarryOut =>w_Carry(30)
    );
	 
	  u31_alu_1bit_msb : alu_1bit_msb port map(
      i_Operation =>i_Operation,
      i_invB =>i_InvB,
      i_A=>i_A(31),
		i_B=>i_B(31),
      i_CarryIn=>w_Carry(30),
      i_Less=>'0',
      o_Result =>w_Result(31),
      o_Set => w_connector_less,
      o_Overflow =>w_carry(31)
    );
	 
	 o_Overflow<=w_carry(31);
	 
	 w_zero(0)<=(w_result(0) and w_result(1) and w_result(2) and w_result(3) and w_result(4) and w_result(5) and w_result(6) and w_result(7));
	 w_zero(1)<=(w_result(8) and w_result(9) and w_result(10) and w_result(11) and w_result(12) and w_result(13) and w_result(14) and w_result(15));
	 w_zero(2)<=(w_result(16) and w_result(17) and w_result(18) and w_result(19) and w_result(20) and w_result(21) and w_result(22) and w_result(23));
	 w_zero(3)<=(w_result(24) and w_result(25) and w_result(26) and w_result(27) and w_result(28) and w_result(29) and w_result(30) and w_result(31));
	 
	 o_Zero<=(w_result(0) and w_result(1) and w_result(2) and w_result(3));
	 
	 o_Result(0)<=w_result(0);
	 o_Result(1)<=w_result(1);
	 o_Result(2)<=w_result(2);
	 o_Result(3)<=w_result(3);
	 o_Result(4)<=w_result(4);
	 o_Result(5)<=w_result(5);
	 o_Result(6)<=w_result(6);
	 o_Result(7)<=w_result(7);
	 o_Result(8)<=w_result(8);
	 o_Result(9)<=w_result(9);
	 o_Result(10)<=w_result(10);
	 o_Result(11)<=w_result(11);
	 o_Result(12)<=w_result(12);
	 o_Result(13)<=w_result(13);
	 o_Result(14)<=w_result(14);
	 o_Result(15)<=w_result(15);
	 o_Result(16)<=w_result(16);
	 o_Result(17)<=w_result(17);
	 o_Result(18)<=w_result(18);
	 o_Result(19)<=w_result(19);
	 o_Result(20)<=w_result(20);
	 o_Result(21)<=w_result(21);
	 o_Result(22)<=w_result(22);
	 o_Result(23)<=w_result(23);
	 o_Result(24)<=w_result(24);
	 o_Result(25)<=w_result(25);
	 o_Result(26)<=w_result(26);
	 o_Result(27)<=w_result(27);
	 o_Result(28)<=w_result(28);
	 o_Result(29)<=w_result(29);
	 o_Result(30)<=w_result(30);
	 o_Result(31)<=w_result(31);
end arch1;

  