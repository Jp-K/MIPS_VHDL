library ieee;
use ieee.std_logic_1164.all;

entity mux_16x1_32bits is
    port
    (
        i_SEL     : in  std_logic_vector(3 downto 0);
		  i_DIN00   : in std_logic_vector(31 downto 0);
		  i_DIN01   : in std_logic_vector(31 downto 0);
		  i_DIN02   : in std_logic_vector(31 downto 0);
		  i_DIN03   : in std_logic_vector(31 downto 0);
		  i_DIN04   : in std_logic_vector(31 downto 0);
		  i_DIN05   : in std_logic_vector(31 downto 0);
		  i_DIN06   : in std_logic_vector(31 downto 0);
		  i_DIN07   : in std_logic_vector(31 downto 0);
		  i_DIN08   : in std_logic_vector(31 downto 0);
		  i_DIN09   : in std_logic_vector(31 downto 0);
		  i_DIN10   : in std_logic_vector(31 downto 0);
		  i_DIN11   : in std_logic_vector(31 downto 0);
		  i_DIN12   : in std_logic_vector(31 downto 0);
		  i_DIN13   : in std_logic_vector(31 downto 0);
		  i_DIN14   : in std_logic_vector(31 downto 0);
		  i_DIN15   : in std_logic_vector(31 downto 0);
        o_COUT    : out std_logic_vector(31 downto 0)
    );
end mux_16x1_32bits;

architecture arch_1 of mux_16x1_32bits is

    component mux_4x1_32bits is
        port
        (
            i_SEL    : in std_logic_vector(1 downto 0);
            i_A      : in std_logic_vector( 31 downto 0);
            i_B      : in std_logic_vector( 31 downto 0);
            i_C      : in std_logic_vector(31 downto 0);
            i_D      : in std_logic_vector(31 downto 0);
            o_EXT    : out std_logic_vector( 31 downto 0)
        );
    end component;

        signal w_SEL : std_logic_vector(3 downto 0);
        signal w_din00, w_din01, w_din02, w_din03 : std_logic_vector(31 downto 0);
        signal w_din04, w_din05, w_din06, w_din07 : std_logic_vector(31 downto 0);
        signal w_din08, w_din09, w_din10, w_din11 : std_logic_vector(31 downto 0);
        signal w_din12, w_din13, w_din14, w_din15 : std_logic_vector(31 downto 0);
        signal w_Sdin00, w_Sdin01, w_Sdin02, w_Sdin03 : std_logic_vector(31 downto 0);


begin

    mux16_1: mux_4x1_32bits port map
    (
        i_SEL   => w_SEL(1 downto 0),
        i_A     => w_din00(31 downto 0),
        i_B     => w_din01(31 downto 0),
        i_C     => w_din02(31 downto 0),
        i_D     => w_din03(31 downto 0),
        o_EXT   => w_Sdin00(31 downto 0)
    );
    
    mux16_2: mux_4x1_32bits port map
    (
        i_SEL   => w_SEL(1 downto 0),
        i_A     => w_din04(31 downto 0),
        i_B     => w_din05(31 downto 0),
        i_C     => w_din06(31 downto 0),
        i_D     => w_din07(31 downto 0),
        o_EXT   => w_Sdin01(31 downto 0)
    );

    mux16_3: mux_4x1_32bits port map
    (
        i_SEL   => w_SEL(1 downto 0),
        i_A     => w_din08(31 downto 0),
        i_B     => w_din09(31 downto 0),
        i_C     => w_din10(31 downto 0),
        i_D     => w_din11(31 downto 0),
        o_EXT   => w_Sdin02(31 downto 0)
    );

    mux16_4: mux_4x1_32bits port map
    (
        i_SEL   => w_SEL(1 downto 0),
        i_A     => w_din12(31 downto 0),
        i_B     => w_din13(31 downto 0),
        i_C     => w_din14(31 downto 0),
        i_D     => w_din15(31 downto 0),
        o_EXT   => w_Sdin03(31 downto 0)
    );

    mux16_5: mux_4x1_32bits port map
    (
        i_SEL   => w_SEL(3 downto 2),
        i_A     => w_Sdin00(31 downto 0),
        i_B     => w_Sdin01(31 downto 0),
        i_C     => w_Sdin02(31 downto 0),
        i_D     => w_Sdin03(31 downto 0),
        o_EXT   => o_COUT(31 downto 0)
    );


    process (i_SEL, i_DIN00, i_DIN01, i_DIN02, i_DIN03, i_DIN04, i_DIN05, i_DIN06, i_DIN07, i_DIN08, i_DIN09, i_DIN10, i_DIN11, i_DIN12, i_DIN13, i_DIN14, i_DIN15)
    begin

        w_SEL(1 downto 0) <= i_SEL(1 downto 0);
		  w_SEL(3 downto 2) <= i_SEL(3 downto 2);
        
		  w_din00 <= i_DIN00;
		  w_din01 <= i_DIN01;
		  w_din02 <= i_DIN02;
		  w_din03 <= i_DIN03;
		  w_din04 <= i_DIN04;
		  w_din05 <= i_DIN05;
		  w_din06 <= i_DIN06;
		  w_din07 <= i_DIN07;
		  w_din08 <= i_DIN08;
		  w_din09 <= i_DIN09;
		  w_din10 <= i_DIN10;
		  w_din11 <= i_DIN11;
		  w_din12 <= i_DIN12;
		  w_din13 <= i_DIN13;
		  w_din14 <= i_DIN14;
		  w_din15 <= i_DIN15;
		  
    end process;
end arch_1;
