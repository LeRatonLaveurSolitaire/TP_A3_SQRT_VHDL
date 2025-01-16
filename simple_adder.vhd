library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity generic_adder is
    generic (
        N : integer := 32
    );
    port (
        a, b : in std_logic_vector(2*N-1 downto 0);
        adder : in std_logic;
        result : out std_logic_vector(2*N-1 downto 0);
        carry_out : out std_logic
    );
end generic_adder;

architecture Behavioral of generic_adder is
    signal R : unsigned(N downto 0);
    signal B_unsigned : unsigned(2*N-1 downto 0);
    signal A_unsigned : unsigned(2*N-1 downto 0);
begin
    A_unsigned <= unsigned(a);
    B_unsigned <= unsigned(b);
    process(A, B, adder)
      begin
        if adder = '1' then
          R <= ('0' & A_unsigned) + ('0' & B_unsigned);
        else
          R <= ('0' & A_unsigned) - ('0' & B_unsigned);
      end if;
    end process;
    result <= std_logic_vector(R(2*N-1 downto 0));
    carry_out <= R(2*N);
end Behavioral;