library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is 
end testbench;

architecture testbench_arch of testbench is

  constant nb_bits: natural := 32;
  signal clk : std_logic;


begin  

  DUT1: entity









Gene_clk: process
    begin 
      clk <='0';
      wait for 10 ns;
      for i in 1 to 500 loop
        clk <= '1';
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
    end loop;
    wait;


end process;



end testbench_arch;