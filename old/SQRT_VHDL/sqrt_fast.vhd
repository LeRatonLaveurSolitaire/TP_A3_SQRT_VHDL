library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- number to test : 0, 1, 512, 1194877489, 4294967295

entity sqrt_fast is
    generic(
        n : integer :=32 -- nombre de bits des entrées de sorties
    );
    port(
        CLK : in STD_LOGIC; -- clock
        RST : in STD_LOGIC; -- Demarre le calcul sur front descendant de RST
        start : in STD_LOGIC; --bit de start
        A : in STD_LOGIC_VECTOR(2*n - 1 downto 0); -- nombre entier non signé dont on veut calculer la racine carrée
        Z_OUT : out STD_LOGIC_VECTOR(n - 1 downto 0); -- racine carrée de A
        DONE : out STD_LOGIC -- = 1 lorsque le calcul est fini
    );
end entity sqrt_fast;


architecture arch of sqrt_fast is
    signal D : unsigned(2*n - 1 downto 0); 
    signal Din : unsigned(2*n - 1 downto 0);   
    signal Z : unsigned(n - 1 downto 0);
    signal Zin : unsigned(n - 1 downto 0);
    --signal R : signed(2*n - 1 downto 0);
    --signal Rin : signed(2*n - 1 downto 0);
    signal CNT : unsigned(n - 1 downto 0);
    signal CNTin : unsigned(n - 1 downto 0);
    
    type state is (wait_state, exec_state, end_state);
    signal current_state : state;
    signal next_state : state;
    
begin

CSM: process(clk, rst) -- current state memorization
  begin
  if (rst = '1') then
    current_state <= wait_state;
  elsif (clk'event and (clk = '1')) then
    current_state <= next_state;
    D <= Din;
    Z <= Zin;
    --R <= Rin;
    CNT <= CNTin;
  end if;
end process CSM;

NSC: process(current_state, start, A, Z, D, CNT) -- next state computation
  begin
  case current_state is
    when wait_state => 
    
          if start = '1' then
              next_state <= exec_state;
          else
              next_state <= wait_state;
          end if;
    when exec_state => if CNT = (n -1) then 
                          next_state <= end_state;
		                   end if;
  when end_state => if start = '0' then
                        next_state <= wait_state;
                    else 
                        next_state <= end_state;  
                    end if;
end case;          
end process NSC;

sqrt_sequential: process(current_state, A, Z, D, CNT)
	variable Rvar : signed(2*n - 1 downto 0);
    begin
      case current_state is
        when wait_state =>
            Din <= unsigned(A);
            Rvar := to_signed(0,2*n);
            Zin <= to_unsigned(0,n);
            CNTin <=  to_unsigned(0,n);
            DONE <= '0';
        when exec_state =>
            if Rvar >= to_signed(0,2*n) then
              Rvar := (Rvar sll 2) + signed(shift_right(D, 2*n - 2)) - shift_left(signed(resize(Z, 2*n)), 2) - to_signed(1, 2*n);
	      --CNT <= to_unsigned(9,n);
            else
              Rvar := (Rvar sll 2) + signed(shift_right(D, 2*n - 2)) + shift_left(signed(resize(Z, 2*n)), 2) + to_signed(3, 2*n);
	      --CNT <= to_unsigned(27,n);
            end if;
  		
            if Rvar >= to_signed(0,2*n) then
              Zin <= (Z sll 1) + 1;
	      --CNT <= to_unsigned(10,n);
            else 
              Zin <= (Z sll 1);
	      --CNT <= to_unsigned(4,n);
            end if;
            Din <= D Sll 2;
	          CNTin <= CNT + 1;
              
         when end_state =>     
            Z_OUT <= std_logic_vector(Z);
            DONE <='1';
    end case;
    end process sqrt_sequential;
    
    
end architecture arch;

