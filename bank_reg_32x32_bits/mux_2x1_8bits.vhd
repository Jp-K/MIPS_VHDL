library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_8bits is
    port
    (
        i_SEL_8 : in  std_logic;
        i_entA_8    : in std_logic_vector( 7 downto 0);
        i_entB_8    : in std_logic_vector( 7 downto 0);
        o_EXT_8     : out std_logic_vector( 7 downto 0)
    );
end mux_2x1_8bits;

architecture arch_1 of mux_2x1_8bits is

    component mux_2x1_1bits is
        port
        (
            i_SEL : in std_logic;
            i_A   : in std_logic;
            i_B   : in std_logic;
            o_S   : out std_logic
        );
    end component;
    
    signal w_SEL, w_A, w_B : std_logic_vector(7 downto 0);


begin

    mux_1: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(0),
        i_A   => w_A(0),
        i_B   => w_B(0),
        o_S   => o_EXT_8(0)
    );
    
    mux_2: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(1),
        i_A   => w_A(1),
        i_B   => w_B(1),
        o_S   => o_EXT_8(1)
    );

    mux_3: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(2),
        i_A   => w_A(2),
        i_B   => w_B(2),
        o_S   => o_EXT_8(2)
    );

    mux_4: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(3),
        i_A   => w_A(3),
        i_B   => w_B(3),
        o_S   => o_EXT_8(3)
    );

    mux_5: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(4),
        i_A   => w_A(4),
        i_B   => w_B(4),
        o_S   => o_EXT_8(4)
    );

    mux_6: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(5),
        i_A   => w_A(5),
        i_B   => w_B(5),
        o_S   => o_EXT_8(5)
    );

    mux_7: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(6),
        i_A   => w_A(6),
        i_B   => w_B(6),
        o_S   => o_EXT_8(6)
    );

    mux_8: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(7),
        i_A   => w_A(7),
        i_B   => w_B(7),
        o_S   => o_EXT_8(7)
    );

    process (i_SEL_8, i_entA_8, i_entB_8)
    begin

        w_SEL(0) <= i_SEL_8;
        w_A(0)   <= i_entA_8(0);
        w_B(0)   <= i_entB_8(0);
        
		  w_SEL(1) <= i_SEL_8;
        w_A(1)   <= i_entA_8(1);
        w_B(1)   <= i_entB_8(1);
		  
		  w_SEL(2) <= i_SEL_8;
        w_A(2)   <= i_entA_8(2);
        w_B(2)   <= i_entB_8(2);
		  
		  w_SEL(3) <= i_SEL_8;
        w_A(3)   <= i_entA_8(3);
        w_B(3)   <= i_entB_8(3);
		  
		  w_SEL(4) <= i_SEL_8;
        w_A(4)   <= i_entA_8(4);
        w_B(4)   <= i_entB_8(4);
		  
		  w_SEL(5) <= i_SEL_8;
        w_A(5)   <= i_entA_8(5);
        w_B(5)   <= i_entB_8(5);
		  
		  w_SEL(6) <= i_SEL_8;
        w_A(6)   <= i_entA_8(6);
        w_B(6)   <= i_entB_8(6);
		  
		  w_SEL(7) <= i_SEL_8;
        w_A(7)   <= i_entA_8(7);
        w_B(7)   <= i_entB_8(7);

    end process;
end arch_1;
