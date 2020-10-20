library ieee;
use ieee.std_logic_1164.all;

entity Control_mips is
	port(
    	  i_op : in std_logic_vector(5 downto 0);
        i_CLK : in std_logic;
        o_RegDst : out std_logic;
        o_ALUSrc : out std_logic;
        o_MemToReg : out std_logic;
        o_RegWrite : out std_logic;
        o_MemWrite : out std_logic;
        o_Branch   : out std_logic;
        o_ALUOp1    : out std_logic;
        o_ALUOp0    : out std_logic;
        o_j         : out std_logic
		  );
end Control_mips;

architecture arch_1 of Control_mips is

signal w_Rformat : std_logic;
signal w_lw      : std_logic;
signal w_sw      : std_logic;
signal w_beq     : std_logic;
signal w_addr    : std_logic;
signal w_jump    : std_logic;

begin 

process(i_op, i_CLK)
begin
	
    if (i_op = "000000") then
		w_Rformat <= '1';
		else
		w_Rformat <= '0';
		end if;
	 if (i_op = "100010") then
		w_lw <= '1';
		else
		w_lw <= '0';
		end if;
	 if (i_op = "100011") then
		w_sw <= '1';
		else
		w_sw <= '0';
		end if;
	 if (i_op = "000100") then
		w_beq <= '1';
		else
		w_beq <= '0';
		end if;
    if (i_op = "001000") then
		w_addr <= '1';
		else
		w_addr <= '0';
		end if;
	 if (w_Rformat = '1') then
		o_RegDst <= '1';
		else
		o_RegDst <= '0';
		end if;
	 if (i_op = "000010") then
		w_jump <= '1';
		else
		w_jump <= '0';
		end if;

	 if ((w_lw = '1') or (w_sw = '1') or (w_addr = '1')) then
			o_ALUSrc <= '1';
			else
			o_ALUSrc <= '0';
			end if;
	 if (w_lw = '1') then
		o_MemToReg <= '1';
		else
		o_MemToReg <= '0';
		end if;
	 if ((i_CLK = '0') and ((w_Rformat = '1') or (w_lw = '1') or (w_addr = '1'))) then
		o_RegWrite <= '1';
		else
		o_RegWrite <= '0';
		end if;
	 if (w_lw = '1') then
		o_MemToReg <= '1';
		else
		o_MemToReg <= '0';
		end if;
	 if ((i_CLK = '0') and (w_sw = '1')) then
		o_MemWrite <= '1';
		else
		o_MemWrite <= '0';
		end if;
	 if (w_beq = '1') then
		o_Branch <= '1';
		else
		o_Branch <= '0';
		end if;
	 if (w_Rformat = '1') then
		o_ALUOp1 <= '1';
		else
		o_ALUOp1 <= '0';
		end if;
    if (w_beq = '1') then
		o_ALUOp0 <= '1';
		else
		o_ALUOp0 <= '0';
		end if;
	 if (w_jump = '1') then
		o_j <= '1';
		else
		o_j <= '0';
		end if;
	 
end process;

end arch_1;
    
