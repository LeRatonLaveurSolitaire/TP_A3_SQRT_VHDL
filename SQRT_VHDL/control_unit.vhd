library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_unit is
generic(nb_dec : integer := 62);
port(
  start, clk, reset : in STD_LOGIC;
	val_left,
	val_right : out std_logic_vector
	sr,
	sl,
  done : out STD_LOGIC);
end control_unit;

architecture proced of control_unit is

type state is (wait_state, init_state, exe1_1state, exe1_2state , exe1_3state, exe2state, end_state);
signal current_state, next_state : state;
signal count : integer;

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
    when wait_state => done <= '0'; sr <= '0'; sl <= '0';
   
    when init_state => done <= '0'; sr <= '0'; sl <= '0'; count <= 0;
         
    when exe1_1state => done <= '0'; sr <= '0'; sl <= '1';
         
    when exe1_2state => done <= '0'; sr <= '1'; sl <= '0';
         
    when exe1_3state => done <= '0'; sr <= '0'; sl <= '1';
         
    when exe2state => done <= '0'; sr <= '0'; sl <= '1';
        
    when end_state => done <= '1'; sr <= '0'; sl <= '0';
         
    when others => done <= '0'; sr <= '0'; sl <= '0';
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
    when exe1_3state => next_state <= exe2state;
      
    when exe2state => if count = N then
                          next_state <= end_state;
                      else
                          next_state <= exe1_1state;
                          count = count + 1;
      
    when end_state => if reset = '1' then
                        next_state <= wait_state;
                      else
                        next_state <= end_state;
                      end if;
    when others => next_state <= wait_state;
  end case;
 end process NSC;
end proced;
