-- Testbench do Flip-Flop JK
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component FF_JK is
port(
  clock  : in std_logic;
  J, K   : in std_logic;
  reset  : in std_logic;
  Q, Qbar: out std_logic);
end component;

signal clock_in, J_in, K_in, reset_in, Q_out, Qbar_out : std_logic;

begin

  -- Connect DUT
  DUT: FF_JK port map(clock_in, J_in, K_in, reset_in, Q_out, Qbar_out);

  process
  begin
    reset_in <= '1';
    j_in <= '0';
    k_in <= '0';
    clock_in <= '0';
    wait for 1 ns;
    clock_in <= '1';
    wait for 1 ns;
    clock_in <= '0';
    wait for 1 ns;
    wait;
  end process;
end tb;
