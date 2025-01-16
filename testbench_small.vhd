library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity testbench is
end entity testbench;

architecture test_sqrt_small of testbench is
    constant nb_bits : integer :=32;
    signal CLK : STD_LOGIC; -- clock
    signal reset : STD_LOGIC;
    signal start : STD_LOGIC;
    signal A : STD_LOGIC_VECTOR(2*nb_bits - 1 downto 0); -- nombre entier non signé dont on veut calculer la racine carrée
    signal Z : STD_LOGIC_VECTOR(nb_bits - 1 downto 0); -- racine carrée de A
    signal DONE : STD_LOGIC;
begin
    DUT1: entity work.sqrt(arch)
        generic map(n => nb_bits)
        port map(clk => CLK, reset => RST, A => A, Z_OUT => Z, done => done,start => start );
    
reset <='1', '0' after 15ns, '1' after 2us, '0' after 2015ns, '1' after 4us, '0' after 4015ns, '1' after 6us, '0' after 6015ns, '1' after 8us, '0' after 8015ns;
start <='1' after 20ns, '0' after 40ns, '1' after 2020ns, '0' after 2040ns, '1' after 4020ns, '0' after 4040ns, '1' after 6020ns, '0' after 6040ns, '1' after 8020ns, '0' after 8040ns;
A  <=  std_logic_vector(to_unsigned(0,2*nb_bits)), std_logic_vector(to_unsigned(1,2*nb_bits)) after 2us, std_logic_vector(to_unsigned(512,2*nb_bits)) after 4us, std_logic_vector(to_unsigned(1194877489,2*nb_bits)) after 6us, (31 downto 0 => '1', others => '0') after 8us;

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