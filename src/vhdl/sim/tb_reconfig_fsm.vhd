--===============================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: testbench for the reconfig_fsm module
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

library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std_unsigned.all;

library work; 
use work.params.all;
use work.all;

entity tb is
end;

architecture reconfig_fsm of tb is
    signal x, k_x, k_s, k_y, subs_set_addr, y : fsm_bus;
    signal clk, reset, subs_set : STD_LOGIC;
begin
    dut : entity work.reconfig_fsm(struct)
    port map(
    x => x, 
    k_x => k_x, 
    k_s => k_s, 
    k_y => k_y, 
    clk => clk, 
    reset => reset, 
    subs_set => subs_set,
    subs_set_addr => subs_set_addr, 
    y => y
    );
    
    clock : process begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    test : process 
        file tv : text;
        variable L: line;
        variable k_x_in, k_s_in, k_y_in, x_in, y_expected : fsm_bus;
        variable dummy : character;
        variable vector_num : integer := 0;
    begin
    -- Set substitutions (Sub_X, Sub_S, Sub_Y)
    -------------------------------------------------------------
    -- Time needed: 30 ns + C_N * 10
    ---------------------------------
        subs_set <= '1';
        reset <= '1'; wait for 27 ns; reset <= '0';
    
        FILE_OPEN(tv, "G:\CourseProjects\Course_3_Project\src\test_vectors\example1.tv", READ_MODE);
        
        subs_set_addr <= (others => '0');
        
        for i in 0 to C_N-1 loop
            readline(tv, L);
            read(L, k_x_in);
            read(L, dummy); -- skip the underscore _
            read(L, k_s_in);
            read(L, dummy);
            read(L, k_y_in);
                
            k_x <= k_x_in;
            k_s <= k_s_in;
            k_y <= k_y_in;
                
            wait until rising_edge(clk); 
            
            subs_set_addr <= subs_set_addr + 1; 
        end loop;
        subs_set <= '0';
    -------------------------------------------------------------
    
        readline(tv, L); -- read empty line
        
    -- Test
    -------------------------------------------------------------
    -- Time needed: number_of_test_vectors * 10 - 5
    --------------------------------------------------
        while not endfile(tv) loop
            readline(tv, L);
            read(L, x_in);
            read(L, dummy); -- skip underscore _
            read(L, y_expected);
            
            x <= x_in;
            wait for 1 ns;
            
            assert y = y_expected 
            report "Error on vector: " & integer'image(vector_num+1)
            severity error;
            
            wait until rising_edge(clk);
            
            vector_num := vector_num + 1;
        end loop;
        
        report integer'image(vector_num) & " tests completed.";
    -------------------------------------------------------------
     end process;   
end;