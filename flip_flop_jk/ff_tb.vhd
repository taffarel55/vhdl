library ieee;
use ieee.std_logic_1164.all;

entity ff_tb is
end entity;

architecture tb of ff_tb is 
component flip_flop_jk is 
port(
    clock  : in std_logic;
    J, K   : in std_logic;
    reset  : in std_logic;
    Q, Qbar: out std_logic
);
end component;
signal j : std_logic := '0';
signal k : std_logic := '0';
signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal q : std_logic;
signal qb : std_logic;
signal aux: std_logic;
constant clk_period : time := 10 ns;
begin
    uut: flip_flop_jk port map(clk,j,k,rst,Q,Qb);
    
    clk_process:process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin  
        rst <= '1';
        wait for 50 ns; 
        assert (q='0') report "Não está resetando" severity error;

        rst <= '0';
        j <= '0';
        k <= '1';
        wait for 50 ns;
        assert (q='0') report "Não está limpando" severity error;
        
        rst <= '0';
        j <= '1'; 
        k <= '0';
        wait for 50 ns;
        assert (q='1') report "Não está setando" severity error;
        
        aux <= q;
        rst <= '0';
        j <= '1'; 
        k <= '1';
        wait for 50 ns;
        assert (q/=aux) report "Não está invertendo" severity error;

        assert false report "Testes realizados" severity note;
        wait;
        rst <= '0';
        j <= '0'; 
        k <= '0';
    end process;
end;