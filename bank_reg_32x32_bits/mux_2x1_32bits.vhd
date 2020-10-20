library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_32bits is
    port
    (
        i_SEL_32     : in  std_logic;
        i_entA_32    : in std_logic_vector( 31 downto 0);
        i_entB_32    : in std_logic_vector( 31 downto 0);
        o_EXT_32     : out std_logic_vector( 31 downto 0)
    );
end mux_2x1_32bits;

architecture arch_1 of mux_2x1_32bits is

    component mux_2x1_8bits is
        port
        (
            i_SEL_8    : in std_logic;
            i_entA_8   : in std_logic_vector( 7 downto 0);
            i_entB_8   : in std_logic_vector( 7 downto 0);
            o_EXT_8    : out std_logic_vector( 7 downto 0)
        );
    end component;
    
    signal w_entA_8, w_entB_8 : std_logic_vector(31 downto 0);
	 signal w_SEL_8 : std_logic_vector(3 downto 0);


begin

    mux8_1: mux_2x1_8bits port map
    (
        i_SEL_8    => w_SEL_8(0),
        i_entA_8   => w_entA_8(7 downto 0),
        i_entB_8   => w_entB_8(7 downto 0),
        o_EXT_8    => o_EXT_32(7 downto 0)
    );
	 
	 mux8_2: mux_2x1_8bits port map
    (
        i_SEL_8   => w_SEL_8(1),
		  i_entA_8  => w_entA_8(15 downto 8),
		  i_entB_8  => w_entB_8(15 downto 8),
		  o_EXT_8   => o_EXT_32(15 downto 8)
    );
	 
	 mux8_3: mux_2x1_8bits port map
    (
        i_SEL_8   => w_SEL_8(2),
		  i_entA_8  => w_entA_8(23 downto 16),
		  i_entB_8  => w_entB_8(23 downto 16),
		  o_EXT_8   => o_EXT_32(23 downto 16)
    );
	 
	 mux8_4: mux_2x1_8bits port map
    (
        i_SEL_8   => w_SEL_8(3),
		  i_entA_8  => w_entA_8(31 downto 24),
		  i_entB_8  => w_entB_8(31 downto 24),
		  o_EXT_8   => o_EXT_32(31 downto 24)
    );
	 

    

    process (i_SEL_32, i_entA_32, i_entB_32)
    begin

        w_SEL_8(0)    <= i_SEL_32;
        w_entA_8(7 downto 0)   <= i_entA_32(7 downto 0);
        w_entB_8(7 downto 0)   <= i_entB_32(7 downto 0);
		  
		  w_SEL_8(1) <= i_SEL_32;
		  w_entA_8(15 downto 8) <= i_entA_32(15 downto 8);
		  w_entB_8(15 downto 8) <= i_entB_32(15 downto 8);
		  
		  w_SEL_8(2) <= i_SEL_32;
		  w_entA_8(23 downto 16) <= i_entA_32(23 downto 16);
		  w_entB_8(23 downto 16) <= i_entB_32(23 downto 16);
		  
		  w_SEL_8(3) <= i_SEL_32;
		  w_entA_8(31 downto 24) <= i_entA_32(31 downto 24);
		  w_entB_8(31 downto 24) <= i_entB_32(31 downto 24);
		  
		  
		  
        
    end process;
end arch_1;
