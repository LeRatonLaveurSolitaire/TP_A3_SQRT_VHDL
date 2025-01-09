library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_unit is

port(
  reset, start, lb, clk : in STD_LOGIC;
  done, ld, sh, raz, selp : out STD_LOGIC);
end control_unit;

architecture proced of control_unit is

type state is (wait_state, init_state, comp_state, shift_state, last_shift_state, end_state);
signal current_state, next_state : state;

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
    when wait_state => done <= '0'; ld <= '0'; sh <= '0';
        raz <= '1'; selp <= '0';
    when init_state => done <= '0'; ld <= '1'; sh <= '0';
        raz <= '0'; selp <= '0';
    when comp_state => done <= '0'; ld <= '0'; sh <= '0';
        raz <= '0'; selp <= '1';
    when shift_state => done <= '0'; ld <= '0'; sh <= '1';
        raz <= '0'; selp <= '0';
    when last_shift_state => done <= '0'; ld <= '0'; sh <= '1';
        raz <= '0'; selp <= '0';
    when end_state => done <= '1'; ld <= '0'; sh <= '0';
        raz <= '0'; selp <= '0';
    when others => done <= '0'; ld <= '0'; sh <= '0';
        raz <= '1'; selp <= '0';
  end case;
end process OC;

NSC: process(current_state,start,lb) -- next state computation
  begin
  case current_state is
    when wait_state => if start = '1' then
                          next_state <= init_state;
                       else
                          next_state <= wait_state;
                       end if;
    when init_state => next_state <= comp_state;
    when comp_state => if lb = '1' then
                          next_state <= last_shift_state;
                       else
                          next_state <= shift_state;
                       end if;
    when shift_state => next_state <= comp_state;
    when last_shift_state => next_state <= end_state;
    when end_state => if start = '1' then
                        next_state <= end_state;
                      else
                        next_state <= wait_state;
                      end if;
    when others => next_state <= wait_state;
  end case;
 end process NSC;
end proced;
