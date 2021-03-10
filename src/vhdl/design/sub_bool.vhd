--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: With-select (vector boolean function) implementatuion of fixed substitutions
--version	    : 1.1
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

library IEEE; use IEEE.STD_LOGIC_1164.ALL;

library work; use work.params.all;

entity sub_bool is
    port ( addr : in fsm_bus;
           dout : out sub_bus);
end sub_bool;

architecture synth of sub_bool is
begin

    with addr select dout(0) <=
        X"E" when X"0",
        X"4" when X"1",
        X"D" when X"2",
        X"1" when X"3",
        X"2" when X"4",
        X"F" when X"5",
        X"B" when X"6",
        X"8" when X"7",
        X"3" when X"8",
        X"A" when X"9",
        X"6" when X"A",
        X"C" when X"B",
        X"5" when X"C",
        X"9" when X"D",
        X"0" when X"E",
        X"7" when X"F",
        X"0" when others;
        
    with addr select dout(1) <=
        X"0" when X"0",
        X"F" when X"1",
        X"7" when X"2",
        X"4" when X"3",
        X"E" when X"4",
        X"2" when X"5",
        X"D" when X"6",
        X"1" when X"7",
        X"A" when X"8",
        X"6" when X"9",
        X"C" when X"A",
        X"B" when X"B",
        X"9" when X"C",
        X"5" when X"D",
        X"3" when X"E",
        X"8" when X"F",
        X"0" when others;
        
    with addr select dout(2) <=
        X"4" when X"0",
        X"1" when X"1",
        X"E" when X"2",
        X"8" when X"3",
        X"D" when X"4",
        X"6" when X"5",
        X"2" when X"6",
        X"B" when X"7",
        X"F" when X"8",
        X"C" when X"9",
        X"9" when X"A",
        X"7" when X"B",
        X"3" when X"C",
        X"A" when X"D",
        X"5" when X"E",
        X"0" when X"F",
        X"0" when others;
        
    with addr select dout(3) <=
        X"F" when X"0",
        X"C" when X"1",
        X"8" when X"2",
        X"2" when X"3",
        X"4" when X"4",
        X"9" when X"5",
        X"1" when X"6",
        X"7" when X"7",
        X"5" when X"8",
        X"B" when X"9",
        X"3" when X"A",
        X"E" when X"B",
        X"A" when X"C",
        X"0" when X"D",
        X"6" when X"E",
        X"D" when X"F",
        X"0" when others;
        
     with addr select dout(4) <=
        X"F" when X"0",
        X"1" when X"1",
        X"8" when X"2",
        X"E" when X"3",
        X"6" when X"4",
        X"B" when X"5",
        X"3" when X"6",
        X"4" when X"7",
        X"9" when X"8",
        X"7" when X"9",
        X"2" when X"A",
        X"D" when X"B",
        X"C" when X"C",
        X"0" when X"D",
        X"5" when X"E",
        X"A" when X"F",
        X"0" when others; 
        
    with addr select dout(5) <=
        X"3" when X"0",
        X"D" when X"1",
        X"4" when X"2",
        X"7" when X"3",
        X"F" when X"4",
        X"2" when X"5",
        X"8" when X"6",
        X"E" when X"7",
        X"C" when X"8",
        X"0" when X"9",
        X"1" when X"A",
        X"A" when X"B",
        X"6" when X"C",
        X"9" when X"D",
        X"B" when X"E",
        X"5" when X"F",
        X"0" when others; 
        
    with addr select dout(6) <=
        X"0" when X"0",
        X"E" when X"1",
        X"7" when X"2",
        X"B" when X"3",
        X"A" when X"4",
        X"4" when X"5",
        X"D" when X"6",
        X"1" when X"7",
        X"5" when X"8",
        X"8" when X"9",
        X"C" when X"A",
        X"6" when X"B",
        X"9" when X"C",
        X"3" when X"D",
        X"2" when X"E",
        X"F" when X"F",
        X"0" when others;
        
    with addr select dout(7) <=
        X"D" when X"0",
        X"8" when X"1",
        X"A" when X"2",
        X"1" when X"3",
        X"3" when X"4",
        X"F" when X"5",
        X"4" when X"6",
        X"2" when X"7",
        X"B" when X"8",
        X"6" when X"9",
        X"7" when X"A",
        X"C" when X"B",
        X"0" when X"C",
        X"5" when X"D",
        X"E" when X"E",
        X"9" when X"F",
        X"0" when others;
        
    with addr select dout(8) <=
        X"A" when X"0",
        X"0" when X"1",
        X"9" when X"2",
        X"E" when X"3",
        X"6" when X"4",
        X"3" when X"5",
        X"F" when X"6",
        X"5" when X"7",
        X"1" when X"8",
        X"D" when X"9",
        X"C" when X"A",
        X"7" when X"B",
        X"B" when X"C",
        X"4" when X"D",
        X"2" when X"E",
        X"8" when X"F",
        X"0" when others;  
    
    with addr select dout(9) <=
        X"D" when X"0",
        X"7" when X"1",
        X"0" when X"2",
        X"9" when X"3",
        X"3" when X"4",
        X"4" when X"5",
        X"6" when X"6",
        X"A" when X"7",
        X"2" when X"8",
        X"8" when X"9",
        X"5" when X"A",
        X"E" when X"B",
        X"C" when X"C",
        X"B" when X"D",
        X"F" when X"E",
        X"1" when X"F",
        X"0" when others;
        
    with addr select dout(10) <=
        X"D" when X"0",
        X"6" when X"1",
        X"4" when X"2",
        X"9" when X"3",
        X"8" when X"4",
        X"F" when X"5",
        X"3" when X"6",
        X"0" when X"7",
        X"B" when X"8",
        X"1" when X"9",
        X"2" when X"A",
        X"C" when X"B",
        X"5" when X"C",
        X"A" when X"D",
        X"E" when X"E",
        X"7" when X"F",
        X"0" when others;
        
     with addr select dout(11) <=
        X"1" when X"0",
        X"A" when X"1",
        X"D" when X"2",
        X"0" when X"3",
        X"6" when X"4",
        X"9" when X"5",
        X"8" when X"6",
        X"7" when X"7",
        X"4" when X"8",
        X"F" when X"9",
        X"E" when X"A",
        X"3" when X"B",
        X"B" when X"C",
        X"5" when X"D",
        X"2" when X"E",
        X"C" when X"F",
        X"0" when others; 
        
     with addr select dout(12) <=
        X"7" when X"0",
        X"D" when X"1",
        X"E" when X"2",
        X"3" when X"3",
        X"0" when X"4",
        X"6" when X"5",
        X"9" when X"6",
        X"A" when X"7",
        X"1" when X"8",
        X"2" when X"9",
        X"8" when X"A",
        X"5" when X"B",
        X"B" when X"C",
        X"C" when X"D",
        X"4" when X"E",
        X"F" when X"F",
        X"0" when others;
        
      with addr select dout(13) <=
        X"D" when X"0",
        X"8" when X"1",
        X"B" when X"2",
        X"5" when X"3",
        X"6" when X"4",
        X"F" when X"5",
        X"0" when X"6",
        X"3" when X"7",
        X"4" when X"8",
        X"7" when X"9",
        X"2" when X"A",
        X"C" when X"B",
        X"1" when X"C",
        X"A" when X"D",
        X"E" when X"E",
        X"9" when X"F",
        X"0" when others;
        
     with addr select dout(14) <=
        X"A" when X"0",
        X"6" when X"1",
        X"9" when X"2",
        X"0" when X"3",
        X"C" when X"4",
        X"B" when X"5",
        X"7" when X"6",
        X"D" when X"7",
        X"F" when X"8",
        X"1" when X"9",
        X"3" when X"A",
        X"E" when X"B",
        X"5" when X"C",
        X"2" when X"D",
        X"8" when X"E",
        X"4" when X"F",
        X"0" when others;
        
     with addr select dout(15) <=
        X"3" when X"0",
        X"F" when X"1",
        X"0" when X"2",
        X"6" when X"3",
        X"A" when X"4",
        X"1" when X"5",
        X"D" when X"6",
        X"8" when X"7",
        X"9" when X"8",
        X"4" when X"9",
        X"5" when X"A",
        X"B" when X"B",
        X"C" when X"C",
        X"7" when X"D",
        X"2" when X"E",
        X"E" when X"F",
        X"0" when others;
                                                 
end synth;
