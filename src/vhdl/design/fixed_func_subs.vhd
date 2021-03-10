--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: Fixed substitutions based on addition and circular shift
--version	    : 1.0
--===============================================================================
--					             CHANGES LOG
---------------------------------------------------------------------------------
--  who/when    | ver | 		changes description
---------------------------------------------------------------------------------
--  sirazenkov  | 1.0 | Initial version of module
---------------------------------------------------------------------------------
--  
--===============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std_unsigned.all;

library work; use work.params.all;

entity fixed_func_subs is
    port ( d : in fsm_bus;
           subs : out sub_bus);
end fixed_func_subs;

architecture synth of fixed_func_subs is
begin
    gen_subs: process(all) begin
    for i in (C_N-1) downto 0 loop
        subs(i) <= (d rol (i mod C_LENGTH)) + i;
    end loop;
end process;

end synth;
