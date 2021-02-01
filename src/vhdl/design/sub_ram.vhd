--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: Substitution implementation based on RAM
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

entity sub_ram is
    port ( 
           clk : in STD_LOGIC;  -- clock signal
           we : in STD_LOGIC;   -- write (substitution) enable
           ra : in fsm_bus;   -- read address 
           wa : in fsm_bus;   -- write address 
           d : in fsm_bus;      -- data input
           dout : out fsm_bus); -- output data (Sub(d))
end sub_ram;

architecture synth of sub_ram is
    signal ram : sub_bus; 
begin
    write_ram: process(clk) begin
        if rising_edge(clk) and we='1' then
            ram(to_integer(wa)) <= d;
        end if; 
    end process;
    
    dout <= ram(to_integer(ra));
end synth;
