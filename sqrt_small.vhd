library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture seq_det of mult_seq is
  signal sig_ld, sig_raz, sig_sh, sig_selp, sig_RB0, sig_RC0, zero, sig_ldp, sig_dop, sig_doa, sig_cout : std_logic;
  signal sig_add, sig_RP : std_logic_vector(n downto 0);
  signal sig_sum, sig_RA, sig_RB, sig_C, sig_RC : std_logic_vector(n-1 downto 0);
begin
  zero <= '0';
  sig_add <= sig_cout & sig_sum;
  sig_C(n-1) <= '1';
  sig_C(n-2 downto 0) <= ( others => '0');
  S <= sig_RP(n-1 downto 0) & sig_RB;
 
  MUX1: entity work.mux2_1(proced)
        port map(I0 => zero, I1 => sig_RB0, sel => sig_selp, S => sig_ldp);
  REGB: entity work.regld_sr(proced)
        generic map(nb_bits => n)
        port map(clk => clk, reset => sig_raz, load => sig_ld, D => B, Q => sig_RB, shift => sig_sh, din => sig_dop, dout => sig_RB0);
  REGA: entity work.regld_sr(proced)
        generic map(nb_bits => n)
        port map(clk => clk, reset => sig_raz, load => sig_ld, D => A, Q => sig_RA, shift => zero, din => zero, dout => sig_doa);
  REGC: entity work.regld_sr(proced)
        generic map(nb_bits => n)
        port map(clk => clk, reset => sig_raz, load => sig_ld, D => sig_C, Q => sig_RC, shift => sig_sh, din => zero, dout => sig_RC0);
  REGP: entity work.regld_sr(proced)
        generic map(nb_bits => n+1)
        port map(clk => clk, reset => sig_raz, load => sig_ldp, D => sig_add, Q => sig_RP, shift => sig_sh, din => zero, dout => sig_dop);
  ADDER: entity work.adder(dataflow)
        generic map(nb_bits => n)
        port map(A => sig_RA, B => sig_RP(n-1 downto 0), S => sig_sum, Cout => sig_cout);
  CU: entity work.control_unit(proced)
        port map(clk => clk, reset => reset,
                start => start,
                lb => sig_RC0,
                done => done,
                ld => sig_ld,
                sh => sig_sh,
                raz => sig_raz,
                selp => sig_selp);
end architecture seq_det;