library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sqrt is
    generic(
        n : integer :=32 -- nombre de bits des entrées de sorties
    );
    port(
        CLK : in STD_LOGIC; -- clock
        RST : in STD_LOGIC; -- Démarre le calcul sur front descendant de RST
        A : in STD_LOGIC_VECTOR(2*n -1 downto 0); -- nombre entier non signé dont on veut calculer la racine carrée
        Z_OUT : out STD_LOGIC_VECTOR(n -1 downto 0); -- racine carrée de A
        READY : out STD_LOGIC; -- = 1 lorsque le calcul est fini
    );
end entity sqrt;


architecture arch of sqrt is
    signal D : STD_LOGIC_VECTOR(2*n - 1 downto 0);
    signal R : STD_LOGIC_VECTOR(2*n - 1 downto 0);
    signal Z : STD_LOGIC_VECTOR(n - 1 downto 0);
    signal CNT : integer;
begin
    sqrt_sequential: process(clk, rst)
    begin
        if RST = '1' then
            D <= A;
            R <= (others => '0');
            Z <= (others => '0');
            CNT <= 0;
            READY <= '0';
        elsif rising_edge(clk) and CNT<n then
            if R>='0' then
                R <= (R Sll 2) + (D Srl (2n - 2)) - ((Z+1) Sll 2 );
            else
                R <= (R Sll 2) + (D Srl (2n - 2)) + ((Z+3) Sll 2 );
            end if;

            if R>= '0' then
                Z <= (Z sll 1) + 1
            else 
                Z <= (Z sll 1)
            end if;
            D <= D Sll 2;
            CNT <= CNT + 1;
        elsif CNT = n then
            Z_OUT <= Z ;
            READY <='1';
        end if;
    end process sqrt_sequential;
    
    
end architecture arch;
