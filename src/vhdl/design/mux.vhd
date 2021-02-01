--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: multiplexer for the reconfig_fsm
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

entity mux is
    port ( 
        subs : in sub_bus;
        sel : in fsm_bus;
        dout : out fsm_bus
    );
end mux;

architecture synch of mux is
begin
    dout <= subs(to_integer(sel));
end synch;
