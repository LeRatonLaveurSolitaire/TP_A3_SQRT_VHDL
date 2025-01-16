library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sqrt_seq is
generic (
        n : integer := 32
    );
Port(
     clk, reset, start : in STD_LOGIC;
     A : in std_logic_vector(2*n-1 downto 0)
     );
end sqrt_seq;

architecture seq_det of sqrt_seq is
  signal sr, sl, sig_carry, load : std_logic;
  signal D : unsigned(2*n-1 downto 0);
  signal Z : unsigned(n-1 downto 0); 
  signal R : signed(2*n-1 downto 0);
  signal res_inter : signed(2*n-1 downto 0);
  signal sig_A, sig_B : std_logic_vector(n-1 downto 0);
  signal sig_sum : std_logic_vector(2*n-1 downto 0);
  signal nb_decD, nb_decZ, nb_decR : integer;
  signal 
  
begin
 -- Instance de l'unité de contrôle
    CU: entity work.control_unit(proced)
        Port map (
            clk => clk,
            load => load,
            reset => reset,
            start => start,
            done => done,
            init => init,
	          sr => sr,
	          sl => sl,
	          
        );

 -- Instantiation register D
	Reg_D: entity work.REGLD_SR(proced)
        Port map (
          clk => clk,
          reset => reset,
          load => load,
          sl => sl,
          sr => sr,
          nb_dec => nb_decD,
          D => D,
          Din => Din,
          Q => Q
        );
        
 -- Instantiation register Z
	Reg_Z: entity work.REGLD_SR(proced)
        Port map (
          clk => clk,
          reset => reset,
          load => load,
          sl => sl,
          sr => sr,
          nb_dec => nb_dec,
          D => D,
          Din => Din,
          Q => Q
        );
        
 -- Instantiation register R
	Reg_R: entity work.REGLD_SR(proced)
        Port map (
          clk => clk,
          reset => reset,
          load => load,
          sl => sl,
          sr => sr,
          nb_dec => nb_dec,
          D => D,
          Din => Din,
          Q => Q
        );

 -- Instantiation adder
  Adder: entity work.generic_adder(behavioral)
      Generic map (N => n)
      Port map (
        a => sig_A, 
        b => sig_B,         
        subber => sig_add, 
        result => sig_sum, 
        carry_out => sig_carry        
      );



end architecture seq_det;