library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_unit is
generic(n : integer := 32);
port(
  start, clk : in STD_LOGIC;
	done : out STD_LOGIC;
  reset : inout STD_LOGIC;
  A : in std_logic_vector(2*n-1 downto 0);
  D : inout unsigned(2*n-1 downto 0);
  Z : inout unsigned(n-1 downto 0); 
  Z_OUT : out std_logic_vector(n-1 downto 0); 
  R : inout signed(2*n-1 downto 0);
  res_inter : inout signed(2*n-1 downto 0);
  sig_A, sig_B : out std_logic_vector(2*n-1 downto 0);
  sig_sum : in std_logic_vector(2*n-1 downto 0);
  sig_add : out std_logic
  );
end control_unit;

architecture proced of control_unit is

type state is (wait_state, init_state, exe1_1state, exe1_2state , exe1_3state, exe2_1state,exe2_2state, end_state);
signal current_state, next_state : state;
signal i : integer;

begin

CSM: process(clk, reset) -- current state memorization
  begin
  if (reset = '1') then
    current_state <= wait_state;
  elsif (clk'event and (clk = '1')) then
    current_state <= next_state;
  end if;
end process CSM;

OC: process(current_state) -- output computation
  begin
  case current_state is
    when wait_state => done <= '0';

    when init_state => done <= '0'; i <= 0;
      D <= unsigned(A);
      R <= to_signed(0,2*n);
      Z <= to_unsigned(0,n);
      i <= 0;
    when exe1_1state => done <= '0'; 
      if R >= to_signed(0,n) then -- res_inter = -4Z - 1
        sig_A <= std_logic_vector((z sll 2));
        sig_B <= "1"; -- -1
        sig_add <= '1';
        res_inter <= signed(sig_sum);
      else -- res_inter = 4Z + 3
        sig_A <= std_logic_vector((Z sll 2)); -- 4Z
        sig_B <= "11"; -- +3
        sig_add <= '1';
        res_inter <= signed(sig_sum);
      end if;
    when exe1_2state => done <= '0';  -- res_inter  <= res_inter + D/2^(2n-2)
      if R >= to_signed(0,n) then -- res_inter = -4Z - 1
        sig_A <= std_logic_vector(D srl 2*n - 2);
        sig_B <= std_logic_vector(res_inter);
        sig_add <= '0';
        res_inter <= signed(sig_sum);
      else 
        sig_A <= std_logic_vector(D srl 2*n - 2);
        sig_B <= std_logic_vector(res_inter);
        sig_add <= '1';
        res_inter <= signed(sig_sum);
      end if;
    when exe1_3state => done <= '0'; -- R <= 4R + res_inter
      sig_A <= std_logic_vector(R sll 2);
      sig_B <= std_logic_vector(res_inter);
      sig_add <= '1';
      R <= signed(sig_sum);
    when exe2_1state => done <= '0'; 
      if R >= to_signed(0,n) then -- Z = 2Z + 1
        sig_A <= std_logic_vector(Z sll 1);
        sig_B <= "1";
        sig_add <= '1';
        Z <= unsigned(sig_sum);
      else -- Z = 2Z
        Z <= (Z sll 1);
      end if;
      D <= (D sll 2); -- D <= 4D
    when exe2_2state => done <= '0'; -- i += 1
      sig_A <= std_logic_vector(to_unsigned(i,sig_A'length));
      sig_B <= "1";
      sig_add <= '1';
      i <= to_integer(unsigned(sig_sum));
    when end_state => done <= '1';
      Z_OUT  <= std_logic_vector(Z);
    when others => done <= '0';
      reset <= '1'; 
  end case;
end process OC;

NSC: process(current_state,start) -- next state computation
  begin
  case current_state is
    when wait_state => if start = '1' then
                          next_state <= init_state;
                       else
                          next_state <= wait_state;
                       end if;
    when init_state => next_state <= exe1_1state;
    when exe1_1state => next_state <= exe1_2state;
    when exe1_2state => next_state <= exe1_3state;
    when exe1_3state => next_state <= exe2_1state;
    when exe2_1state => next_state <= exe2_2state;
    when exe2_2state => if i = N then
                          next_state <= end_state;
                      else
                          next_state <= exe1_1state;
                      end if;
    when end_state => if reset = '1' then
                        next_state <= wait_state;
                      else
                        next_state <= end_state;
                      end if;
    when others => next_state <= wait_state;
  end case;
 end process NSC;
end proced;
