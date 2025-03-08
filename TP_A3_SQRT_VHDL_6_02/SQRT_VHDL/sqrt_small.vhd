library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sqrt_seq is
generic (
        n : integer := 32
    );
Port(
     clk, start : in STD_LOGIC;
     reset : inout STD_LOGIC;
     done : out STD_LOGIC;
     A : in std_logic_vector(2*n-1 downto 0);
     Z_OUT : out std_logic_vector(n-1 downto 0)
     );
end sqrt_seq;

architecture arch of sqrt_seq is
  signal sig_add : std_logic;
  signal sig_carry : std_logic;
  signal D : unsigned(2*n-1 downto 0);
  signal Z : unsigned(n-1 downto 0); 
  signal R : signed(2*n-1 downto 0);
  signal res_inter : signed(2*n-1 downto 0);
  signal sig_A, sig_B : std_logic_vector(2*n-1 downto 0);
  signal sig_sum : std_logic_vector(2*n-1 downto 0);
  -- signal nb_decD, nb_decZ, nb_decR : integer;
  -- signal 
  
begin
 -- Instance de l'unit� de contr�le
    CU: entity work.control_unit(proced)
        Port map (
            clk => clk,
            reset => reset,
            start => start,
            done => done,
            A => A,
	          D => D,
            Z => Z,
            Z_OUT => Z_OUT,
            R => R,
            res_inter => res_inter,
            sig_A => sig_A, 
            sig_B => sig_B,         
            sig_add => sig_add, 
            sig_sum => sig_sum
        );

--  -- Instantiation register D
-- 	Reg_D: entity work.REGLD_SR(proced)
--         Port map (
--           clk => clk,
--           reset => reset,
--           load => load_D,
--           sl => sl,
--           sr => sr,
--           nb_dec => nb_decD,
--           D => D,
--           Din => Din,
--           Q => D
--         );
        
--  -- Instantiation register Z
-- 	Reg_Z: entity work.REGLD_SR(proced)
--         Port map (
--           clk => clk,
--           reset => reset,
--           load => load_Z,
--           sl => sl,
--           sr => sr,
--           nb_dec => nb_dec,
--           D => Z,
--           Din => Din,
--           Q => Z
--         );
        
--  -- Instantiation register R
-- 	Reg_R: entity work.REGLD_SR(proced)
--         Port map (
--           clk => clk,
--           reset => reset,
--           load => load_R,
--           sl => sl,
--           sr => sr,
--           nb_dec => nb_dec,
--           D => R,
--           Din => Din,
--           Q => R
--         );

 -- Instantiation adder
  Adder: entity work.generic_adder(behavioral)
      Generic map (N => n)
      Port map (
        a => sig_A, 
        b => sig_B,         
        adder => sig_add, 
        result => sig_sum, 
        carry_out => sig_carry         
      );



end architecture arch;