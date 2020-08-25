library ieee;
use ieee.std_logic_1164.all;

entity and_gate_tb is
end and_gate_tb;

architecture rtl of and_gate_tb is
component and_gate is
    port (
        a : in std_logic;
        b : in std_logic;
        q : out std_logic
    ) ;
end component;
signal a_in, b_in, q_out :std_logic;
begin
    dut: and_gate port map(a_in, b_in, q_out);
    process 
    begin
        a_in <= '0';
        b_in <= '0';
        wait for 1 ns;
        assert(q_out='0') report "Fail 0/0" severity error;

        a_in <= '0';
        b_in <= '1';
        wait for 1 ns;
        assert(q_out='0') report "Fail 0/1" severity error;

        a_in <= '1';
        b_in <= '0';
        wait for 1 ns;
        assert(q_out='0') report "Fail 1/0" severity error;

        a_in <= '1';
        b_in <= '1';
        wait for 1 ns;
        assert(q_out='1') report "Fail 1/1" severity error;

        a_in <= '1';
        b_in <= 'X';
        wait for 1 ns;
        assert(q_out='X') report "Fail 1/X" severity error;

        a_in <= '0';
        b_in <= 'X';
        wait for 1 ns;
        assert(q_out='0') report "Fail 0/X" severity error;

        a_in <= 'X';
        b_in <= '0';
        wait for 1 ns;
        assert(q_out='0') report "Fail X/0" severity error;

        assert false report "Test done" severity note;
        wait;

    end process;
end rtl ; -- rtl  