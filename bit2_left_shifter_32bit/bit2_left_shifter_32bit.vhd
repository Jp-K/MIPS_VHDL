library ieee;
use ieee.std_logic_1164.all;

entity bit2_left_shifter_32bit is
port(
  i_D : in std_logic_vector(31 downto 0);
  o_Q : out std_logic_vector(31 downto 0)
  );
end bit2_left_shifter_32bit;
  
architecture arch1 of bit2_left_shifter_32bit is

begin 
o_Q(0)<='0';
o_Q(1)<='0';
o_Q(2)<=i_D(0);
o_Q(3)<=i_D(1);
o_Q(4)<=i_D(2);
o_Q(5)<=i_D(3);
o_Q(6)<=i_D(4);
o_Q(7)<=i_D(5);
o_Q(8)<=i_D(6);
o_Q(9)<=i_D(7);
o_Q(10)<=i_D(8);
o_Q(11)<=i_D(9);
o_Q(12)<=i_D(10);
o_Q(13)<=i_D(11);
o_Q(14)<=i_D(12);
o_Q(15)<=i_D(13);
o_Q(16)<=i_D(14);
o_Q(17)<=i_D(15);
o_Q(18)<=i_D(16);
o_Q(19)<=i_D(17);
o_Q(20)<=i_D(18);
o_Q(21)<=i_D(19);
o_Q(22)<=i_D(20);
o_Q(23)<=i_D(21);
o_Q(24)<=i_D(22);
o_Q(25)<=i_D(23);
o_Q(26)<=i_D(24);
o_Q(27)<=i_D(25);
o_Q(28)<=i_D(26);
o_Q(29)<=i_D(27);
o_Q(30)<=i_D(28);
o_Q(31)<=i_D(29);
end arch1;

