library ieee;
use ieee.std_logic_1164.all;

entity mux_4x1_32bits is
    port
    (
        i_SEL     : in  std_logic_vector(1 downto 0);
        i_A       : in std_logic_vector( 31 downto 0);
        i_B       : in std_logic_vector( 31 downto 0);
        i_C       : in std_logic_vector( 31 downto 0);
        i_D       : in std_logic_vector( 31 downto 0);
        o_EXT     : out std_logic_vector( 31 downto 0)
    );
end mux_4x1_32bits;

architecture arch_1 of mux_4x1_32bits is

    component mux_2x1_32bits is
        port
        (
            i_SEL_32    : in std_logic;
            i_entA_32   : in std_logic_vector( 31 downto 0);
            i_entB_32   : in std_logic_vector( 31 downto 0);
            o_EXT_32    : out std_logic_vector( 31 downto 0)
        );
    end component;
    
    signal w_entA_32, w_entB_32 : std_logic_vector(31 downto 0);
    signal w_entAA_32, w_entBB_32 : std_logic_vector(31 downto 0);
    signal w_entAAA_32, w_entBBB_32 : std_logic_vector(31 downto 0);
    signal w_EXTa_32, w_EXTb_32 : std_logic_vector(31 downto 0);
    signal w_SEL_32 : std_logic_vector(2 downto 0);


begin

    mux32_1: mux_2x1_32bits port map
    (
        i_SEL_32    => w_SEL_32(0),
        i_entA_32   => w_entA_32(31 downto 0),
        i_entB_32   => w_entB_32(31 downto 0),
        o_EXT_32    => w_EXTa_32(31 downto 0)
    );
    
    mux32_2: mux_2x1_32bits port map
    (
        i_SEL_32    => w_SEL_32(1),
        i_entA_32   => w_entAA_32(31 downto 0),
        i_entB_32   => w_entBB_32(31 downto 0),
        o_EXT_32    => w_EXTb_32(31 downto 0)
    );

    mux32_3: mux_2x1_32bits port map
    (
        i_SEL_32    => w_SEL_32(2),
        i_entA_32   => w_entAAA_32(31 downto 0),
        i_entB_32   => w_entBBB_32(31 downto 0),
        o_EXT_32    => o_EXT(31 downto 0)
    );


    process (i_SEL, i_A, i_B, i_C, i_D)
    begin


        w_SEL_32(0) <= i_SEL(0);
        w_entA_32 <= i_A(31 downto 0);
        w_entB_32 <= i_B(31 downto 0);
        

        w_SEL_32(1) <= i_SEL(0);
        w_entAA_32 <= i_A(31 downto 0);
        w_entBB_32 <= i_B(31 downto 0);
        

        w_SEL_32(2) <= i_SEL(1);
        w_entAAA_32 <= w_EXTa_32(31 downto 0);
        w_entBBB_32 <= w_EXTb_32(31 downto 0);
        
    end process;
end arch_1;
