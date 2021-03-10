--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: distributed LUT RAM implementation of fixed substitutions
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

entity sub_ram_lut is
    port (
          clk : in STD_LOGIC;  -- clock signal
          we : in STD_LOGIC_VECTOR(C_N-1 downto 0);   -- write (substitution) enable
          ra : in sub_bus;     -- read address 
          wa : in sub_bus;     -- write address 
          d : in sub_bus;      -- data input
          dout : out sub_bus   -- output data (Sub(d))
          ); 
end sub_ram_lut;

architecture synth of sub_ram_lut is

    type rom_type is array (0 to C_N-1) of sub_bus;
    signal ROM : rom_type := ((X"3", X"A", X"D", X"7", X"1", X"D", X"D", X"A", X"D", X"0", X"3", X"F", X"F", X"4", X"0", X"E"),
                             (X"F", X"6", X"8", X"D", X"A", X"6", X"7", X"0", X"8", X"E", X"D", X"1", X"C", X"1", X"F", X"2"),
                             (X"0", X"9", X"B", X"E", X"D", X"4", X"0", X"9", X"A", X"7", X"4", X"8", X"8", X"E", X"7", X"D"),
                             (X"6", X"0", X"5", X"3", X"0", X"9", X"9", X"E", X"1", X"B", X"7", X"E", X"2", X"8", X"4", X"1"),
                             (X"A", X"C", X"6", X"0", X"6", X"8", X"3", X"6", X"3", X"A", X"F", X"6", X"4", X"D", X"E", X"2"),
                             (X"1", X"B", X"F", X"6", X"9", X"F", X"4", X"3", X"F", X"4", X"2", X"B", X"9", X"6", X"2", X"F"),
                             (X"D", X"7", X"0", X"9", X"8", X"3", X"6", X"F", X"4", X"D", X"8", X"3", X"1", X"2", X"D", X"B"),
                             (X"8", X"D", X"3", X"A", X"7", X"0", X"A", X"5", X"2", X"1", X"E", X"4", X"7", X"B", X"1", X"8"),
                             (X"9", X"F", X"4", X"1", X"4", X"B", X"2", X"1", X"B", X"5", X"C", X"9", X"5", X"F", X"A", X"3"),
                             (X"4", X"1", X"7", X"2", X"F", X"1", X"8", X"D", X"6", X"8", X"0", X"7", X"B", X"C", X"6", X"A"),
                             (X"5", X"3", X"2", X"8", X"E", X"2", X"5", X"C", X"7", X"C", X"1", X"2", X"3", X"9", X"C", X"6"),
                             (X"B", X"E", X"C", X"5", X"3", X"C", X"E", X"7", X"C", X"6", X"A", X"D", X"E", X"7", X"B", X"C"),
                             (X"C", X"5", X"1", X"B", X"B", X"5", X"C", X"B", X"0", X"9", X"6", X"C", X"A", X"3", X"9", X"5"),
                             (X"7", X"2", X"A", X"C", X"5", X"A", X"B", X"4", X"5", X"3", X"9", X"0", X"0", X"A", X"5", X"9"),
                             (X"2", X"8", X"E", X"4", X"2", X"E", X"F", X"2", X"E", X"2", X"B", X"5", X"6", X"5", X"3", X"0"),
                             (X"E", X"4", X"9", X"F", X"C", X"7", X"1", X"8", X"9", X"F", X"5", X"A", X"D", X"0", X"8", X"7")); 
   attribute ram_style : string;
   attribute ram_style of ROM : signal is "distributed";
   
begin

    write_rom: process(clk) begin
        for i in 0 to C_N-1 loop
            if rising_edge(clk) and we(i)='1' then
                rom(i)(to_integer(wa(i))) <= d(i);
            end if;
        end loop; 
    end process;

    process(all) begin
        for i in 0 to C_N-1 loop
            dout(i) <= ROM(i)(to_integer(ra(i)));
        end loop;
    end process;
    
end synth;