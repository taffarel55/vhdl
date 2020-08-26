library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port (
    a     : in std_logic;
    b     : in std_logic;
    c_i   : in std_logic;
    s     : out std_logic;
    c_o   : out std_logic
  ) ;
end full_adder;

architecture rtl of full_adder is
begin
    process(a,b,c_i) is
    begin
      s <= (a xor b) xnor c_i;
      c_o <= (a and b) or ((a xor b) and c_i);
    end process;
end rtl  ; -- rtl 