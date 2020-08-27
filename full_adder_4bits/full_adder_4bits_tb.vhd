library ieee;
use ieee.std_logic_1164.all;

entity full_adder_4bits_tb is
end full_adder_4bits_tb;

architecture testbench of full_adder_4bits_tb is

component full_adder_4bits is
    port (
      a, b  : in std_logic_vector(3 downto 0);
      c_i   : in std_logic;
      s     : out std_logic_vector(3 downto 0);
      c_o   : out std_logic
    ) ;
end component;

signal a, b : std_logic_vector(3 downto 0);
signal c_i  : std_logic;
signal s    : std_logic_vector(3 downto 0);
signal c_o  : std_logic;

begin
    dut : full_adder_4bits port map(a,b,c_i,s,c_o);
    process
    begin
        a   <= "1000";
        b   <= "0000";
        c_i <= '1';
        wait for 1 ns;
        assert(s="1001" and c_o='0') report "Falhou 1" severity error;

        a   <= "1111";
        b   <= "0000";
        c_i <= '1';
        wait for 1 ns;
        assert(s="0000" and c_o='1') report "Falhou 2" severity error;

        a   <= "1111";
        b   <= "1111";
        c_i <= '1';
        wait for 1 ns;
        assert(s="1111" and c_o='1') report "Falhou 3" severity error;

        a   <= "0000";
        b   <= "0000";
        c_i <= '1';
        wait for 1 ns;
        assert(s="0001" and c_o='0') report "Falhou 4" severity error;

        a   <= "1010";
        b   <= "0101";
        c_i <= '0';
        wait for 1 ns;
        assert(s="1111" and c_o='0') report "Falhou 5" severity error;

        assert false report "Test done" severity note;
        wait;
    end process;

end testbench ; -- testbench