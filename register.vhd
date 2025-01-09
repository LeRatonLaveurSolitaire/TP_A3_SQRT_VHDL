library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity REGLD_SR is -- Register with load and right-shift
  generic(nb_bits : natural := 32); -- stored data bit width
  Port ( clk, reset, load, shift_left, shift_right : in std_logic;
         nb_dec: in integer;
         D: in std_logic_vector( nb_bits-1 downto 0);
         -- Dout : out std_logic; -- LSB output
         Q: out std_logic_vector(nb_bits-1 downto 0)
  );
end REGLD_SR;

architecture proced of REGLD_SR is

signal Sint: std_logic_vector(nb_bits-1 downto 0 );
signal Din : std_logic_vector(nb_dec downto 0); -- right/left shift MSB/LSB input

begin

 P1 : process(clk, reset)

  begin

    if reset='1' then
      Sint <= (others => '0');
    elsif clk'event and clk='1' then
      if load = '1' then
        Sint <= D;
      elsif shift_right = '1' then
        Sint <= Din & Sint(nb_bits-1 downto nb_dec);
      elsif shift_left = '1' then
        Sint <= Sint(nb_bits-1-nb_dec downto 0) & Din;
      end if;
    end if;
 end process P1;

 Q <= Sint;
 -- Dout <= Sint(0);

end architecture proced;
