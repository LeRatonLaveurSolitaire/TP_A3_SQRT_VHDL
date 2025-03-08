library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- number to test : 0, 1, 512, 1194877489, 4294967295

entity sqrt is
    generic(
        n : integer :=32 -- nombre de bits des entrées de sorties
    );
    port(
        CLK : in STD_LOGIC; -- clock
        RST : in STD_LOGIC; -- Démarre le calcul sur front descendant de RST
        A : in STD_LOGIC_VECTOR(2*n - 1 downto 0); -- nombre entier non signé dont on veut calculer la racine carrée
        Z_OUT : out STD_LOGIC_VECTOR(n - 1 downto 0); -- racine carrée de A
        DONE : out STD_LOGIC -- = 1 lorsque le calcul est fini
    );
end entity sqrt;


architecture arch of sqrt is
    signal D : unsigned(2*n - 1 downto 0);   
    signal Z : unsigned(n - 1 downto 0);
    signal CNT : unsigned(n - 1 downto 0);
begin
    sqrt_sequential: process(clk, rst)
	variable R : signed(2*n - 1 downto 0);
    begin
        if RST = '1' then
            D <= unsigned(A);
            R := to_signed(0,2*n);
            Z <= to_unsigned(0,n);
            CNT <=  to_unsigned(0,n);
            DONE <= '0';
        elsif rising_edge(clk) and CNT<n then
            if R >= to_signed(0,2*n) then
                R := (R sll 2) + signed(shift_right(D, 2*n - 2)) - shift_left(signed(resize(Z, 2*n)), 2) - to_signed(1, 2*n);
            else
                R := (R sll 2) + signed(shift_right(D, 2*n - 2)) + shift_left(signed(resize(Z, 2*n)), 2) + to_signed(3, 2*n);
            end if;
		
            if R >= to_signed(0,2*n) then
                Z <= (Z sll 1) + 1;
            else 
                Z <= (Z sll 1);
            end if;
            D <= D Sll 2;
            CNT <= CNT + 1;
        elsif CNT = n then
            Z_OUT <= std_logic_vector(Z);
            DONE <='1';
        end if;
    end process sqrt_sequential;
    
    
end architecture arch;

