--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: ROM for fixed substitutions
--version	    : 1.0 (NOT DONE)
--===============================================================================
--					             CHANGES LOG
---------------------------------------------------------------------------------
--  who/when    | ver | 		changes description
---------------------------------------------------------------------------------
--  sirazenkov  | 1.0 | Initial version of module
---------------------------------------------------------------------------------
--  
--===============================================================================

-------------------------------------------------------------------------------
--          _    _         ___           _    _    _    __   _    _   __   __ |
-- \    /  / \  |_)  |/     |   |\ |    |_)  |_)  / \  /__  |_)  |_  (_   (_  |
--  \/\/   \_/  | \  |\    _|_  | \|    |    | \  \_/  \_|  | \  |_  __)  __) |
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work; use work.params.all;

entity sub_rom is
    port ( addr : in fsm_bus;
           dout : out sub_bus);
end sub_rom;

architecture synth of sub_rom is
begin
    with addr select dout(0) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"1" when X"4",
        X"F" when X"5",
        X"D" when X"6",
        X"3" when X"7",
        X"6" when X"8",
        X"4" when X"9",
        X"0" when X"A",
        X"E" when X"B",
        X"B" when X"C",
        X"7" when X"D",
        X"9" when X"E",
        X"C" when X"F",
        X"0" when others;
        
    with addr select dout(1) <=
        X"F" when X"0",
        X"3" when X"1",
        X"8" when X"2",
        X"1" when X"3",
        X"D" when X"4",
        X"B" when X"5",
        X"A" when X"6",
        X"6" when X"7",
        X"E" when X"8",
        X"7" when X"9",
        X"2" when X"A",
        X"4" when X"B",
        X"5" when X"C",
        X"C" when X"D",
        X"9" when X"E",
        X"0" when X"F",
        X"0" when others;
        -- UNFINISHED SUBSTITUTIONS BELOW
    with addr select dout(2) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
    with addr select dout(3) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
     with addr select dout(4) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others; 
        
    with addr select dout(5) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others; 
        
    with addr select dout(6) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
    with addr select dout(7) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
    with addr select dout(8) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;  
    
    with addr select dout(9) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
    with addr select dout(10) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
     with addr select dout(11) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others; 
        
     with addr select dout(12) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
      with addr select dout(13) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
     with addr select dout(14) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;
        
     with addr select dout(15) <=
        X"5" when X"0",
        X"A" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"A" when X"4",
        X"A" when X"5",
        X"A" when X"6",
        X"A" when X"7",
        X"A" when X"8",
        X"A" when X"9",
        X"A" when X"A",
        X"A" when X"B",
        X"A" when X"C",
        X"A" when X"D",
        X"A" when X"E",
        X"A" when X"F",
        X"0" when others;                                         
end synth;
