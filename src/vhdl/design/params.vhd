--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: shared parameters and types in the reconfig_fsm project
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

library ieee; use ieee.std_logic_1164.all;

package params is

    constant C_LENGTH : integer := 2;          -- data length
    constant C_N : integer := 2**C_LENGTH;     -- number of states
    
    subtype fsm_bus is STD_LOGIC_VECTOR(C_LENGTH-1 downto 0); -- data type passed through fsm
    type sub_bus is array (C_N-1 downto 0) of fsm_bus;        -- combination of fsm_buses

end package;