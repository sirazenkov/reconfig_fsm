--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: ROM implementation of substitutions
--version	    : 1.0
--===============================================================================
--					             CHANGES LOG
---------------------------------------------------------------------------------
--  who/when    | ver | 		changes description
---------------------------------------------------------------------------------
--  sirazenkov  | 1.0 | Initial version of module
---------------------------------------------------------------------------------
--  sirazenkov  | 1.1 | Implemented substitutions from DES S-boxes (S1-S4)
---------------------------------------------------------------------------------
--              |     | 
--===============================================================================

library work; use work.params.all;

library IEEE; use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std_unsigned.all;

entity sub_rom is
    port (
          addr : in fsm_bus;
          dout : out sub_bus   -- output data (Sub(d))  
          ); 
end sub_rom;

architecture synth of sub_rom is
begin

  process(all) begin
    case addr is
        when X"0" => dout <= (X"3", X"A", X"D", X"7", X"1", X"D", X"D", X"A", X"D", X"0", X"3", X"F", X"F", X"4", X"0", X"E");
        when X"1" => dout <= (X"F", X"6", X"8", X"D", X"A", X"6", X"7", X"0", X"8", X"E", X"D", X"1", X"C", X"1", X"F", X"2");
        when X"2" => dout <= (X"0", X"9", X"B", X"E", X"D", X"4", X"0", X"9", X"A", X"7", X"4", X"8", X"8", X"E", X"7", X"D");
        when X"3" => dout <= (X"6", X"0", X"5", X"3", X"0", X"9", X"9", X"E", X"1", X"B", X"7", X"E", X"2", X"8", X"4", X"1");
        when X"4" => dout <= (X"A", X"C", X"6", X"0", X"6", X"8", X"3", X"6", X"3", X"A", X"F", X"6", X"4", X"D", X"E", X"2");
        when X"5" => dout <= (X"1", X"B", X"F", X"6", X"9", X"F", X"4", X"3", X"F", X"4", X"2", X"B", X"9", X"6", X"2", X"F");
        when X"6" => dout <= (X"D", X"7", X"0", X"9", X"8", X"3", X"6", X"F", X"4", X"D", X"8", X"3", X"1", X"2", X"D", X"B");
        when X"7" => dout <= (X"8", X"D", X"3", X"A", X"7", X"0", X"A", X"5", X"2", X"1", X"E", X"4", X"7", X"B", X"1", X"8");
        when X"8" => dout <= (X"9", X"F", X"4", X"1", X"4", X"B", X"2", X"1", X"B", X"5", X"C", X"9", X"5", X"F", X"A", X"3");
        when X"9" => dout <= (X"4", X"1", X"7", X"2", X"F", X"1", X"8", X"D", X"6", X"8", X"0", X"7", X"B", X"C", X"6", X"A");
        when X"A" => dout <= (X"5", X"3", X"2", X"8", X"E", X"2", X"5", X"C", X"7", X"C", X"1", X"2", X"3", X"9", X"C", X"6");
        when X"B" => dout <= (X"B", X"E", X"C", X"5", X"3", X"C", X"E", X"7", X"C", X"6", X"A", X"D", X"E", X"7", X"B", X"C");
        when X"C" => dout <= (X"C", X"5", X"1", X"B", X"B", X"5", X"C", X"B", X"0", X"9", X"6", X"C", X"A", X"3", X"9", X"5");
        when X"D" => dout <= (X"7", X"2", X"A", X"C", X"5", X"A", X"B", X"4", X"5", X"3", X"9", X"0", X"0", X"A", X"5", X"9");
        when X"E" => dout <= (X"2", X"8", X"E", X"4", X"2", X"E", X"F", X"2", X"E", X"2", X"B", X"5", X"6", X"5", X"3", X"0");
        when X"F" => dout <= (X"E", X"4", X"9", X"F", X"C", X"7", X"1", X"8", X"9", X"F", X"5", X"A", X"D", X"0", X"8", X"7");
    end case;
  end process;

end synth;