library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture tb of full_adder_tb is
component full_adder is
    port (
        a     : in std_logic;
        b     : in std_logic;
        c_i   : in std_logic;
        s     : out std_logic;
        c_o   : out std_logic
    ) ;
end component;
signal a_in, b_in, c_in, s_out, c_out : std_logic;
begin
    dut: full_adder port map(a_in, b_in, c_in, s_out, c_out);
    process
    begin
        a_in <= '0';
        b_in <= '0';
        c_in <= '0';
        wait for 1 ns;
        assert(s_out='0' and c_out='0') report "Erro em 0+0 | 0" severity error;

        a_in <= '0';
        b_in <= '0';
        c_in <= '1';
        wait for 1 ns;
        assert(s_out='1' and c_out='0') report "Erro em 0+0 | 1" severity error;

        a_in <= '0';
        b_in <= '1';
        c_in <= '0';
        wait for 1 ns;
        assert(s_out='1' and c_out='0') report "Erro em 0+1 | 0" severity error;

        a_in <= '0';
        b_in <= '1';
        c_in <= '1';
        wait for 1 ns;
        assert(s_out='0' and c_out='1') report "Erro em 0+1 | 1" severity error;

        a_in <= '1';
        b_in <= '0';
        c_in <= '0';
        wait for 1 ns;
        assert(s_out='1' and c_out='0') report "Erro em 1+0 | 0" severity error;

        a_in <= '1';
        b_in <= '0';
        c_in <= '1';
        wait for 1 ns;
        assert(s_out='0' and c_out='1') report "Erro em 1+0 | 1" severity error;

        a_in <= '1';
        b_in <= '1';
        c_in <= '0';
        wait for 1 ns;
        assert(s_out='0' and c_out='1') report "Erro em 1+1 | 0" severity error;

        a_in <= '1';
        b_in <= '1';
        c_in <= '1';
        wait for 1 ns;
        assert(s_out='1' and c_out='1') report "Erro em 1+1 | 1" severity error;

        assert(false) report "Testes realizados com sucesso" severity note;
        wait;
    end process;
end tb  ; -- tb