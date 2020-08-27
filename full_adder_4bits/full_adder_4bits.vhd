library ieee;
use ieee.std_logic_1164.all;

entity full_adder_4bits is
    port (
      a, b : in std_logic_vector(3 downto 0);
      c_i : in std_logic;
      s : out std_logic_vector(3 downto 0);
      c_o : out std_logic
    ) ;
end full_adder_4bits;

architecture rtl of full_adder_4bits is

component full_adder is
    port (
        a     : in std_logic;
        b     : in std_logic;
        c_i   : in std_logic;
        s     : out std_logic;
        c_o   : out std_logic
    ) ;
end component;

signal c_out0, c_out1, c_out2 : std_logic;

begin
    FA0: full_adder port map(a(0),b(0),c_i,s(0),c_out0);
    FA1: full_adder port map(a(1),b(1),c_out0,s(1),c_out1);
    FA2: full_adder port map(a(2),b(2),c_out1,s(2),c_out2);
    FA3: full_adder port map(a(3),b(3),c_out2,s(3),c_o);
end rtl ; -- rtl