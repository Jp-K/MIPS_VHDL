library ieee;
use ieee.std_logic_1164.all;

entity mux_32x1_32bits is
    port
    (
        i_SEL     : in std_logic_vector(4 downto 0);
        i_din00   : in std_logic_vector(31 downto 0);
		i_din01   : in std_logic_vector(31 downto 0);
		i_din02   : in std_logic_vector(31 downto 0);
		i_din03   : in std_logic_vector(31 downto 0);
		i_din04   : in std_logic_vector(31 downto 0);
		i_din05   : in std_logic_vector(31 downto 0);
		i_din06   : in std_logic_vector(31 downto 0);
		i_din07   : in std_logic_vector(31 downto 0);
		i_din08   : in std_logic_vector(31 downto 0);
		i_din09   : in std_logic_vector(31 downto 0);
		i_din10   : in std_logic_vector(31 downto 0);
		i_din11   : in std_logic_vector(31 downto 0);
		i_din12   : in std_logic_vector(31 downto 0);
		i_din13   : in std_logic_vector(31 downto 0);
		i_din14   : in std_logic_vector(31 downto 0);
        i_din15   : in std_logic_vector(31 downto 0);
        i_din16   : in std_logic_vector(31 downto 0);
		i_din17   : in std_logic_vector(31 downto 0);
		i_din18   : in std_logic_vector(31 downto 0);
		i_din19   : in std_logic_vector(31 downto 0);
		i_din20   : in std_logic_vector(31 downto 0);
		i_din21   : in std_logic_vector(31 downto 0);
		i_din22   : in std_logic_vector(31 downto 0);
		i_din23   : in std_logic_vector(31 downto 0);
		i_din24   : in std_logic_vector(31 downto 0);
		i_din25   : in std_logic_vector(31 downto 0);
		i_din26   : in std_logic_vector(31 downto 0);
		i_din27   : in std_logic_vector(31 downto 0);
		i_din28   : in std_logic_vector(31 downto 0);
		i_din29   : in std_logic_vector(31 downto 0);
		i_din30   : in std_logic_vector(31 downto 0);
        i_din31   : in std_logic_vector(31 downto 0);
        o_DOUT    : out std_logic_vector(31 downto 0)
    );
end mux_32x1_32bits;

