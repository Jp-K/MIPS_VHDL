library ieee;
use ieee.std_logic_1164.all;

entity bank_reg_32x32_bits is
    port
    (
        i_CLK_BANK  : in std_logic;
        i_RST       : in std_logic;
        i_WR        : in std_logic;
        i_RD_ADDR_A : in std_logic_vector(4 downto 0);
        i_RD_ADDR_B : in std_logic_vector(4 downto 0);
        i_WR_ADDR   : in std_logic_vector(4 downto 0);
        i_WR_DATA   : in std_logic_vector(31 downto 0);
        o_RD_DATA_A : out std_logic_vector(31 downto 0);
        o_RD_DATA_B : out std_logic_vector(31 downto 0)
    );
end bank_reg_32x32_bits;

architecture arch_1 of bank_reg_32x32_bits is

    component decoder_5x32bits is
        port
        (
            i_ADDR : in std_logic_vector(4 downto 0);
		    o_SEL  : out std_logic_vector(31 downto 0)
        );
    end component;

    signal w_ADDR    : std_logic_vector(4 downto 0);
    signal w_DEC_SEL : std_logic_vector(31 downto 0);
   

    component registrador_32bits is
        port
        (
            i_CLK : in std_logic;
		    i_CLR : in std_logic;
		    i_ena : in std_logic;
		    i_N   : in std_logic_vector(31 downto 0);
		    o_S   : out std_logic_vector(31 downto 0)
        );
        end component;

        signal w_ena : std_logic_vector(31 downto 0);
        
        signal w_S00, w_S01, w_S02, w_S03, w_S04, w_S05, w_S06, w_S07 : std_logic_vector(31 downto 0);
        signal w_S08, w_S09, w_S10, w_S11, w_S12, w_S13, w_S14, w_S15 : std_logic_vector(31 downto 0);
        signal w_S16, w_S17, w_S18, w_S19, w_S20, w_S21, w_S22, w_S23 : std_logic_vector(31 downto 0);
        signal w_S24, w_S25, w_S26, w_S27, w_S28, w_S29, w_S30, w_S31 : std_logic_vector(31 downto 0);

        component mux_32x1_32bits is
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
			end component;

            signal w_MUX_SELa, w_MUX_SELb : std_logic_vector(4 downto 0);

            signal w_din00A, w_din01A, w_din02A, w_din03A, w_din04A, w_din05A, w_din06A, w_din07A : std_logic_vector(31 downto 0);
            signal w_din08A, w_din09A, w_din10A, w_din11A, w_din12A, w_din13A, w_din14A, w_din15A : std_logic_vector(31 downto 0);
            signal w_din16A, w_din17A, w_din18A, w_din19A, w_din20A, w_din21A, w_din22A, w_din23A : std_logic_vector(31 downto 0);
            signal w_din24A, w_din25A, w_din26A, w_din27A, w_din28A, w_din29A, w_din30A, w_din31A : std_logic_vector(31 downto 0);
            signal w_DOUTa, w_DOUTb : std_logic_vector(31 downto 0);

            signal w_din00B, w_din01B, w_din02B, w_din03B, w_din04B, w_din05B, w_din06B, w_din07B : std_logic_vector(31 downto 0);
            signal w_din08B, w_din09B, w_din10B, w_din11B, w_din12B, w_din13B, w_din14B, w_din15B : std_logic_vector(31 downto 0);
            signal w_din16B, w_din17B, w_din18B, w_din19B, w_din20B, w_din21B, w_din22B, w_din23B : std_logic_vector(31 downto 0);
            signal w_din24B, w_din25B, w_din26B, w_din27B, w_din28B, w_din29B, w_din30B, w_din31B : std_logic_vector(31 downto 0);


            -------------------------------------------------------------

            signal w_WR : std_logic_vector(31 downto 0);
            
    begin

        decoder_5x32: decoder_5x32bits port map
        (
            i_ADDR  => w_ADDR(4 downto 0),
            o_SEL   => w_DEC_SEL(31 downto 0)
        );

        muxA_32: mux_32x1_32bits port map
        (
            i_SEL     => w_MUX_SELa,
            i_din00   => w_din00A,
            i_din01   => w_din01A,
            i_din02   => w_din02A,
            i_din03   => w_din03A,
            i_din04   => w_din04A,
            i_din05   => w_din05A,
            i_din06   => w_din06A,
            i_din07   => w_din07A,
            i_din08   => w_din08A,
            i_din09   => w_din09A,
            i_din10   => w_din10A,
            i_din11   => w_din11A,
            i_din12   => w_din12A,
            i_din13   => w_din13A,
            i_din14   => w_din14A,
            i_din15   => w_din15A,
            i_din16   => w_din16A,
            i_din17   => w_din17A,
            i_din18   => w_din18A,
            i_din19   => w_din19A,
            i_din20   => w_din20A,
            i_din21   => w_din21A,
            i_din22   => w_din22A,
            i_din23   => w_din23A,
            i_din24   => w_din24A,
            i_din25   => w_din25A,
            i_din26   => w_din26A,
            i_din27   => w_din27A,
            i_din28   => w_din28A,
            i_din29   => w_din29A,
            i_din30   => w_din30A,
            i_din31   => w_din31A,
            o_DOUT    => w_DOUTa
            );

        muxB_32: mux_32x1_32bits port map
        (
            i_SEL     => w_MUX_SELb,
            i_din00   => w_din00B,
            i_din01   => w_din01B,
            i_din02   => w_din02B,
            i_din03   => w_din03B,
            i_din04   => w_din04B,
            i_din05   => w_din05B,
            i_din06   => w_din06B,
            i_din07   => w_din07B,
            i_din08   => w_din08B,
            i_din09   => w_din09B,
            i_din10   => w_din10B,
            i_din11   => w_din11B,
            i_din12   => w_din12B,
            i_din13   => w_din13B,
            i_din14   => w_din14B,
            i_din15   => w_din15B,
            i_din16   => w_din16B,
            i_din17   => w_din17B,
            i_din18   => w_din18B,
            i_din19   => w_din19B,
            i_din20   => w_din20B,
            i_din21   => w_din21B,
            i_din22   => w_din22B,
            i_din23   => w_din23B,
            i_din24   => w_din24B,
            i_din25   => w_din25B,
            i_din26   => w_din26B,
            i_din27   => w_din27B,
            i_din28   => w_din28B,
            i_din29   => w_din29B,
            i_din30   => w_din30B,
            i_din31   => w_din31B,
            o_DOUT    => w_DOUTb
        );
        
        reg_nulo: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(0),
            i_N    => i_WR_DATA,
            o_S    => w_S00
        );

        reg_at: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(1),
            i_N    => i_WR_DATA,
            o_S    => w_S01
        );

        reg_v0: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(2),
            i_N    => i_WR_DATA,
            o_S    => w_S02
        );

        reg_v1: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(3),
            i_N    => i_WR_DATA,
            o_S    => w_S03
        );

        reg_a0: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(4),
            i_N    => i_WR_DATA,
            o_S    => w_S04
        );

        reg_a1: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(5),
            i_N    => i_WR_DATA,
            o_S    => w_S05
        );

        reg_a2: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(6),
            i_N    => i_WR_DATA,
            o_S    => w_S06
        );

        reg_a3: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(7),
            i_N    => i_WR_DATA,
            o_S    => w_S07
        );

        reg_t0: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(8),
            i_N    => i_WR_DATA,
            o_S    => w_S08
        );

        reg_t1: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(9),
            i_N    => i_WR_DATA,
            o_S    => w_S09
        );

        reg_t2: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(10),
            i_N    => i_WR_DATA,
            o_S    => w_S10
        );

        reg_t3: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(11),
            i_N    => i_WR_DATA,
            o_S    => w_S11
        );

        reg_t4: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(12),
            i_N    => i_WR_DATA,
            o_S    => w_S12
        );

        reg_t5: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(13),
            i_N    => i_WR_DATA,
            o_S    => w_S13
        );

        reg_t6: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(14),
            i_N    => i_WR_DATA,
            o_S    => w_S14
        );

        reg_t7: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(15),
            i_N    => i_WR_DATA,
            o_S    => w_S15
        );

        reg_s0: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(16),
            i_N    => i_WR_DATA,
            o_S    => w_S16
        );

        reg_s1: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(17),
            i_N    => i_WR_DATA,
            o_S    => w_S17
        );

        reg_s2: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(18),
            i_N    => i_WR_DATA,
            o_S    => w_S18
        );

        reg_s3: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(19),
            i_N    => i_WR_DATA,
            o_S    => w_S19
        );

        reg_s4: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(20),
            i_N    => i_WR_DATA,
            o_S    => w_S20
        );

        reg_s5: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(21),
            i_N    => i_WR_DATA,
            o_S    => w_S21
        );

        reg_s6: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(22),
            i_N    => i_WR_DATA,
            o_S    => w_S22
        );

        reg_s7: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(23),
            i_N    => i_WR_DATA,
            o_S    => w_S23
        );

        reg_t8: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(24),
            i_N    => i_WR_DATA,
            o_S    => w_S24
        );

        reg_t9: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(25),
            i_N    => i_WR_DATA,
            o_S    => w_S25
        );

        reg_k0: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(26),
            i_N    => i_WR_DATA,
            o_S    => w_S26
        );

        reg_k1: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(27),
            i_N    => i_WR_DATA,
            o_S    => w_S27
        );

        reg_gp: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(28),
            i_N    => i_WR_DATA,
            o_S    => w_S28
        );

        reg_sp: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(29),
            i_N    => i_WR_DATA,
            o_S    => w_S29
        );

        reg_fp: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(30),
            i_N    => i_WR_DATA,
            o_S    => w_S30
        );

        reg_ra: registrador_32bits port map
        (
            i_CLK  => i_CLK_BANK,
            i_CLR  => i_RST,
            i_ena  => w_ena(31),
            i_N    => i_WR_DATA,
            o_S    => w_S31
        );


    process (i_CLK_BANK, i_RST, i_WR, i_RD_ADDR_A, i_RD_ADDR_B, i_WR_ADDR, i_WR_DATA)
    begin

        w_ADDR <= i_WR_ADDR;

        w_ena(0)  <= i_WR and W_DEC_SEL(0);
        w_ena(1)  <= i_WR and W_DEC_SEL(1);
        w_ena(2)  <= i_WR and W_DEC_SEL(2);
        w_ena(3)  <= i_WR and W_DEC_SEL(3);
        w_ena(4)  <= i_WR and W_DEC_SEL(4);
        w_ena(5)  <= i_WR and W_DEC_SEL(5);
        w_ena(6)  <= i_WR and W_DEC_SEL(6);
        w_ena(7)  <= i_WR and W_DEC_SEL(7);
        w_ena(8)  <= i_WR and W_DEC_SEL(8);
        w_ena(9)  <= i_WR and W_DEC_SEL(9);
        w_ena(10) <= i_WR and W_DEC_SEL(10);
        w_ena(11) <= i_WR and W_DEC_SEL(11);
        w_ena(12) <= i_WR and W_DEC_SEL(12);
        w_ena(13) <= i_WR and W_DEC_SEL(13);
        w_ena(14) <= i_WR and W_DEC_SEL(14);
        w_ena(15) <= i_WR and W_DEC_SEL(15);        
        w_ena(16) <= i_WR and W_DEC_SEL(16);
        w_ena(17) <= i_WR and W_DEC_SEL(17);
        w_ena(18) <= i_WR and W_DEC_SEL(18);
        w_ena(19) <= i_WR and W_DEC_SEL(19);
        w_ena(20) <= i_WR and W_DEC_SEL(20);
        w_ena(21) <= i_WR and W_DEC_SEL(21);
        w_ena(22) <= i_WR and W_DEC_SEL(22);
        w_ena(23) <= i_WR and W_DEC_SEL(23);
        w_ena(24) <= i_WR and W_DEC_SEL(24);
        w_ena(25) <= i_WR and W_DEC_SEL(25);
        w_ena(26) <= i_WR and W_DEC_SEL(26);
        w_ena(27) <= i_WR and W_DEC_SEL(27);
        w_ena(28) <= i_WR and W_DEC_SEL(28);
        w_ena(29) <= i_WR and W_DEC_SEL(29);
        w_ena(30) <= i_WR and W_DEC_SEL(30);
        w_ena(31) <= i_WR and W_DEC_SEL(31);

        w_MUX_SELa <= i_RD_ADDR_A;
        w_din00A <= w_S00;
        w_din01A <= w_S01;
        w_din02A <= w_S02;
        w_din03A <= w_S03;
        w_din04A <= w_S04;
        w_din05A <= w_S05;
        w_din06A <= w_S06;
        w_din07A <= w_S07;
        w_din08A <= w_S08;
        w_din09A <= w_S09;
        w_din10A <= w_S10;
        w_din11A <= w_S11;
        w_din12A <= w_S12;
        w_din13A <= w_S13;
        w_din14A <= w_S14;
        w_din15A <= w_S15;
        w_din16A <= w_S16;
        w_din17A <= w_S17;
        w_din18A <= w_S18;
        w_din19A <= w_S19;
        w_din20A <= w_S20;
        w_din21A <= w_S21;
        w_din22A <= w_S22;
        w_din23A <= w_S23;
        w_din24A <= w_S24;
        w_din25A <= w_S25;
        w_din26A <= w_S26;
        w_din27A <= w_S27;
        w_din28A <= w_S28;
        w_din29A <= w_S29;
        w_din30A <= w_S30;
        w_din31A <= w_S31;
        o_RD_DATA_A <= w_DOUTa;

        w_MUX_SELb <= i_RD_ADDR_B;
        w_din00B <= w_S00;
        w_din01B <= w_S01;
        w_din02B <= w_S02;
        w_din03B <= w_S03;
        w_din04B <= w_S04;
        w_din05B <= w_S05;
        w_din06B <= w_S06;
        w_din07B <= w_S07;
        w_din08B <= w_S08;
        w_din09B <= w_S09;
        w_din10B <= w_S10;
        w_din11B <= w_S11;
        w_din12B <= w_S12;
        w_din13B <= w_S13;
        w_din14B <= w_S14;
        w_din15B <= w_S15;
        w_din16B <= w_S16;
        w_din17B <= w_S17;
        w_din18B <= w_S18;
        w_din19B <= w_S19;
        w_din20B <= w_S20;
        w_din21B <= w_S21;
        w_din22B <= w_S22;
        w_din23B <= w_S23;
        w_din24B <= w_S24;
        w_din25B <= w_S25;
        w_din26B <= w_S26;
        w_din27B <= w_S27;
        w_din28B <= w_S28;
        w_din29B <= w_S29;
        w_din30B <= w_S30;
        w_din31B <= w_S31;
        o_RD_DATA_B <= w_DOUTb;
    end process;
end arch_1;