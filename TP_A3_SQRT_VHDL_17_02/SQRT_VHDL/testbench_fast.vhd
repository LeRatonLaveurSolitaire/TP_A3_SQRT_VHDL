library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity testbench is
end entity testbench;

architecture test_sqrt_fast of testbench is
    constant nb_bits : integer :=32;
    signal CLK : STD_LOGIC; -- clock
    signal RST : STD_LOGIC; -- Démarre le calcul sur front descendant de RST
    signal A : STD_LOGIC_VECTOR(2*nb_bits - 1 downto 0); -- nombre entier non signé dont on veut calculer la racine carrée
    signal Z : STD_LOGIC_VECTOR(nb_bits - 1 downto 0); -- racine carrée de A
    signal DONE : STD_LOGIC;
begin
    DUT1: entity work.sqrt(arch)
        generic map(n => nb_bits)
        port map(clk => CLK, RST => RST, A => A, Z_OUT => Z, done => DONE);
    
RST <='1', '0' after 15ns, '1' after 1us, '0' after 1015ns, '1' after 2us, '0' after 2015ns, '1' after 3us, '0' after 3015ns, '1' after 4us, '0' after 4015ns;
A  <=  std_logic_vector(to_unsigned(0,2*nb_bits)), std_logic_vector(to_unsigned(1,2*nb_bits)) after 1us, std_logic_vector(to_unsigned(512,2*nb_bits)) after 2us, std_logic_vector(to_unsigned(1194877489,2*nb_bits)) after 3us, (31 downto 0 => '1', others => '0') after 4us;

Pclk: process
    constant nb_periods : natural := 10000;
    begin
    clk <= '0';
    wait for 10 ns;
    for i in 1 to nb_periods loop
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    end loop;
    wait;
end process Pclk;

end architecture test_sqrt_fast;