architecture arch_1 of mux_32x1_32bits is

    component mux_16x1_32bits is
        port
        (
            i_SEL  : in std_logic_vector(3 downto 0);
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
    end component;

    signal w_SEL1, w_SEL2 : std_logic_vector(3 downto 0);
    signal w_DIN00, w_DIN01, w_DIN02, w_DIN03, w_DIN04, w_DIN05, w_DIN06, w_DIN07 : std_logic_vector(31 downto 0);
    signal w_DIN08, w_DIN09, w_DIN10, w_DIN11, w_DIN12, w_DIN13, w_DIN14, w_DIN15 : std_logic_vector(31 downto 0);
	 signal w_DIN16, w_DIN17, w_DIN18, w_DIN19, w_DIN20, w_DIN21, w_DIN22, w_DIN23 : std_logic_vector(31 downto 0);
    signal w_DIN24, w_DIN25, w_DIN26, w_DIN27, w_DIN28, w_DIN29, w_DIN30, w_DIN31 : std_logic_vector(31 downto 0);
    signal w_COUTa, W_COUTb : std_logic_vector(31 downto 0);

    component mux_2x1_32bits is
        port
        (
            i_SEL_32  : in std_logic;
            i_entA_32 : in std_logic_vector(31 downto 0);
            i_entB_32 : in std_logic_vector(31 downto 0);
            o_EXT_32  : out std_logic_vector(31 downto 0)
        );
        end component;

        signal w_SEL_32 : std_logic;
        signal w_entA_32, w_entB_32 : std_logic_vector(31 downto 0);
        
    begin

        mux16_1: mux_16x1_32bits port map
        (
            i_SEL  => w_SEL1(3 downto 0),
            i_DIN00 => w_DIN00,
            i_DIN01   => w_DIN01,
            i_DIN02   => w_DIN02,
            i_DIN03   => w_DIN03,
            i_DIN04   => w_DIN04,
            i_DIN05   => w_DIN05,
            i_DIN06   => w_DIN06,
            i_DIN07   => w_DIN07,
            i_DIN08   => w_DIN08,
            i_DIN09   => w_DIN09,
            i_DIN10   => w_DIN10,
            i_DIN11   => w_DIN11,
            i_DIN12   => w_DIN12,
            i_DIN13   => w_DIN13,
            i_DIN14   => w_DIN14,
            i_DIN15   => w_DIN15,
            o_COUT    => w_entA_32
        );

        mux16_2: mux_16x1_32bits port map
        (
            i_SEL  => w_SEL2(3 downto 0),
            i_DIN00 => w_DIN16,
            i_DIN01   => w_DIN17,
            i_DIN02   => w_DIN18,
            i_DIN03   => w_DIN19,
            i_DIN04   => w_DIN20,
            i_DIN05   => w_DIN21,
            i_DIN06   => w_DIN22,
            i_DIN07   => w_DIN23,
            i_DIN08   => w_DIN24,
            i_DIN09   => w_DIN25,
            i_DIN10   => w_DIN26,
            i_DIN11   => w_DIN27,
            i_DIN12   => w_DIN28,
            i_DIN13   => w_DIN29,
            i_DIN14   => w_DIN30,
            i_DIN15   => w_DIN31,
            o_COUT    => w_entB_32
        );

        mux2_1: mux_2x1_32bits port map
        (
            i_SEL_32  => w_SEL_32,
            i_entA_32 => w_entA_32,
            i_entB_32 => w_entB_32,
            o_EXT_32 => o_DOUT(31 downto 0)
        );
    process (i_SEL, i_din00, i_din01, i_din02, i_din03, i_din04, i_din05, i_din06, i_din07, i_din08, i_din09, i_din10, i_din11, i_din12, i_din13, i_din14, i_din15, i_din16, i_din17, i_din18, i_din19, i_din20, i_din21, i_din22, i_din23, i_din24, i_din25, i_din26, i_din27, i_din28, i_din29, i_din30, i_din31)
    begin

        w_SEL1 <= i_SEL(3 downto 0);
        w_DIN00 <= i_din00;
        w_DIN01 <= I_din01;
        w_DIN02 <= i_din02;
        w_DIN03 <= I_din03;
        w_DIN04 <= i_din04;
        w_DIN05 <= I_din05;
        w_DIN06 <= i_din06;
        w_DIN07 <= I_din07;
        w_DIN08 <= i_din08;
        w_DIN09 <= I_din09;
        w_DIN10 <= i_din10;
        w_DIN11 <= I_din11;
        w_DIN12 <= i_din12;
        w_DIN13 <= I_din13;
        w_DIN14 <= i_din14;
        w_DIN15 <= I_din15;
        w_COUTa <= w_entA_32;

        w_SEL2 <= i_SEL(3 downto 0);
        w_DIN16 <= i_din16;
        w_DIN17 <= I_din17;
        w_DIN18 <= i_din18;
        w_DIN19 <= I_din19;
        w_DIN20 <= i_din20;
        w_DIN21 <= I_din21;
        w_DIN22 <= i_din22;
        w_DIN23 <= I_din23;
        w_DIN24 <= i_din24;
        w_DIN25 <= I_din25;
        w_DIN26 <= i_din26;
        w_DIN27 <= I_din27;
        w_DIN28 <= i_din28;
        w_DIN29 <= I_din29;
        w_DIN30 <= i_din30;
        w_DIN31 <= I_din31;
        w_COUTb <= w_entb_32;

        w_SEL_32 <= i_SEL(4);
    end process;
end arch_1;