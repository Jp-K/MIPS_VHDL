library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_5bits is
    port
    (
        i_SEL_5 : in std_logic;
        i_entA  : in std_logic_vector(4 downto 0);
        i_entB  : in std_logic_vector(4 downto 0);
        o_S_5   : out std_logic_vector(4 downto 0)
    );
end mux_2x1_5bits;

architecture arch_1 of mux_2x1_5bits is

    component mux_2x1_1bits is
        port
        (
            i_SEL : in std_logic;
            i_A   : in std_logic;
            i_B   : in std_logic;
            o_S   : out std_logic
        );
    end component;

    signal w_SEL, w_A, w_B, w_S : std_logic_vector(4 downto 0);

begin

    mux_1: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(0),
        i_A   => w_A(0),
        i_B   => w_B(0),
        o_S   => w_S(0)
    );
    
    mux_2: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(1),
        i_A   => w_A(1),
        i_B   => w_B(1),
        o_S   => w_S(1)
    );

    mux_3: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(2),
        i_A   => w_A(2),
        i_B   => w_B(2),
        o_S   => w_S(2)
    );

    mux_4: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(3),
        i_A   => w_A(3),
        i_B   => w_B(3),
        o_S   => w_S(3)
    );

    mux_5: mux_2x1_1bits port map
    (
        i_SEL => w_SEL(4),
        i_A   => w_A(4),
        i_B   => w_B(4),
        o_S   => w_S(4)
    );

process (i_SEL_5, i_entA, i_entB)
begin

    w_SEL(0) <= i_SEL_5;
    w_A(0)   <= i_entA(0);
    w_B(0)   <= i_entB(0);
	 o_S_5(0) <= w_S(0);
    
	w_SEL(1) <= i_SEL_5;
    w_A(1)   <= i_entA(1);
    w_B(1)   <= i_entB(1);
	 o_S_5(1) <= w_S(1);
	 
	w_SEL(2) <= i_SEL_5;
    w_A(2)   <= i_entA(2);
    w_B(2)   <= i_entB(2);
	 o_S_5(2) <= w_S(2);
	 
	w_SEL(3) <= i_SEL_5;
    w_A(3)   <= i_entA(3);
    w_B(3)   <= i_entB(3);
	 o_S_5(3) <= w_S(3);
	 
	w_SEL(4) <= i_SEL_5;
    w_A(4)   <= i_entA(4);
    w_B(4)   <= i_entB(4);
	 o_S_5(4) <= w_S(4);
end process;
end arch_1;