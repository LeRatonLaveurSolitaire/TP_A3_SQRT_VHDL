library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sqrt is
    generic(n_bits: natural := 32);
	port(
		clk  : in std_logic;
		reset  : in std_logic;
		start: in std_logic;
		done : out std_logic;
		dataa : in std_logic_vector(2 * n_bits - 1 downto 0);
		result: out std_logic_vector(n_bits -1 downto 0);
		clk_en : in  std_logic := '0'
	);
end entity;

architecture arch of sqrt is
    
    type state_t is (IDLE, COMP, END_COMP);
    signal state: state_t;
    signal Z: unsigned(    n_bits - 1 downto 0);
    signal D: unsigned(2 * n_bits - 1 downto 0);

    begin
        comport : process(start,dataa,reset,clk)  
        variable R: signed(3 + n_bits - 1 downto 0);
        variable i_step: integer range 0 to n_bits := 0;

        begin
            if reset = '1' then
                done <= '0';
                i_step := 0;
            elsif rising_edge(clk) then --and i_step < n_bits then
                case state is
                    when IDLE =>
                        done <= '0';
                        Z <= (others => '0');
                        R := (others => '0');
                        if start = '1' then
                            state <= COMP;
                            i_step := 0;
                            D <= unsigned(dataa);
                        end if;
                    when COMP =>         
                            if R >= to_signed(0, 3 + n_bits) then
                                R := (R sll 2) + ('0'&signed(std_logic_vector(D(2*n_bits - 1 downto 2*n_bits-2)))) - signed(std_logic_vector((Z sll 2))) - to_signed(1, 3 + n_bits);
                            else
                                R := (R sll 2) + ('0'&signed(std_logic_vector(D(2*n_bits - 1 downto 2*n_bits-2)))) + signed(std_logic_vector(Z sll 2)) + to_signed(3, 3 + n_bits);
                            end if;
                            if R >= to_signed(0, 3 + n_bits) then   
                                Z <= (Z sll 1) + 1;
                            else
                                Z <= (Z sll 1);
                            end if;
                            D <= D sll 2;
                            i_step := i_step + 1;
                            if i_step = n_bits then
                                state <= END_COMP;
                            end if;
                    when END_COMP =>
                	    result <= std_logic_vector(Z);
                            done <= '1';
                            if start = '0' then
                                state <= IDLE;
                            end if;
                end case;
            end if;
        end process comport;

end architecture arch;
