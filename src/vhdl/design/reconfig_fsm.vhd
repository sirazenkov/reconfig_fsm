--======================================================================================================
--company	    : Tomsk State University
--developer	    : sirazenkov
--e-mail	    : sirazenkov@stud.tsu.ru
--description	: Reconfigurable FSM based on substitutions
--version	    : 1.1
--======================================================================================================
--					             CHANGES LOG
--------------------------------------------------------------------------------------------------------
--  who/when    | ver | 		changes description
--------------------------------------------------------------------------------------------------------
--  sirazenkov  | 1.0 | Initial version of module
--------------------------------------------------------------------------------------------------------
--  sirazenkov  | 1.1 | Added substitutions based on RAM and ROM memory
--======================================================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD_UNSIGNED.ALL;

library work; use work.params.all; use work.all;

entity reconfig_fsm is
    port ( x : in fsm_bus;          -- input data
           k_x : in fsm_bus;        -- Sub_X key
           k_s : in fsm_bus;        -- Sub_S key
           k_y : in fsm_bus;        -- Sub_Y key
           clk: in STD_LOGIC;       -- clock signal
           reset: in STD_LOGIC;     -- reset fsm to null state
           subs_set: in STD_LOGIC;  -- set Sub_X, Sub_S and Sub_Y
           subs_set_addr: in fsm_bus; -- pass address when setting the substitutions
           y : out fsm_bus);        -- output data
end reconfig_fsm;

architecture struct of reconfig_fsm is
    signal work_mode : STD_LOGIC;
    signal state : fsm_bus := (others => '0');  -- current state 
    signal next_state : fsm_bus;                -- next state of the fsm
    signal xk, sk, sy : fsm_bus;                -- for Sub_X(X), Sub_S(S) and Sub_Y(S)
    signal main_bus : sub_bus;                 -- combination of fixed substitutions Sub_I, I = 0, ... , 2^n-1
    
    attribute dont_touch : string;
    component fixed_func_subs
        port(
           d : in fsm_bus;
           subs : out sub_bus
        );
    end component;
    attribute dont_touch of fixed_func_subs : component is "yes";
    
begin
    work_mode <= not subs_set;

    --State register
-------------------------------------------------------
    clock : process(clk, reset) is
    begin
        if reset = '1' then
            state <= (others => '0');        
        elsif rising_edge(clk) and work_mode = '1' then
            state <= next_state;
        end if;
    end process clock; 
--------------------------------------------------------   
     
    Sub_X: entity work.sub_ram(synth)
        port map(
        clk => clk,
        we => subs_set,
        ra => x, 
        wa => subs_set_addr, 
        d => k_x, 
        dout => xk
        );   

    --Sub_I (I = 0, ... , states quantity)
----------------------------------
    Sub_I: entity work.sub_scheme port map(
        addr => xk, 
        dout => main_bus
    );
---------------------------------- 

    Sub_S: entity work.sub_ram(synth)
        port map(
        clk => clk, 
        we => subs_set,
        ra => state,
        wa => subs_set_addr, 
        d => k_s, 
        dout => sk
        );
    
    choose_next_state : entity work.mux(synch) -- Choose next state multiplexer
    port map(
        subs => main_bus,
        sel => sk,
        dout => next_state
    );

    Sub_Y: entity work.sub_ram(synth)
        port map(
        clk => clk, 
        we => subs_set,  
        ra => state,
        wa => subs_set_addr, 
        d => k_y,
        dout => sy
        );
           
    choose_output : entity work.mux(synch) -- Choose output signal multiplexer
    port map(
        subs => main_bus,
        sel => sy,
        dout => y
    );

end struct;