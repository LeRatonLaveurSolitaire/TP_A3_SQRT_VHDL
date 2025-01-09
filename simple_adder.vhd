library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity generic_adder is
    generic (
        N : integer := 32
    );
    port (
        a, b : in std_logic_vector(N-1 downto 0);
        sum : out std_logic_vector(N-1 downto 0);
        carry_out : out std_logic
    );
end generic_adder;

architecture Behavioral of generic_adder is
    signal temp_sum : unsigned(N downto 0);
begin
    temp_sum <= ('0' & unsigned(a)) + ('0' & unsigned(b));
    sum <= std_logic_vector(temp_sum(N-1 downto 0)); 
    carry_out <= temp_sum(N);
end Behavioral;