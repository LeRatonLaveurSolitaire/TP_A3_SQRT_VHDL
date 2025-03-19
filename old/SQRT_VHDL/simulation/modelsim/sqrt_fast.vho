-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "03/08/2025 19:57:39"

-- 
-- Device: Altera EP2C20AF256A7 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sqrt_fast IS
    PORT (
	CLK : IN std_logic;
	RST : IN std_logic;
	start : IN std_logic;
	A : IN std_logic_vector(63 DOWNTO 0);
	Z_OUT : OUT std_logic_vector(31 DOWNTO 0);
	DONE : OUT std_logic
	);
END sqrt_fast;

-- Design Ports Information
-- Z_OUT[0]	=>  Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[1]	=>  Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[2]	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[3]	=>  Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[4]	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[5]	=>  Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[6]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[7]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[8]	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[9]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[10]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[11]	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[12]	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[13]	=>  Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[14]	=>  Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[15]	=>  Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[16]	=>  Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[17]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[18]	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[19]	=>  Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[20]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[21]	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[22]	=>  Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[23]	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[24]	=>  Location: PIN_K15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[25]	=>  Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[26]	=>  Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[27]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[28]	=>  Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[29]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[30]	=>  Location: PIN_L16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_OUT[31]	=>  Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- DONE	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RST	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- start	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[63]	=>  Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[62]	=>  Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[61]	=>  Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[60]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[59]	=>  Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[58]	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[57]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[56]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[55]	=>  Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[54]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[53]	=>  Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[52]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[51]	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[50]	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[49]	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[48]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[47]	=>  Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[46]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[45]	=>  Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[44]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[43]	=>  Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[42]	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[41]	=>  Location: PIN_N7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[40]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[39]	=>  Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[38]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[37]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[36]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[35]	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[34]	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[33]	=>  Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[32]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[31]	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[30]	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[29]	=>  Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[28]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[27]	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[26]	=>  Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[25]	=>  Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[24]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[23]	=>  Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[22]	=>  Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[21]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[20]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[19]	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[18]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[17]	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[16]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[15]	=>  Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[14]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[13]	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[12]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[11]	=>  Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[10]	=>  Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[9]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[8]	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[7]	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[6]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[5]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[4]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[3]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[2]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[1]	=>  Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[0]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF sqrt_fast IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_A : std_logic_vector(63 DOWNTO 0);
SIGNAL ww_Z_OUT : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_DONE : std_logic;
SIGNAL \CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Selector196~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \current_state.end_state~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RST~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \Add0~64_combout\ : std_logic;
SIGNAL \Add0~70_combout\ : std_logic;
SIGNAL \Add0~72_combout\ : std_logic;
SIGNAL \Add0~74_combout\ : std_logic;
SIGNAL \Add0~76_combout\ : std_logic;
SIGNAL \Add0~82_combout\ : std_logic;
SIGNAL \Add0~92_combout\ : std_logic;
SIGNAL \Add0~96_combout\ : std_logic;
SIGNAL \Add0~102_combout\ : std_logic;
SIGNAL \Add0~104_combout\ : std_logic;
SIGNAL \Add0~106_combout\ : std_logic;
SIGNAL \Add0~108_combout\ : std_logic;
SIGNAL \Add0~114_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \Add1~32_combout\ : std_logic;
SIGNAL \Add1~36_combout\ : std_logic;
SIGNAL \Add1~42_combout\ : std_logic;
SIGNAL \Add1~44_combout\ : std_logic;
SIGNAL \Add1~46_combout\ : std_logic;
SIGNAL \Add1~56_combout\ : std_logic;
SIGNAL \Add1~60_combout\ : std_logic;
SIGNAL \Add1~64_combout\ : std_logic;
SIGNAL \Add1~70_combout\ : std_logic;
SIGNAL \Add1~82_combout\ : std_logic;
SIGNAL \Add1~104_combout\ : std_logic;
SIGNAL \Add1~112_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \Add2~18_combout\ : std_logic;
SIGNAL \Add2~28_combout\ : std_logic;
SIGNAL \Add2~30_combout\ : std_logic;
SIGNAL \Add2~36_combout\ : std_logic;
SIGNAL \Add2~38_combout\ : std_logic;
SIGNAL \Add2~40_combout\ : std_logic;
SIGNAL \Add2~42_combout\ : std_logic;
SIGNAL \Add2~44_combout\ : std_logic;
SIGNAL \Add2~50_combout\ : std_logic;
SIGNAL \Add2~62_combout\ : std_logic;
SIGNAL \Add2~64_combout\ : std_logic;
SIGNAL \Add2~68_combout\ : std_logic;
SIGNAL \Add2~70_combout\ : std_logic;
SIGNAL \Add2~72_combout\ : std_logic;
SIGNAL \Add2~74_combout\ : std_logic;
SIGNAL \Add2~76_combout\ : std_logic;
SIGNAL \Add2~82_combout\ : std_logic;
SIGNAL \Add2~92_combout\ : std_logic;
SIGNAL \Add2~94_combout\ : std_logic;
SIGNAL \Add2~96_combout\ : std_logic;
SIGNAL \Add2~102_combout\ : std_logic;
SIGNAL \Add2~106_combout\ : std_logic;
SIGNAL \Add2~108_combout\ : std_logic;
SIGNAL \Add2~114_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \Add3~16_combout\ : std_logic;
SIGNAL \Add3~22_combout\ : std_logic;
SIGNAL \Add3~32_combout\ : std_logic;
SIGNAL \Add3~36_combout\ : std_logic;
SIGNAL \Add3~42_combout\ : std_logic;
SIGNAL \Add3~44_combout\ : std_logic;
SIGNAL \Add3~48_combout\ : std_logic;
SIGNAL \Add3~62_combout\ : std_logic;
SIGNAL \Add3~82_combout\ : std_logic;
SIGNAL \Add3~104_combout\ : std_logic;
SIGNAL \Add3~110_combout\ : std_logic;
SIGNAL \Add3~112_combout\ : std_logic;
SIGNAL \Add3~116_combout\ : std_logic;
SIGNAL \Add4~16_combout\ : std_logic;
SIGNAL \Add4~18_combout\ : std_logic;
SIGNAL \Add4~20_combout\ : std_logic;
SIGNAL \Add4~34_combout\ : std_logic;
SIGNAL \Add4~38_combout\ : std_logic;
SIGNAL \Add4~42_combout\ : std_logic;
SIGNAL \Add4~48_combout\ : std_logic;
SIGNAL \Add4~54_combout\ : std_logic;
SIGNAL \Add4~61\ : std_logic;
SIGNAL \Add4~62_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Selector55~0_combout\ : std_logic;
SIGNAL \Selector59~0_combout\ : std_logic;
SIGNAL \Selector123~0_combout\ : std_logic;
SIGNAL \Selector119~0_combout\ : std_logic;
SIGNAL \Selector108~0_combout\ : std_logic;
SIGNAL \Selector89~0_combout\ : std_logic;
SIGNAL \Selector88~0_combout\ : std_logic;
SIGNAL \Selector85~0_combout\ : std_logic;
SIGNAL \Selector83~0_combout\ : std_logic;
SIGNAL \Selector75~0_combout\ : std_logic;
SIGNAL \Selector67~0_combout\ : std_logic;
SIGNAL \Selector194~0_combout\ : std_logic;
SIGNAL \Selector193~0_combout\ : std_logic;
SIGNAL \Add4~64_combout\ : std_logic;
SIGNAL \Add4~68_combout\ : std_logic;
SIGNAL \Add4~71_combout\ : std_logic;
SIGNAL \Add4~74_combout\ : std_logic;
SIGNAL \Add4~76_combout\ : std_logic;
SIGNAL \Add4~78_combout\ : std_logic;
SIGNAL \Add4~85_combout\ : std_logic;
SIGNAL \Add4~86_combout\ : std_logic;
SIGNAL \Add4~87_combout\ : std_logic;
SIGNAL \Selector192~0_combout\ : std_logic;
SIGNAL \Selector191~0_combout\ : std_logic;
SIGNAL \Selector190~0_combout\ : std_logic;
SIGNAL \Selector189~0_combout\ : std_logic;
SIGNAL \Selector188~0_combout\ : std_logic;
SIGNAL \Selector187~0_combout\ : std_logic;
SIGNAL \Selector186~0_combout\ : std_logic;
SIGNAL \Selector185~0_combout\ : std_logic;
SIGNAL \Selector184~0_combout\ : std_logic;
SIGNAL \Selector183~0_combout\ : std_logic;
SIGNAL \Selector182~0_combout\ : std_logic;
SIGNAL \Selector181~0_combout\ : std_logic;
SIGNAL \Selector180~0_combout\ : std_logic;
SIGNAL \Selector179~0_combout\ : std_logic;
SIGNAL \Selector178~0_combout\ : std_logic;
SIGNAL \Selector177~0_combout\ : std_logic;
SIGNAL \Selector176~0_combout\ : std_logic;
SIGNAL \Selector175~0_combout\ : std_logic;
SIGNAL \Selector174~0_combout\ : std_logic;
SIGNAL \Selector173~0_combout\ : std_logic;
SIGNAL \Selector172~0_combout\ : std_logic;
SIGNAL \Selector171~0_combout\ : std_logic;
SIGNAL \Selector170~0_combout\ : std_logic;
SIGNAL \Selector169~0_combout\ : std_logic;
SIGNAL \Selector168~0_combout\ : std_logic;
SIGNAL \Selector167~0_combout\ : std_logic;
SIGNAL \Selector166~0_combout\ : std_logic;
SIGNAL \Selector165~0_combout\ : std_logic;
SIGNAL \Selector164~0_combout\ : std_logic;
SIGNAL \Selector163~0_combout\ : std_logic;
SIGNAL \Selector162~0_combout\ : std_logic;
SIGNAL \Selector161~0_combout\ : std_logic;
SIGNAL \Selector160~0_combout\ : std_logic;
SIGNAL \Selector159~0_combout\ : std_logic;
SIGNAL \Selector158~0_combout\ : std_logic;
SIGNAL \Selector157~0_combout\ : std_logic;
SIGNAL \Selector156~0_combout\ : std_logic;
SIGNAL \Selector155~0_combout\ : std_logic;
SIGNAL \Selector154~0_combout\ : std_logic;
SIGNAL \Selector153~0_combout\ : std_logic;
SIGNAL \Selector152~0_combout\ : std_logic;
SIGNAL \Selector151~0_combout\ : std_logic;
SIGNAL \Selector150~0_combout\ : std_logic;
SIGNAL \Selector149~0_combout\ : std_logic;
SIGNAL \Selector148~0_combout\ : std_logic;
SIGNAL \Selector147~0_combout\ : std_logic;
SIGNAL \Selector146~0_combout\ : std_logic;
SIGNAL \Selector145~0_combout\ : std_logic;
SIGNAL \Selector144~0_combout\ : std_logic;
SIGNAL \Selector143~0_combout\ : std_logic;
SIGNAL \Selector142~0_combout\ : std_logic;
SIGNAL \Selector141~0_combout\ : std_logic;
SIGNAL \Selector140~0_combout\ : std_logic;
SIGNAL \Selector139~0_combout\ : std_logic;
SIGNAL \Selector138~0_combout\ : std_logic;
SIGNAL \Selector137~0_combout\ : std_logic;
SIGNAL \Selector136~0_combout\ : std_logic;
SIGNAL \Selector135~0_combout\ : std_logic;
SIGNAL \Selector134~0_combout\ : std_logic;
SIGNAL \Selector133~0_combout\ : std_logic;
SIGNAL \Selector132~0_combout\ : std_logic;
SIGNAL \Selector131~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[56]~combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[52]~combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[22]~combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[21]~combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[18]~combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[16]~combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[8]~combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[0]~combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \CLK~clkctrl_outclk\ : std_logic;
SIGNAL \CNT[21]~feeder_combout\ : std_logic;
SIGNAL \start~combout\ : std_logic;
SIGNAL \Selector195~0_combout\ : std_logic;
SIGNAL \Selector198~0_combout\ : std_logic;
SIGNAL \next_state.wait_state_2627~combout\ : std_logic;
SIGNAL \current_state.wait_state~0_combout\ : std_logic;
SIGNAL \RST~combout\ : std_logic;
SIGNAL \RST~clkctrl_outclk\ : std_logic;
SIGNAL \current_state.wait_state~regout\ : std_logic;
SIGNAL \Selector197~0_combout\ : std_logic;
SIGNAL \next_state.exec_state_2618~combout\ : std_logic;
SIGNAL \current_state.exec_state~regout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \Add4~95_combout\ : std_logic;
SIGNAL \Add4~1\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \Add4~94_combout\ : std_logic;
SIGNAL \Add4~3\ : std_logic;
SIGNAL \Add4~4_combout\ : std_logic;
SIGNAL \Add4~93_combout\ : std_logic;
SIGNAL \Add4~5\ : std_logic;
SIGNAL \Add4~7\ : std_logic;
SIGNAL \Add4~8_combout\ : std_logic;
SIGNAL \Add4~88_combout\ : std_logic;
SIGNAL \Add4~9\ : std_logic;
SIGNAL \Add4~10_combout\ : std_logic;
SIGNAL \Add4~91_combout\ : std_logic;
SIGNAL \Add4~11\ : std_logic;
SIGNAL \Add4~13\ : std_logic;
SIGNAL \Add4~14_combout\ : std_logic;
SIGNAL \Add4~89_combout\ : std_logic;
SIGNAL \Add4~15\ : std_logic;
SIGNAL \Add4~17\ : std_logic;
SIGNAL \Add4~19\ : std_logic;
SIGNAL \Add4~21\ : std_logic;
SIGNAL \Add4~22_combout\ : std_logic;
SIGNAL \Add4~84_combout\ : std_logic;
SIGNAL \Add4~23\ : std_logic;
SIGNAL \Add4~24_combout\ : std_logic;
SIGNAL \Add4~83_combout\ : std_logic;
SIGNAL \Add4~25\ : std_logic;
SIGNAL \Add4~26_combout\ : std_logic;
SIGNAL \Add4~82_combout\ : std_logic;
SIGNAL \CNT[13]~feeder_combout\ : std_logic;
SIGNAL \Add4~27\ : std_logic;
SIGNAL \Add4~29\ : std_logic;
SIGNAL \Add4~30_combout\ : std_logic;
SIGNAL \Add4~80_combout\ : std_logic;
SIGNAL \Add4~31\ : std_logic;
SIGNAL \Add4~33\ : std_logic;
SIGNAL \Add4~35\ : std_logic;
SIGNAL \Add4~36_combout\ : std_logic;
SIGNAL \Add4~77_combout\ : std_logic;
SIGNAL \Add4~37\ : std_logic;
SIGNAL \Add4~39\ : std_logic;
SIGNAL \Add4~40_combout\ : std_logic;
SIGNAL \Add4~75_combout\ : std_logic;
SIGNAL \Add4~41\ : std_logic;
SIGNAL \Add4~43\ : std_logic;
SIGNAL \Add4~44_combout\ : std_logic;
SIGNAL \Add4~73_combout\ : std_logic;
SIGNAL \Add4~45\ : std_logic;
SIGNAL \Add4~46_combout\ : std_logic;
SIGNAL \Add4~72_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add4~47\ : std_logic;
SIGNAL \Add4~49\ : std_logic;
SIGNAL \Add4~50_combout\ : std_logic;
SIGNAL \Add4~70_combout\ : std_logic;
SIGNAL \Add4~51\ : std_logic;
SIGNAL \Add4~52_combout\ : std_logic;
SIGNAL \Add4~69_combout\ : std_logic;
SIGNAL \Add4~53\ : std_logic;
SIGNAL \Add4~55\ : std_logic;
SIGNAL \Add4~57\ : std_logic;
SIGNAL \Add4~58_combout\ : std_logic;
SIGNAL \Add4~66_combout\ : std_logic;
SIGNAL \Add4~59\ : std_logic;
SIGNAL \Add4~60_combout\ : std_logic;
SIGNAL \Add4~65_combout\ : std_logic;
SIGNAL \Add4~56_combout\ : std_logic;
SIGNAL \Add4~67_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Add4~32_combout\ : std_logic;
SIGNAL \Add4~79_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Add4~12_combout\ : std_logic;
SIGNAL \Add4~90_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Add4~28_combout\ : std_logic;
SIGNAL \Add4~81_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Add4~6_combout\ : std_logic;
SIGNAL \Add4~92_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \Selector196~0_combout\ : std_logic;
SIGNAL \Selector196~0clkctrl_outclk\ : std_logic;
SIGNAL \next_state.end_state_2609~combout\ : std_logic;
SIGNAL \current_state.end_state~regout\ : std_logic;
SIGNAL \current_state.end_state~clkctrl_outclk\ : std_logic;
SIGNAL \Selector60~0_combout\ : std_logic;
SIGNAL \Selector61~0_combout\ : std_logic;
SIGNAL \Selector62~0_combout\ : std_logic;
SIGNAL \Selector63~0_combout\ : std_logic;
SIGNAL \Selector50~0_combout\ : std_logic;
SIGNAL \Selector51~0_combout\ : std_logic;
SIGNAL \Selector52~0_combout\ : std_logic;
SIGNAL \Selector53~0_combout\ : std_logic;
SIGNAL \Selector36~0_combout\ : std_logic;
SIGNAL \Selector37~0_combout\ : std_logic;
SIGNAL \Selector38~0_combout\ : std_logic;
SIGNAL \Selector39~0_combout\ : std_logic;
SIGNAL \Selector40~0_combout\ : std_logic;
SIGNAL \Selector41~0_combout\ : std_logic;
SIGNAL \Selector42~0_combout\ : std_logic;
SIGNAL \Selector43~0_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Selector69~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[2]~combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Selector68~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[1]~combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Selector74~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[7]~combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \Selector72~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[5]~combout\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Selector71~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[4]~combout\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Selector70~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[3]~combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~15\ : std_logic;
SIGNAL \Add2~16_combout\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~13\ : std_logic;
SIGNAL \Add3~15\ : std_logic;
SIGNAL \Add3~17\ : std_logic;
SIGNAL \Add3~19\ : std_logic;
SIGNAL \Add3~20_combout\ : std_logic;
SIGNAL \Selector77~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[10]~combout\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Selector73~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[6]~combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \Add3~18_combout\ : std_logic;
SIGNAL \Selector76~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[9]~combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~21\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~24_combout\ : std_logic;
SIGNAL \Selector44~0_combout\ : std_logic;
SIGNAL \Selector45~0_combout\ : std_logic;
SIGNAL \Add2~17\ : std_logic;
SIGNAL \Add2~19\ : std_logic;
SIGNAL \Add2~20_combout\ : std_logic;
SIGNAL \Add3~21\ : std_logic;
SIGNAL \Add3~23\ : std_logic;
SIGNAL \Add3~24_combout\ : std_logic;
SIGNAL \Selector79~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[12]~combout\ : std_logic;
SIGNAL \Selector46~0_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add1~25\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~28_combout\ : std_logic;
SIGNAL \Add1~22_combout\ : std_logic;
SIGNAL \Selector78~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[11]~combout\ : std_logic;
SIGNAL \Add2~21\ : std_logic;
SIGNAL \Add2~23\ : std_logic;
SIGNAL \Add2~24_combout\ : std_logic;
SIGNAL \Add2~22_combout\ : std_logic;
SIGNAL \Add3~25\ : std_logic;
SIGNAL \Add3~27\ : std_logic;
SIGNAL \Add3~28_combout\ : std_logic;
SIGNAL \Selector81~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[14]~combout\ : std_logic;
SIGNAL \Add1~26_combout\ : std_logic;
SIGNAL \Add3~26_combout\ : std_logic;
SIGNAL \Selector80~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[13]~combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Add1~29\ : std_logic;
SIGNAL \Add1~31\ : std_logic;
SIGNAL \Add1~33\ : std_logic;
SIGNAL \Add1~34_combout\ : std_logic;
SIGNAL \Add2~25\ : std_logic;
SIGNAL \Add2~26_combout\ : std_logic;
SIGNAL \Add3~29\ : std_logic;
SIGNAL \Add3~31\ : std_logic;
SIGNAL \Add3~33\ : std_logic;
SIGNAL \Add3~34_combout\ : std_logic;
SIGNAL \Selector84~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[17]~combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Add1~35\ : std_logic;
SIGNAL \Add1~37\ : std_logic;
SIGNAL \Add1~39\ : std_logic;
SIGNAL \Add1~41\ : std_logic;
SIGNAL \Add1~43\ : std_logic;
SIGNAL \Add1~45\ : std_logic;
SIGNAL \Add1~47\ : std_logic;
SIGNAL \Add1~48_combout\ : std_logic;
SIGNAL \Selector91~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[24]~combout\ : std_logic;
SIGNAL \Selector56~0_combout\ : std_logic;
SIGNAL \Selector57~0_combout\ : std_logic;
SIGNAL \Selector58~0_combout\ : std_logic;
SIGNAL \Selector54~0_combout\ : std_logic;
SIGNAL \Add3~30_combout\ : std_logic;
SIGNAL \Add1~30_combout\ : std_logic;
SIGNAL \Selector82~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[15]~combout\ : std_logic;
SIGNAL \Selector48~0_combout\ : std_logic;
SIGNAL \Selector49~0_combout\ : std_logic;
SIGNAL \Add2~27\ : std_logic;
SIGNAL \Add2~29\ : std_logic;
SIGNAL \Add2~31\ : std_logic;
SIGNAL \Add2~33\ : std_logic;
SIGNAL \Add2~35\ : std_logic;
SIGNAL \Add2~37\ : std_logic;
SIGNAL \Add2~39\ : std_logic;
SIGNAL \Add2~41\ : std_logic;
SIGNAL \Add2~43\ : std_logic;
SIGNAL \Add2~45\ : std_logic;
SIGNAL \Add2~47\ : std_logic;
SIGNAL \Add2~48_combout\ : std_logic;
SIGNAL \Add2~46_combout\ : std_logic;
SIGNAL \Add2~34_combout\ : std_logic;
SIGNAL \Add2~32_combout\ : std_logic;
SIGNAL \Add3~35\ : std_logic;
SIGNAL \Add3~37\ : std_logic;
SIGNAL \Add3~39\ : std_logic;
SIGNAL \Add3~41\ : std_logic;
SIGNAL \Add3~43\ : std_logic;
SIGNAL \Add3~45\ : std_logic;
SIGNAL \Add3~47\ : std_logic;
SIGNAL \Add3~49\ : std_logic;
SIGNAL \Add3~51\ : std_logic;
SIGNAL \Add3~52_combout\ : std_logic;
SIGNAL \Add3~46_combout\ : std_logic;
SIGNAL \Selector90~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[23]~combout\ : std_logic;
SIGNAL \Add3~40_combout\ : std_logic;
SIGNAL \Add1~40_combout\ : std_logic;
SIGNAL \Selector87~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[20]~combout\ : std_logic;
SIGNAL \Add3~38_combout\ : std_logic;
SIGNAL \Add1~38_combout\ : std_logic;
SIGNAL \Selector86~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[19]~combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \Add1~49\ : std_logic;
SIGNAL \Add1~51\ : std_logic;
SIGNAL \Add1~52_combout\ : std_logic;
SIGNAL \Selector93~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[26]~combout\ : std_logic;
SIGNAL \Add2~49\ : std_logic;
SIGNAL \Add2~51\ : std_logic;
SIGNAL \Add2~53\ : std_logic;
SIGNAL \Add2~55\ : std_logic;
SIGNAL \Add2~56_combout\ : std_logic;
SIGNAL \Add2~54_combout\ : std_logic;
SIGNAL \Add2~52_combout\ : std_logic;
SIGNAL \Add3~53\ : std_logic;
SIGNAL \Add3~55\ : std_logic;
SIGNAL \Add3~57\ : std_logic;
SIGNAL \Add3~59\ : std_logic;
SIGNAL \Add3~60_combout\ : std_logic;
SIGNAL \Selector97~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[30]~combout\ : std_logic;
SIGNAL \Add3~54_combout\ : std_logic;
SIGNAL \Add1~53\ : std_logic;
SIGNAL \Add1~54_combout\ : std_logic;
SIGNAL \Selector94~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[27]~combout\ : std_logic;
SIGNAL \Add1~50_combout\ : std_logic;
SIGNAL \Add3~50_combout\ : std_logic;
SIGNAL \Selector92~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[25]~combout\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \Add1~55\ : std_logic;
SIGNAL \Add1~57\ : std_logic;
SIGNAL \Add1~58_combout\ : std_logic;
SIGNAL \Add3~58_combout\ : std_logic;
SIGNAL \Selector96~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[29]~combout\ : std_logic;
SIGNAL \Add3~56_combout\ : std_logic;
SIGNAL \Selector95~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[28]~combout\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \Add1~59\ : std_logic;
SIGNAL \Add1~61\ : std_logic;
SIGNAL \Add1~63\ : std_logic;
SIGNAL \Add1~65\ : std_logic;
SIGNAL \Add1~66_combout\ : std_logic;
SIGNAL \Selector64~0_combout\ : std_logic;
SIGNAL \Z[29]~feeder_combout\ : std_logic;
SIGNAL \Selector65~0_combout\ : std_logic;
SIGNAL \Add2~57\ : std_logic;
SIGNAL \Add2~59\ : std_logic;
SIGNAL \Add2~60_combout\ : std_logic;
SIGNAL \Add2~58_combout\ : std_logic;
SIGNAL \Add3~61\ : std_logic;
SIGNAL \Add3~63\ : std_logic;
SIGNAL \Add3~65\ : std_logic;
SIGNAL \Add3~66_combout\ : std_logic;
SIGNAL \Selector100~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[33]~combout\ : std_logic;
SIGNAL \Add3~64_combout\ : std_logic;
SIGNAL \Selector99~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[32]~combout\ : std_logic;
SIGNAL \Add1~62_combout\ : std_logic;
SIGNAL \Selector98~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[31]~combout\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~63\ : std_logic;
SIGNAL \Add0~65\ : std_logic;
SIGNAL \Add0~67\ : std_logic;
SIGNAL \Add0~68_combout\ : std_logic;
SIGNAL \Add0~66_combout\ : std_logic;
SIGNAL \Add1~67\ : std_logic;
SIGNAL \Add1~69\ : std_logic;
SIGNAL \Add1~71\ : std_logic;
SIGNAL \Add1~73\ : std_logic;
SIGNAL \Add1~75\ : std_logic;
SIGNAL \Add1~77\ : std_logic;
SIGNAL \Add1~79\ : std_logic;
SIGNAL \Add1~80_combout\ : std_logic;
SIGNAL \Selector66~0_combout\ : std_logic;
SIGNAL \Z[31]~feeder_combout\ : std_logic;
SIGNAL \Add2~61\ : std_logic;
SIGNAL \Add2~63\ : std_logic;
SIGNAL \Add2~65\ : std_logic;
SIGNAL \Add2~66_combout\ : std_logic;
SIGNAL \Add3~67\ : std_logic;
SIGNAL \Add3~69\ : std_logic;
SIGNAL \Add3~71\ : std_logic;
SIGNAL \Add3~73\ : std_logic;
SIGNAL \Add3~75\ : std_logic;
SIGNAL \Add3~77\ : std_logic;
SIGNAL \Add3~79\ : std_logic;
SIGNAL \Add3~80_combout\ : std_logic;
SIGNAL \Selector107~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[40]~combout\ : std_logic;
SIGNAL \Add1~78_combout\ : std_logic;
SIGNAL \Add3~78_combout\ : std_logic;
SIGNAL \Selector106~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[39]~combout\ : std_logic;
SIGNAL \Add1~76_combout\ : std_logic;
SIGNAL \Add3~76_combout\ : std_logic;
SIGNAL \Selector105~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[38]~combout\ : std_logic;
SIGNAL \Add1~72_combout\ : std_logic;
SIGNAL \Add3~72_combout\ : std_logic;
SIGNAL \Selector103~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[36]~combout\ : std_logic;
SIGNAL \Add3~68_combout\ : std_logic;
SIGNAL \Add1~68_combout\ : std_logic;
SIGNAL \Selector101~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[34]~combout\ : std_logic;
SIGNAL \Add2~67\ : std_logic;
SIGNAL \Add2~69\ : std_logic;
SIGNAL \Add2~71\ : std_logic;
SIGNAL \Add2~73\ : std_logic;
SIGNAL \Add2~75\ : std_logic;
SIGNAL \Add2~77\ : std_logic;
SIGNAL \Add2~79\ : std_logic;
SIGNAL \Add2~81\ : std_logic;
SIGNAL \Add2~83\ : std_logic;
SIGNAL \Add2~85\ : std_logic;
SIGNAL \Add2~86_combout\ : std_logic;
SIGNAL \Add2~84_combout\ : std_logic;
SIGNAL \Add2~80_combout\ : std_logic;
SIGNAL \Add2~78_combout\ : std_logic;
SIGNAL \Add3~81\ : std_logic;
SIGNAL \Add3~83\ : std_logic;
SIGNAL \Add3~85\ : std_logic;
SIGNAL \Add3~87\ : std_logic;
SIGNAL \Add3~89\ : std_logic;
SIGNAL \Add3~90_combout\ : std_logic;
SIGNAL \Add3~86_combout\ : std_logic;
SIGNAL \Add1~74_combout\ : std_logic;
SIGNAL \Add3~74_combout\ : std_logic;
SIGNAL \Selector104~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[37]~combout\ : std_logic;
SIGNAL \Add3~70_combout\ : std_logic;
SIGNAL \Selector102~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[35]~combout\ : std_logic;
SIGNAL \Add0~69\ : std_logic;
SIGNAL \Add0~71\ : std_logic;
SIGNAL \Add0~73\ : std_logic;
SIGNAL \Add0~75\ : std_logic;
SIGNAL \Add0~77\ : std_logic;
SIGNAL \Add0~79\ : std_logic;
SIGNAL \Add0~80_combout\ : std_logic;
SIGNAL \Add0~78_combout\ : std_logic;
SIGNAL \Add1~81\ : std_logic;
SIGNAL \Add1~83\ : std_logic;
SIGNAL \Add1~85\ : std_logic;
SIGNAL \Add1~86_combout\ : std_logic;
SIGNAL \Selector110~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[43]~combout\ : std_logic;
SIGNAL \Add1~84_combout\ : std_logic;
SIGNAL \Add3~84_combout\ : std_logic;
SIGNAL \Selector109~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[42]~combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[41]~combout\ : std_logic;
SIGNAL \Add0~81\ : std_logic;
SIGNAL \Add0~83\ : std_logic;
SIGNAL \Add0~85\ : std_logic;
SIGNAL \Add0~86_combout\ : std_logic;
SIGNAL \Add0~84_combout\ : std_logic;
SIGNAL \Add1~87\ : std_logic;
SIGNAL \Add1~89\ : std_logic;
SIGNAL \Add1~90_combout\ : std_logic;
SIGNAL \Selector112~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[45]~combout\ : std_logic;
SIGNAL \Add3~88_combout\ : std_logic;
SIGNAL \Add1~88_combout\ : std_logic;
SIGNAL \Selector111~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[44]~combout\ : std_logic;
SIGNAL \Add2~87\ : std_logic;
SIGNAL \Add2~89\ : std_logic;
SIGNAL \Add2~90_combout\ : std_logic;
SIGNAL \Add2~88_combout\ : std_logic;
SIGNAL \Add3~91\ : std_logic;
SIGNAL \Add3~93\ : std_logic;
SIGNAL \Add3~95\ : std_logic;
SIGNAL \Add3~97\ : std_logic;
SIGNAL \Add3~99\ : std_logic;
SIGNAL \Add3~100_combout\ : std_logic;
SIGNAL \Add0~87\ : std_logic;
SIGNAL \Add0~89\ : std_logic;
SIGNAL \Add0~90_combout\ : std_logic;
SIGNAL \Add0~88_combout\ : std_logic;
SIGNAL \Add1~91\ : std_logic;
SIGNAL \Add1~93\ : std_logic;
SIGNAL \Add1~94_combout\ : std_logic;
SIGNAL \Add3~94_combout\ : std_logic;
SIGNAL \Selector114~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[47]~combout\ : std_logic;
SIGNAL \Add3~92_combout\ : std_logic;
SIGNAL \Add1~92_combout\ : std_logic;
SIGNAL \Selector113~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[46]~combout\ : std_logic;
SIGNAL \Add0~91\ : std_logic;
SIGNAL \Add0~93\ : std_logic;
SIGNAL \Add0~94_combout\ : std_logic;
SIGNAL \Add1~95\ : std_logic;
SIGNAL \Add1~97\ : std_logic;
SIGNAL \Add1~99\ : std_logic;
SIGNAL \Add1~100_combout\ : std_logic;
SIGNAL \Selector117~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[50]~combout\ : std_logic;
SIGNAL \Add3~98_combout\ : std_logic;
SIGNAL \Add1~98_combout\ : std_logic;
SIGNAL \Selector116~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[49]~combout\ : std_logic;
SIGNAL \Add1~96_combout\ : std_logic;
SIGNAL \Add3~96_combout\ : std_logic;
SIGNAL \Selector115~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[48]~combout\ : std_logic;
SIGNAL \Add2~91\ : std_logic;
SIGNAL \Add2~93\ : std_logic;
SIGNAL \Add2~95\ : std_logic;
SIGNAL \Add2~97\ : std_logic;
SIGNAL \Add2~99\ : std_logic;
SIGNAL \Add2~101\ : std_logic;
SIGNAL \Add2~103\ : std_logic;
SIGNAL \Add2~105\ : std_logic;
SIGNAL \Add2~107\ : std_logic;
SIGNAL \Add2~109\ : std_logic;
SIGNAL \Add2~111\ : std_logic;
SIGNAL \Add2~112_combout\ : std_logic;
SIGNAL \Add2~104_combout\ : std_logic;
SIGNAL \Add2~100_combout\ : std_logic;
SIGNAL \Add2~98_combout\ : std_logic;
SIGNAL \Add3~101\ : std_logic;
SIGNAL \Add3~103\ : std_logic;
SIGNAL \Add3~105\ : std_logic;
SIGNAL \Add3~107\ : std_logic;
SIGNAL \Add3~109\ : std_logic;
SIGNAL \Add3~111\ : std_logic;
SIGNAL \Add3~113\ : std_logic;
SIGNAL \Add3~115\ : std_logic;
SIGNAL \Add3~117\ : std_logic;
SIGNAL \Add3~118_combout\ : std_logic;
SIGNAL \Add3~108_combout\ : std_logic;
SIGNAL \Add0~95\ : std_logic;
SIGNAL \Add0~97\ : std_logic;
SIGNAL \Add0~99\ : std_logic;
SIGNAL \Add0~100_combout\ : std_logic;
SIGNAL \Add0~98_combout\ : std_logic;
SIGNAL \Add1~101\ : std_logic;
SIGNAL \Add1~103\ : std_logic;
SIGNAL \Add1~105\ : std_logic;
SIGNAL \Add1~107\ : std_logic;
SIGNAL \Add1~108_combout\ : std_logic;
SIGNAL \Selector121~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[54]~combout\ : std_logic;
SIGNAL \Add3~106_combout\ : std_logic;
SIGNAL \Add1~106_combout\ : std_logic;
SIGNAL \Selector120~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[53]~combout\ : std_logic;
SIGNAL \Add1~102_combout\ : std_logic;
SIGNAL \Add3~102_combout\ : std_logic;
SIGNAL \Selector118~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[51]~combout\ : std_logic;
SIGNAL \Add0~101\ : std_logic;
SIGNAL \Add0~103\ : std_logic;
SIGNAL \Add0~105\ : std_logic;
SIGNAL \Add0~107\ : std_logic;
SIGNAL \Add0~109\ : std_logic;
SIGNAL \Add0~111\ : std_logic;
SIGNAL \Add0~112_combout\ : std_logic;
SIGNAL \Add0~110_combout\ : std_logic;
SIGNAL \Add1~109\ : std_logic;
SIGNAL \Add1~111\ : std_logic;
SIGNAL \Add1~113\ : std_logic;
SIGNAL \Add1~115\ : std_logic;
SIGNAL \Add1~117\ : std_logic;
SIGNAL \Add1~118_combout\ : std_logic;
SIGNAL \Selector126~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[59]~combout\ : std_logic;
SIGNAL \Add2~117\ : std_logic;
SIGNAL \Add2~118_combout\ : std_logic;
SIGNAL \Add3~119\ : std_logic;
SIGNAL \Add3~121\ : std_logic;
SIGNAL \Add3~122_combout\ : std_logic;
SIGNAL \Add1~116_combout\ : std_logic;
SIGNAL \Selector125~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[58]~combout\ : std_logic;
SIGNAL \Add0~113\ : std_logic;
SIGNAL \Add0~115\ : std_logic;
SIGNAL \Add0~117\ : std_logic;
SIGNAL \Add0~118_combout\ : std_logic;
SIGNAL \Add0~116_combout\ : std_logic;
SIGNAL \Add1~119\ : std_logic;
SIGNAL \Add1~121\ : std_logic;
SIGNAL \Add1~122_combout\ : std_logic;
SIGNAL \Selector128~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[61]~combout\ : std_logic;
SIGNAL \Add2~119\ : std_logic;
SIGNAL \Add2~121\ : std_logic;
SIGNAL \Add2~122_combout\ : std_logic;
SIGNAL \Add2~120_combout\ : std_logic;
SIGNAL \Add3~123\ : std_logic;
SIGNAL \Add3~125_cout\ : std_logic;
SIGNAL \Add3~126_combout\ : std_logic;
SIGNAL \Selector130~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[63]~combout\ : std_logic;
SIGNAL \Add1~110_combout\ : std_logic;
SIGNAL \Selector122~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[55]~combout\ : std_logic;
SIGNAL \Add2~110_combout\ : std_logic;
SIGNAL \Add3~114_combout\ : std_logic;
SIGNAL \Add1~114_combout\ : std_logic;
SIGNAL \Selector124~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[57]~combout\ : std_logic;
SIGNAL \Add2~113\ : std_logic;
SIGNAL \Add2~115\ : std_logic;
SIGNAL \Add2~116_combout\ : std_logic;
SIGNAL \Add3~120_combout\ : std_logic;
SIGNAL \Add1~120_combout\ : std_logic;
SIGNAL \Selector127~0_combout\ : std_logic;
SIGNAL \sqrt_sequential:Rvar[60]~combout\ : std_logic;
SIGNAL \Add0~119\ : std_logic;
SIGNAL \Add0~121\ : std_logic;
SIGNAL \Add0~122_combout\ : std_logic;
SIGNAL \Add0~120_combout\ : std_logic;
SIGNAL \Add1~123\ : std_logic;
SIGNAL \Add1~125_cout\ : std_logic;
SIGNAL \Add1~126_combout\ : std_logic;
SIGNAL \Selector35~0_combout\ : std_logic;
SIGNAL \Z_OUT[0]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[1]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[2]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[3]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[4]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[5]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[6]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[7]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[8]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[9]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[10]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[11]$latch~combout\ : std_logic;
SIGNAL \Selector47~0_combout\ : std_logic;
SIGNAL \Z_OUT[12]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[13]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[14]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[15]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[16]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[17]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[18]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[19]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[20]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[21]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[22]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[23]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[24]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[25]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[26]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[27]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[28]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[29]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[30]$latch~combout\ : std_logic;
SIGNAL \Z_OUT[31]$latch~combout\ : std_logic;
SIGNAL \DONE$latch~combout\ : std_logic;
SIGNAL Zin : std_logic_vector(31 DOWNTO 0);
SIGNAL Z : std_logic_vector(31 DOWNTO 0);
SIGNAL Din : std_logic_vector(63 DOWNTO 0);
SIGNAL D : std_logic_vector(63 DOWNTO 0);
SIGNAL CNTin : std_logic_vector(31 DOWNTO 0);
SIGNAL CNT : std_logic_vector(31 DOWNTO 0);
SIGNAL \A~combout\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \ALT_INV_RST~combout\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_RST <= RST;
ww_start <= start;
ww_A <= A;
Z_OUT <= ww_Z_OUT;
DONE <= ww_DONE;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK~combout\);

\Selector196~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Selector196~0_combout\);

\current_state.end_state~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \current_state.end_state~regout\);

\RST~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \RST~combout\);
\ALT_INV_RST~combout\ <= NOT \RST~combout\;

-- Location: LCCOMB_X19_Y17_N2
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\sqrt_sequential:Rvar[0]~combout\ & ((GND) # (!Z(0)))) # (!\sqrt_sequential:Rvar[0]~combout\ & (Z(0) $ (GND)))
-- \Add0~1\ = CARRY((\sqrt_sequential:Rvar[0]~combout\) # (!Z(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[0]~combout\,
	datab => Z(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X19_Y17_N8
\Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\sqrt_sequential:Rvar[3]~combout\ & ((Z(3) & (!\Add0~5\)) # (!Z(3) & (\Add0~5\ & VCC)))) # (!\sqrt_sequential:Rvar[3]~combout\ & ((Z(3) & ((\Add0~5\) # (GND))) # (!Z(3) & (!\Add0~5\))))
-- \Add0~7\ = CARRY((\sqrt_sequential:Rvar[3]~combout\ & (Z(3) & !\Add0~5\)) # (!\sqrt_sequential:Rvar[3]~combout\ & ((Z(3)) # (!\Add0~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[3]~combout\,
	datab => Z(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X19_Y17_N10
\Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = ((Z(4) $ (\sqrt_sequential:Rvar[4]~combout\ $ (\Add0~7\)))) # (GND)
-- \Add0~9\ = CARRY((Z(4) & (\sqrt_sequential:Rvar[4]~combout\ & !\Add0~7\)) # (!Z(4) & ((\sqrt_sequential:Rvar[4]~combout\) # (!\Add0~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(4),
	datab => \sqrt_sequential:Rvar[4]~combout\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X19_Y17_N12
\Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (Z(5) & ((\sqrt_sequential:Rvar[5]~combout\ & (!\Add0~9\)) # (!\sqrt_sequential:Rvar[5]~combout\ & ((\Add0~9\) # (GND))))) # (!Z(5) & ((\sqrt_sequential:Rvar[5]~combout\ & (\Add0~9\ & VCC)) # (!\sqrt_sequential:Rvar[5]~combout\ & 
-- (!\Add0~9\))))
-- \Add0~11\ = CARRY((Z(5) & ((!\Add0~9\) # (!\sqrt_sequential:Rvar[5]~combout\))) # (!Z(5) & (!\sqrt_sequential:Rvar[5]~combout\ & !\Add0~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(5),
	datab => \sqrt_sequential:Rvar[5]~combout\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X19_Y17_N14
\Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = ((Z(6) $ (\sqrt_sequential:Rvar[6]~combout\ $ (\Add0~11\)))) # (GND)
-- \Add0~13\ = CARRY((Z(6) & (\sqrt_sequential:Rvar[6]~combout\ & !\Add0~11\)) # (!Z(6) & ((\sqrt_sequential:Rvar[6]~combout\) # (!\Add0~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(6),
	datab => \sqrt_sequential:Rvar[6]~combout\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X19_Y17_N20
\Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (Z(9) & ((\sqrt_sequential:Rvar[9]~combout\ & (!\Add0~17\)) # (!\sqrt_sequential:Rvar[9]~combout\ & ((\Add0~17\) # (GND))))) # (!Z(9) & ((\sqrt_sequential:Rvar[9]~combout\ & (\Add0~17\ & VCC)) # (!\sqrt_sequential:Rvar[9]~combout\ & 
-- (!\Add0~17\))))
-- \Add0~19\ = CARRY((Z(9) & ((!\Add0~17\) # (!\sqrt_sequential:Rvar[9]~combout\))) # (!Z(9) & (!\sqrt_sequential:Rvar[9]~combout\ & !\Add0~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(9),
	datab => \sqrt_sequential:Rvar[9]~combout\,
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X19_Y17_N30
\Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = ((Z(14) $ (\sqrt_sequential:Rvar[14]~combout\ $ (\Add0~27\)))) # (GND)
-- \Add0~29\ = CARRY((Z(14) & (\sqrt_sequential:Rvar[14]~combout\ & !\Add0~27\)) # (!Z(14) & ((\sqrt_sequential:Rvar[14]~combout\) # (!\Add0~27\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(14),
	datab => \sqrt_sequential:Rvar[14]~combout\,
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X19_Y16_N2
\Add0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = ((\sqrt_sequential:Rvar[16]~combout\ $ (Z(16) $ (\Add0~31\)))) # (GND)
-- \Add0~33\ = CARRY((\sqrt_sequential:Rvar[16]~combout\ & ((!\Add0~31\) # (!Z(16)))) # (!\sqrt_sequential:Rvar[16]~combout\ & (!Z(16) & !\Add0~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[16]~combout\,
	datab => Z(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X19_Y16_N8
\Add0~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (Z(19) & ((\sqrt_sequential:Rvar[19]~combout\ & (!\Add0~37\)) # (!\sqrt_sequential:Rvar[19]~combout\ & ((\Add0~37\) # (GND))))) # (!Z(19) & ((\sqrt_sequential:Rvar[19]~combout\ & (\Add0~37\ & VCC)) # 
-- (!\sqrt_sequential:Rvar[19]~combout\ & (!\Add0~37\))))
-- \Add0~39\ = CARRY((Z(19) & ((!\Add0~37\) # (!\sqrt_sequential:Rvar[19]~combout\))) # (!Z(19) & (!\sqrt_sequential:Rvar[19]~combout\ & !\Add0~37\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(19),
	datab => \sqrt_sequential:Rvar[19]~combout\,
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: LCCOMB_X19_Y16_N10
\Add0~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = ((Z(20) $ (\sqrt_sequential:Rvar[20]~combout\ $ (\Add0~39\)))) # (GND)
-- \Add0~41\ = CARRY((Z(20) & (\sqrt_sequential:Rvar[20]~combout\ & !\Add0~39\)) # (!Z(20) & ((\sqrt_sequential:Rvar[20]~combout\) # (!\Add0~39\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(20),
	datab => \sqrt_sequential:Rvar[20]~combout\,
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: LCCOMB_X19_Y16_N12
\Add0~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (\sqrt_sequential:Rvar[21]~combout\ & ((Z(21) & (!\Add0~41\)) # (!Z(21) & (\Add0~41\ & VCC)))) # (!\sqrt_sequential:Rvar[21]~combout\ & ((Z(21) & ((\Add0~41\) # (GND))) # (!Z(21) & (!\Add0~41\))))
-- \Add0~43\ = CARRY((\sqrt_sequential:Rvar[21]~combout\ & (Z(21) & !\Add0~41\)) # (!\sqrt_sequential:Rvar[21]~combout\ & ((Z(21)) # (!\Add0~41\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[21]~combout\,
	datab => Z(21),
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: LCCOMB_X19_Y16_N14
\Add0~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = ((\sqrt_sequential:Rvar[22]~combout\ $ (Z(22) $ (\Add0~43\)))) # (GND)
-- \Add0~45\ = CARRY((\sqrt_sequential:Rvar[22]~combout\ & ((!\Add0~43\) # (!Z(22)))) # (!\sqrt_sequential:Rvar[22]~combout\ & (!Z(22) & !\Add0~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[22]~combout\,
	datab => Z(22),
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: LCCOMB_X19_Y16_N20
\Add0~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (Z(25) & ((\sqrt_sequential:Rvar[25]~combout\ & (!\Add0~49\)) # (!\sqrt_sequential:Rvar[25]~combout\ & ((\Add0~49\) # (GND))))) # (!Z(25) & ((\sqrt_sequential:Rvar[25]~combout\ & (\Add0~49\ & VCC)) # 
-- (!\sqrt_sequential:Rvar[25]~combout\ & (!\Add0~49\))))
-- \Add0~51\ = CARRY((Z(25) & ((!\Add0~49\) # (!\sqrt_sequential:Rvar[25]~combout\))) # (!Z(25) & (!\sqrt_sequential:Rvar[25]~combout\ & !\Add0~49\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(25),
	datab => \sqrt_sequential:Rvar[25]~combout\,
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

-- Location: LCCOMB_X19_Y15_N0
\Add0~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = (Z(31) & ((\sqrt_sequential:Rvar[31]~combout\ & (!\Add0~61\)) # (!\sqrt_sequential:Rvar[31]~combout\ & ((\Add0~61\) # (GND))))) # (!Z(31) & ((\sqrt_sequential:Rvar[31]~combout\ & (\Add0~61\ & VCC)) # 
-- (!\sqrt_sequential:Rvar[31]~combout\ & (!\Add0~61\))))
-- \Add0~63\ = CARRY((Z(31) & ((!\Add0~61\) # (!\sqrt_sequential:Rvar[31]~combout\))) # (!Z(31) & (!\sqrt_sequential:Rvar[31]~combout\ & !\Add0~61\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(31),
	datab => \sqrt_sequential:Rvar[31]~combout\,
	datad => VCC,
	cin => \Add0~61\,
	combout => \Add0~62_combout\,
	cout => \Add0~63\);

-- Location: LCCOMB_X19_Y15_N2
\Add0~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~64_combout\ = (\sqrt_sequential:Rvar[32]~combout\ & ((GND) # (!\Add0~63\))) # (!\sqrt_sequential:Rvar[32]~combout\ & (\Add0~63\ $ (GND)))
-- \Add0~65\ = CARRY((\sqrt_sequential:Rvar[32]~combout\) # (!\Add0~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[32]~combout\,
	datad => VCC,
	cin => \Add0~63\,
	combout => \Add0~64_combout\,
	cout => \Add0~65\);

-- Location: LCCOMB_X19_Y15_N8
\Add0~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~70_combout\ = (\sqrt_sequential:Rvar[35]~combout\ & (\Add0~69\ & VCC)) # (!\sqrt_sequential:Rvar[35]~combout\ & (!\Add0~69\))
-- \Add0~71\ = CARRY((!\sqrt_sequential:Rvar[35]~combout\ & !\Add0~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[35]~combout\,
	datad => VCC,
	cin => \Add0~69\,
	combout => \Add0~70_combout\,
	cout => \Add0~71\);

-- Location: LCCOMB_X19_Y15_N10
\Add0~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~72_combout\ = (\sqrt_sequential:Rvar[36]~combout\ & ((GND) # (!\Add0~71\))) # (!\sqrt_sequential:Rvar[36]~combout\ & (\Add0~71\ $ (GND)))
-- \Add0~73\ = CARRY((\sqrt_sequential:Rvar[36]~combout\) # (!\Add0~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[36]~combout\,
	datad => VCC,
	cin => \Add0~71\,
	combout => \Add0~72_combout\,
	cout => \Add0~73\);

-- Location: LCCOMB_X19_Y15_N12
\Add0~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~74_combout\ = (\sqrt_sequential:Rvar[37]~combout\ & (\Add0~73\ & VCC)) # (!\sqrt_sequential:Rvar[37]~combout\ & (!\Add0~73\))
-- \Add0~75\ = CARRY((!\sqrt_sequential:Rvar[37]~combout\ & !\Add0~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[37]~combout\,
	datad => VCC,
	cin => \Add0~73\,
	combout => \Add0~74_combout\,
	cout => \Add0~75\);

-- Location: LCCOMB_X19_Y15_N14
\Add0~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~76_combout\ = (\sqrt_sequential:Rvar[38]~combout\ & ((GND) # (!\Add0~75\))) # (!\sqrt_sequential:Rvar[38]~combout\ & (\Add0~75\ $ (GND)))
-- \Add0~77\ = CARRY((\sqrt_sequential:Rvar[38]~combout\) # (!\Add0~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[38]~combout\,
	datad => VCC,
	cin => \Add0~75\,
	combout => \Add0~76_combout\,
	cout => \Add0~77\);

-- Location: LCCOMB_X19_Y15_N20
\Add0~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~82_combout\ = (\sqrt_sequential:Rvar[41]~combout\ & (\Add0~81\ & VCC)) # (!\sqrt_sequential:Rvar[41]~combout\ & (!\Add0~81\))
-- \Add0~83\ = CARRY((!\sqrt_sequential:Rvar[41]~combout\ & !\Add0~81\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[41]~combout\,
	datad => VCC,
	cin => \Add0~81\,
	combout => \Add0~82_combout\,
	cout => \Add0~83\);

-- Location: LCCOMB_X19_Y15_N30
\Add0~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~92_combout\ = (\sqrt_sequential:Rvar[46]~combout\ & ((GND) # (!\Add0~91\))) # (!\sqrt_sequential:Rvar[46]~combout\ & (\Add0~91\ $ (GND)))
-- \Add0~93\ = CARRY((\sqrt_sequential:Rvar[46]~combout\) # (!\Add0~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[46]~combout\,
	datad => VCC,
	cin => \Add0~91\,
	combout => \Add0~92_combout\,
	cout => \Add0~93\);

-- Location: LCCOMB_X19_Y14_N2
\Add0~96\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~96_combout\ = (\sqrt_sequential:Rvar[48]~combout\ & ((GND) # (!\Add0~95\))) # (!\sqrt_sequential:Rvar[48]~combout\ & (\Add0~95\ $ (GND)))
-- \Add0~97\ = CARRY((\sqrt_sequential:Rvar[48]~combout\) # (!\Add0~95\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[48]~combout\,
	datad => VCC,
	cin => \Add0~95\,
	combout => \Add0~96_combout\,
	cout => \Add0~97\);

-- Location: LCCOMB_X19_Y14_N8
\Add0~102\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~102_combout\ = (\sqrt_sequential:Rvar[51]~combout\ & (\Add0~101\ & VCC)) # (!\sqrt_sequential:Rvar[51]~combout\ & (!\Add0~101\))
-- \Add0~103\ = CARRY((!\sqrt_sequential:Rvar[51]~combout\ & !\Add0~101\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[51]~combout\,
	datad => VCC,
	cin => \Add0~101\,
	combout => \Add0~102_combout\,
	cout => \Add0~103\);

-- Location: LCCOMB_X19_Y14_N10
\Add0~104\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~104_combout\ = (\sqrt_sequential:Rvar[52]~combout\ & ((GND) # (!\Add0~103\))) # (!\sqrt_sequential:Rvar[52]~combout\ & (\Add0~103\ $ (GND)))
-- \Add0~105\ = CARRY((\sqrt_sequential:Rvar[52]~combout\) # (!\Add0~103\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[52]~combout\,
	datad => VCC,
	cin => \Add0~103\,
	combout => \Add0~104_combout\,
	cout => \Add0~105\);

-- Location: LCCOMB_X19_Y14_N12
\Add0~106\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~106_combout\ = (\sqrt_sequential:Rvar[53]~combout\ & (\Add0~105\ & VCC)) # (!\sqrt_sequential:Rvar[53]~combout\ & (!\Add0~105\))
-- \Add0~107\ = CARRY((!\sqrt_sequential:Rvar[53]~combout\ & !\Add0~105\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[53]~combout\,
	datad => VCC,
	cin => \Add0~105\,
	combout => \Add0~106_combout\,
	cout => \Add0~107\);

-- Location: LCCOMB_X19_Y14_N14
\Add0~108\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~108_combout\ = (\sqrt_sequential:Rvar[54]~combout\ & ((GND) # (!\Add0~107\))) # (!\sqrt_sequential:Rvar[54]~combout\ & (\Add0~107\ $ (GND)))
-- \Add0~109\ = CARRY((\sqrt_sequential:Rvar[54]~combout\) # (!\Add0~107\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[54]~combout\,
	datad => VCC,
	cin => \Add0~107\,
	combout => \Add0~108_combout\,
	cout => \Add0~109\);

-- Location: LCCOMB_X19_Y14_N20
\Add0~114\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~114_combout\ = (\sqrt_sequential:Rvar[57]~combout\ & (\Add0~113\ & VCC)) # (!\sqrt_sequential:Rvar[57]~combout\ & (!\Add0~113\))
-- \Add0~115\ = CARRY((!\sqrt_sequential:Rvar[57]~combout\ & !\Add0~113\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[57]~combout\,
	datad => VCC,
	cin => \Add0~113\,
	combout => \Add0~114_combout\,
	cout => \Add0~115\);

-- Location: LCCOMB_X20_Y17_N0
\Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = D(62) $ (VCC)
-- \Add1~1\ = CARRY(D(62))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => D(62),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X20_Y17_N4
\Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (\Add0~0_combout\ & ((GND) # (!\Add1~3\))) # (!\Add0~0_combout\ & (\Add1~3\ $ (GND)))
-- \Add1~5\ = CARRY((\Add0~0_combout\) # (!\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X20_Y17_N6
\Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\Add0~2_combout\ & (\Add1~5\ & VCC)) # (!\Add0~2_combout\ & (!\Add1~5\))
-- \Add1~7\ = CARRY((!\Add0~2_combout\ & !\Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~2_combout\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X20_Y17_N10
\Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\Add0~6_combout\ & (\Add1~9\ & VCC)) # (!\Add0~6_combout\ & (!\Add1~9\))
-- \Add1~11\ = CARRY((!\Add0~6_combout\ & !\Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X20_Y17_N16
\Add1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (\Add0~12_combout\ & ((GND) # (!\Add1~15\))) # (!\Add0~12_combout\ & (\Add1~15\ $ (GND)))
-- \Add1~17\ = CARRY((\Add0~12_combout\) # (!\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~12_combout\,
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X20_Y17_N20
\Add1~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (\Add0~16_combout\ & ((GND) # (!\Add1~19\))) # (!\Add0~16_combout\ & (\Add1~19\ $ (GND)))
-- \Add1~21\ = CARRY((\Add0~16_combout\) # (!\Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~16_combout\,
	datad => VCC,
	cin => \Add1~19\,
	combout => \Add1~20_combout\,
	cout => \Add1~21\);

-- Location: LCCOMB_X20_Y16_N0
\Add1~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~32_combout\ = (\Add0~28_combout\ & ((GND) # (!\Add1~31\))) # (!\Add0~28_combout\ & (\Add1~31\ $ (GND)))
-- \Add1~33\ = CARRY((\Add0~28_combout\) # (!\Add1~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~28_combout\,
	datad => VCC,
	cin => \Add1~31\,
	combout => \Add1~32_combout\,
	cout => \Add1~33\);

-- Location: LCCOMB_X20_Y16_N4
\Add1~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~36_combout\ = (\Add0~32_combout\ & ((GND) # (!\Add1~35\))) # (!\Add0~32_combout\ & (\Add1~35\ $ (GND)))
-- \Add1~37\ = CARRY((\Add0~32_combout\) # (!\Add1~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~32_combout\,
	datad => VCC,
	cin => \Add1~35\,
	combout => \Add1~36_combout\,
	cout => \Add1~37\);

-- Location: LCCOMB_X20_Y16_N10
\Add1~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~42_combout\ = (\Add0~38_combout\ & (\Add1~41\ & VCC)) # (!\Add0~38_combout\ & (!\Add1~41\))
-- \Add1~43\ = CARRY((!\Add0~38_combout\ & !\Add1~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~38_combout\,
	datad => VCC,
	cin => \Add1~41\,
	combout => \Add1~42_combout\,
	cout => \Add1~43\);

-- Location: LCCOMB_X20_Y16_N12
\Add1~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~44_combout\ = (\Add0~40_combout\ & ((GND) # (!\Add1~43\))) # (!\Add0~40_combout\ & (\Add1~43\ $ (GND)))
-- \Add1~45\ = CARRY((\Add0~40_combout\) # (!\Add1~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~40_combout\,
	datad => VCC,
	cin => \Add1~43\,
	combout => \Add1~44_combout\,
	cout => \Add1~45\);

-- Location: LCCOMB_X20_Y16_N14
\Add1~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~46_combout\ = (\Add0~42_combout\ & (\Add1~45\ & VCC)) # (!\Add0~42_combout\ & (!\Add1~45\))
-- \Add1~47\ = CARRY((!\Add0~42_combout\ & !\Add1~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~42_combout\,
	datad => VCC,
	cin => \Add1~45\,
	combout => \Add1~46_combout\,
	cout => \Add1~47\);

-- Location: LCCOMB_X20_Y16_N24
\Add1~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~56_combout\ = (\Add0~52_combout\ & ((GND) # (!\Add1~55\))) # (!\Add0~52_combout\ & (\Add1~55\ $ (GND)))
-- \Add1~57\ = CARRY((\Add0~52_combout\) # (!\Add1~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~52_combout\,
	datad => VCC,
	cin => \Add1~55\,
	combout => \Add1~56_combout\,
	cout => \Add1~57\);

-- Location: LCCOMB_X20_Y16_N28
\Add1~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~60_combout\ = (\Add0~56_combout\ & ((GND) # (!\Add1~59\))) # (!\Add0~56_combout\ & (\Add1~59\ $ (GND)))
-- \Add1~61\ = CARRY((\Add0~56_combout\) # (!\Add1~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~56_combout\,
	datad => VCC,
	cin => \Add1~59\,
	combout => \Add1~60_combout\,
	cout => \Add1~61\);

-- Location: LCCOMB_X20_Y15_N0
\Add1~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~64_combout\ = (\Add0~60_combout\ & ((GND) # (!\Add1~63\))) # (!\Add0~60_combout\ & (\Add1~63\ $ (GND)))
-- \Add1~65\ = CARRY((\Add0~60_combout\) # (!\Add1~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~60_combout\,
	datad => VCC,
	cin => \Add1~63\,
	combout => \Add1~64_combout\,
	cout => \Add1~65\);

-- Location: LCCOMB_X20_Y15_N6
\Add1~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~70_combout\ = (\Add0~66_combout\ & (\Add1~69\ & VCC)) # (!\Add0~66_combout\ & (!\Add1~69\))
-- \Add1~71\ = CARRY((!\Add0~66_combout\ & !\Add1~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~66_combout\,
	datad => VCC,
	cin => \Add1~69\,
	combout => \Add1~70_combout\,
	cout => \Add1~71\);

-- Location: LCCOMB_X20_Y15_N18
\Add1~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~82_combout\ = (\Add0~78_combout\ & (\Add1~81\ & VCC)) # (!\Add0~78_combout\ & (!\Add1~81\))
-- \Add1~83\ = CARRY((!\Add0~78_combout\ & !\Add1~81\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~78_combout\,
	datad => VCC,
	cin => \Add1~81\,
	combout => \Add1~82_combout\,
	cout => \Add1~83\);

-- Location: LCCOMB_X20_Y14_N8
\Add1~104\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~104_combout\ = (\Add0~100_combout\ & ((GND) # (!\Add1~103\))) # (!\Add0~100_combout\ & (\Add1~103\ $ (GND)))
-- \Add1~105\ = CARRY((\Add0~100_combout\) # (!\Add1~103\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~100_combout\,
	datad => VCC,
	cin => \Add1~103\,
	combout => \Add1~104_combout\,
	cout => \Add1~105\);

-- Location: LCCOMB_X20_Y14_N16
\Add1~112\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~112_combout\ = (\Add0~108_combout\ & ((GND) # (!\Add1~111\))) # (!\Add0~108_combout\ & (\Add1~111\ $ (GND)))
-- \Add1~113\ = CARRY((\Add0~108_combout\) # (!\Add1~111\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~108_combout\,
	datad => VCC,
	cin => \Add1~111\,
	combout => \Add1~112_combout\,
	cout => \Add1~113\);

-- Location: LCCOMB_X22_Y17_N2
\Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = (\sqrt_sequential:Rvar[0]~combout\ & (Z(0) $ (VCC))) # (!\sqrt_sequential:Rvar[0]~combout\ & (Z(0) & VCC))
-- \Add2~1\ = CARRY((\sqrt_sequential:Rvar[0]~combout\ & Z(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[0]~combout\,
	datab => Z(0),
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: LCCOMB_X22_Y17_N8
\Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (Z(3) & ((\sqrt_sequential:Rvar[3]~combout\ & (\Add2~5\ & VCC)) # (!\sqrt_sequential:Rvar[3]~combout\ & (!\Add2~5\)))) # (!Z(3) & ((\sqrt_sequential:Rvar[3]~combout\ & (!\Add2~5\)) # (!\sqrt_sequential:Rvar[3]~combout\ & ((\Add2~5\) # 
-- (GND)))))
-- \Add2~7\ = CARRY((Z(3) & (!\sqrt_sequential:Rvar[3]~combout\ & !\Add2~5\)) # (!Z(3) & ((!\Add2~5\) # (!\sqrt_sequential:Rvar[3]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(3),
	datab => \sqrt_sequential:Rvar[3]~combout\,
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCCOMB_X22_Y17_N10
\Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = ((Z(4) $ (\sqrt_sequential:Rvar[4]~combout\ $ (!\Add2~7\)))) # (GND)
-- \Add2~9\ = CARRY((Z(4) & ((\sqrt_sequential:Rvar[4]~combout\) # (!\Add2~7\))) # (!Z(4) & (\sqrt_sequential:Rvar[4]~combout\ & !\Add2~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(4),
	datab => \sqrt_sequential:Rvar[4]~combout\,
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCCOMB_X22_Y17_N12
\Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (Z(5) & ((\sqrt_sequential:Rvar[5]~combout\ & (\Add2~9\ & VCC)) # (!\sqrt_sequential:Rvar[5]~combout\ & (!\Add2~9\)))) # (!Z(5) & ((\sqrt_sequential:Rvar[5]~combout\ & (!\Add2~9\)) # (!\sqrt_sequential:Rvar[5]~combout\ & ((\Add2~9\) # 
-- (GND)))))
-- \Add2~11\ = CARRY((Z(5) & (!\sqrt_sequential:Rvar[5]~combout\ & !\Add2~9\)) # (!Z(5) & ((!\Add2~9\) # (!\sqrt_sequential:Rvar[5]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(5),
	datab => \sqrt_sequential:Rvar[5]~combout\,
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: LCCOMB_X22_Y17_N14
\Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = ((\sqrt_sequential:Rvar[6]~combout\ $ (Z(6) $ (!\Add2~11\)))) # (GND)
-- \Add2~13\ = CARRY((\sqrt_sequential:Rvar[6]~combout\ & ((Z(6)) # (!\Add2~11\))) # (!\sqrt_sequential:Rvar[6]~combout\ & (Z(6) & !\Add2~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[6]~combout\,
	datab => Z(6),
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: LCCOMB_X22_Y17_N20
\Add2~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~18_combout\ = (Z(9) & ((\sqrt_sequential:Rvar[9]~combout\ & (\Add2~17\ & VCC)) # (!\sqrt_sequential:Rvar[9]~combout\ & (!\Add2~17\)))) # (!Z(9) & ((\sqrt_sequential:Rvar[9]~combout\ & (!\Add2~17\)) # (!\sqrt_sequential:Rvar[9]~combout\ & 
-- ((\Add2~17\) # (GND)))))
-- \Add2~19\ = CARRY((Z(9) & (!\sqrt_sequential:Rvar[9]~combout\ & !\Add2~17\)) # (!Z(9) & ((!\Add2~17\) # (!\sqrt_sequential:Rvar[9]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(9),
	datab => \sqrt_sequential:Rvar[9]~combout\,
	datad => VCC,
	cin => \Add2~17\,
	combout => \Add2~18_combout\,
	cout => \Add2~19\);

-- Location: LCCOMB_X22_Y17_N30
\Add2~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~28_combout\ = ((\sqrt_sequential:Rvar[14]~combout\ $ (Z(14) $ (!\Add2~27\)))) # (GND)
-- \Add2~29\ = CARRY((\sqrt_sequential:Rvar[14]~combout\ & ((Z(14)) # (!\Add2~27\))) # (!\sqrt_sequential:Rvar[14]~combout\ & (Z(14) & !\Add2~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[14]~combout\,
	datab => Z(14),
	datad => VCC,
	cin => \Add2~27\,
	combout => \Add2~28_combout\,
	cout => \Add2~29\);

-- Location: LCCOMB_X22_Y16_N0
\Add2~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~30_combout\ = (Z(15) & ((\sqrt_sequential:Rvar[15]~combout\ & (\Add2~29\ & VCC)) # (!\sqrt_sequential:Rvar[15]~combout\ & (!\Add2~29\)))) # (!Z(15) & ((\sqrt_sequential:Rvar[15]~combout\ & (!\Add2~29\)) # (!\sqrt_sequential:Rvar[15]~combout\ & 
-- ((\Add2~29\) # (GND)))))
-- \Add2~31\ = CARRY((Z(15) & (!\sqrt_sequential:Rvar[15]~combout\ & !\Add2~29\)) # (!Z(15) & ((!\Add2~29\) # (!\sqrt_sequential:Rvar[15]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(15),
	datab => \sqrt_sequential:Rvar[15]~combout\,
	datad => VCC,
	cin => \Add2~29\,
	combout => \Add2~30_combout\,
	cout => \Add2~31\);

-- Location: LCCOMB_X22_Y16_N6
\Add2~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~36_combout\ = ((\sqrt_sequential:Rvar[18]~combout\ $ (Z(18) $ (!\Add2~35\)))) # (GND)
-- \Add2~37\ = CARRY((\sqrt_sequential:Rvar[18]~combout\ & ((Z(18)) # (!\Add2~35\))) # (!\sqrt_sequential:Rvar[18]~combout\ & (Z(18) & !\Add2~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[18]~combout\,
	datab => Z(18),
	datad => VCC,
	cin => \Add2~35\,
	combout => \Add2~36_combout\,
	cout => \Add2~37\);

-- Location: LCCOMB_X22_Y16_N8
\Add2~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~38_combout\ = (\sqrt_sequential:Rvar[19]~combout\ & ((Z(19) & (\Add2~37\ & VCC)) # (!Z(19) & (!\Add2~37\)))) # (!\sqrt_sequential:Rvar[19]~combout\ & ((Z(19) & (!\Add2~37\)) # (!Z(19) & ((\Add2~37\) # (GND)))))
-- \Add2~39\ = CARRY((\sqrt_sequential:Rvar[19]~combout\ & (!Z(19) & !\Add2~37\)) # (!\sqrt_sequential:Rvar[19]~combout\ & ((!\Add2~37\) # (!Z(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[19]~combout\,
	datab => Z(19),
	datad => VCC,
	cin => \Add2~37\,
	combout => \Add2~38_combout\,
	cout => \Add2~39\);

-- Location: LCCOMB_X22_Y16_N10
\Add2~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~40_combout\ = ((\sqrt_sequential:Rvar[20]~combout\ $ (Z(20) $ (!\Add2~39\)))) # (GND)
-- \Add2~41\ = CARRY((\sqrt_sequential:Rvar[20]~combout\ & ((Z(20)) # (!\Add2~39\))) # (!\sqrt_sequential:Rvar[20]~combout\ & (Z(20) & !\Add2~39\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[20]~combout\,
	datab => Z(20),
	datad => VCC,
	cin => \Add2~39\,
	combout => \Add2~40_combout\,
	cout => \Add2~41\);

-- Location: LCCOMB_X22_Y16_N12
\Add2~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~42_combout\ = (\sqrt_sequential:Rvar[21]~combout\ & ((Z(21) & (\Add2~41\ & VCC)) # (!Z(21) & (!\Add2~41\)))) # (!\sqrt_sequential:Rvar[21]~combout\ & ((Z(21) & (!\Add2~41\)) # (!Z(21) & ((\Add2~41\) # (GND)))))
-- \Add2~43\ = CARRY((\sqrt_sequential:Rvar[21]~combout\ & (!Z(21) & !\Add2~41\)) # (!\sqrt_sequential:Rvar[21]~combout\ & ((!\Add2~41\) # (!Z(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[21]~combout\,
	datab => Z(21),
	datad => VCC,
	cin => \Add2~41\,
	combout => \Add2~42_combout\,
	cout => \Add2~43\);

-- Location: LCCOMB_X22_Y16_N14
\Add2~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~44_combout\ = ((\sqrt_sequential:Rvar[22]~combout\ $ (Z(22) $ (!\Add2~43\)))) # (GND)
-- \Add2~45\ = CARRY((\sqrt_sequential:Rvar[22]~combout\ & ((Z(22)) # (!\Add2~43\))) # (!\sqrt_sequential:Rvar[22]~combout\ & (Z(22) & !\Add2~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[22]~combout\,
	datab => Z(22),
	datad => VCC,
	cin => \Add2~43\,
	combout => \Add2~44_combout\,
	cout => \Add2~45\);

-- Location: LCCOMB_X22_Y16_N20
\Add2~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~50_combout\ = (\sqrt_sequential:Rvar[25]~combout\ & ((Z(25) & (\Add2~49\ & VCC)) # (!Z(25) & (!\Add2~49\)))) # (!\sqrt_sequential:Rvar[25]~combout\ & ((Z(25) & (!\Add2~49\)) # (!Z(25) & ((\Add2~49\) # (GND)))))
-- \Add2~51\ = CARRY((\sqrt_sequential:Rvar[25]~combout\ & (!Z(25) & !\Add2~49\)) # (!\sqrt_sequential:Rvar[25]~combout\ & ((!\Add2~49\) # (!Z(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[25]~combout\,
	datab => Z(25),
	datad => VCC,
	cin => \Add2~49\,
	combout => \Add2~50_combout\,
	cout => \Add2~51\);

-- Location: LCCOMB_X22_Y15_N0
\Add2~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~62_combout\ = (\sqrt_sequential:Rvar[31]~combout\ & ((Z(31) & (\Add2~61\ & VCC)) # (!Z(31) & (!\Add2~61\)))) # (!\sqrt_sequential:Rvar[31]~combout\ & ((Z(31) & (!\Add2~61\)) # (!Z(31) & ((\Add2~61\) # (GND)))))
-- \Add2~63\ = CARRY((\sqrt_sequential:Rvar[31]~combout\ & (!Z(31) & !\Add2~61\)) # (!\sqrt_sequential:Rvar[31]~combout\ & ((!\Add2~61\) # (!Z(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[31]~combout\,
	datab => Z(31),
	datad => VCC,
	cin => \Add2~61\,
	combout => \Add2~62_combout\,
	cout => \Add2~63\);

-- Location: LCCOMB_X22_Y15_N2
\Add2~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~64_combout\ = (\sqrt_sequential:Rvar[32]~combout\ & (\Add2~63\ $ (GND))) # (!\sqrt_sequential:Rvar[32]~combout\ & (!\Add2~63\ & VCC))
-- \Add2~65\ = CARRY((\sqrt_sequential:Rvar[32]~combout\ & !\Add2~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[32]~combout\,
	datad => VCC,
	cin => \Add2~63\,
	combout => \Add2~64_combout\,
	cout => \Add2~65\);

-- Location: LCCOMB_X22_Y15_N6
\Add2~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~68_combout\ = (\sqrt_sequential:Rvar[34]~combout\ & (\Add2~67\ $ (GND))) # (!\sqrt_sequential:Rvar[34]~combout\ & (!\Add2~67\ & VCC))
-- \Add2~69\ = CARRY((\sqrt_sequential:Rvar[34]~combout\ & !\Add2~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[34]~combout\,
	datad => VCC,
	cin => \Add2~67\,
	combout => \Add2~68_combout\,
	cout => \Add2~69\);

-- Location: LCCOMB_X22_Y15_N8
\Add2~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~70_combout\ = (\sqrt_sequential:Rvar[35]~combout\ & (!\Add2~69\)) # (!\sqrt_sequential:Rvar[35]~combout\ & ((\Add2~69\) # (GND)))
-- \Add2~71\ = CARRY((!\Add2~69\) # (!\sqrt_sequential:Rvar[35]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[35]~combout\,
	datad => VCC,
	cin => \Add2~69\,
	combout => \Add2~70_combout\,
	cout => \Add2~71\);

-- Location: LCCOMB_X22_Y15_N10
\Add2~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~72_combout\ = (\sqrt_sequential:Rvar[36]~combout\ & (\Add2~71\ $ (GND))) # (!\sqrt_sequential:Rvar[36]~combout\ & (!\Add2~71\ & VCC))
-- \Add2~73\ = CARRY((\sqrt_sequential:Rvar[36]~combout\ & !\Add2~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[36]~combout\,
	datad => VCC,
	cin => \Add2~71\,
	combout => \Add2~72_combout\,
	cout => \Add2~73\);

-- Location: LCCOMB_X22_Y15_N12
\Add2~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~74_combout\ = (\sqrt_sequential:Rvar[37]~combout\ & (!\Add2~73\)) # (!\sqrt_sequential:Rvar[37]~combout\ & ((\Add2~73\) # (GND)))
-- \Add2~75\ = CARRY((!\Add2~73\) # (!\sqrt_sequential:Rvar[37]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[37]~combout\,
	datad => VCC,
	cin => \Add2~73\,
	combout => \Add2~74_combout\,
	cout => \Add2~75\);

-- Location: LCCOMB_X22_Y15_N14
\Add2~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~76_combout\ = (\sqrt_sequential:Rvar[38]~combout\ & (\Add2~75\ $ (GND))) # (!\sqrt_sequential:Rvar[38]~combout\ & (!\Add2~75\ & VCC))
-- \Add2~77\ = CARRY((\sqrt_sequential:Rvar[38]~combout\ & !\Add2~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[38]~combout\,
	datad => VCC,
	cin => \Add2~75\,
	combout => \Add2~76_combout\,
	cout => \Add2~77\);

-- Location: LCCOMB_X22_Y15_N20
\Add2~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~82_combout\ = (\sqrt_sequential:Rvar[41]~combout\ & (!\Add2~81\)) # (!\sqrt_sequential:Rvar[41]~combout\ & ((\Add2~81\) # (GND)))
-- \Add2~83\ = CARRY((!\Add2~81\) # (!\sqrt_sequential:Rvar[41]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[41]~combout\,
	datad => VCC,
	cin => \Add2~81\,
	combout => \Add2~82_combout\,
	cout => \Add2~83\);

-- Location: LCCOMB_X22_Y15_N30
\Add2~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~92_combout\ = (\sqrt_sequential:Rvar[46]~combout\ & (\Add2~91\ $ (GND))) # (!\sqrt_sequential:Rvar[46]~combout\ & (!\Add2~91\ & VCC))
-- \Add2~93\ = CARRY((\sqrt_sequential:Rvar[46]~combout\ & !\Add2~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[46]~combout\,
	datad => VCC,
	cin => \Add2~91\,
	combout => \Add2~92_combout\,
	cout => \Add2~93\);

-- Location: LCCOMB_X22_Y14_N0
\Add2~94\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~94_combout\ = (\sqrt_sequential:Rvar[47]~combout\ & (!\Add2~93\)) # (!\sqrt_sequential:Rvar[47]~combout\ & ((\Add2~93\) # (GND)))
-- \Add2~95\ = CARRY((!\Add2~93\) # (!\sqrt_sequential:Rvar[47]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[47]~combout\,
	datad => VCC,
	cin => \Add2~93\,
	combout => \Add2~94_combout\,
	cout => \Add2~95\);

-- Location: LCCOMB_X22_Y14_N2
\Add2~96\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~96_combout\ = (\sqrt_sequential:Rvar[48]~combout\ & (\Add2~95\ $ (GND))) # (!\sqrt_sequential:Rvar[48]~combout\ & (!\Add2~95\ & VCC))
-- \Add2~97\ = CARRY((\sqrt_sequential:Rvar[48]~combout\ & !\Add2~95\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[48]~combout\,
	datad => VCC,
	cin => \Add2~95\,
	combout => \Add2~96_combout\,
	cout => \Add2~97\);

-- Location: LCCOMB_X22_Y14_N8
\Add2~102\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~102_combout\ = (\sqrt_sequential:Rvar[51]~combout\ & (!\Add2~101\)) # (!\sqrt_sequential:Rvar[51]~combout\ & ((\Add2~101\) # (GND)))
-- \Add2~103\ = CARRY((!\Add2~101\) # (!\sqrt_sequential:Rvar[51]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[51]~combout\,
	datad => VCC,
	cin => \Add2~101\,
	combout => \Add2~102_combout\,
	cout => \Add2~103\);

-- Location: LCCOMB_X22_Y14_N12
\Add2~106\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~106_combout\ = (\sqrt_sequential:Rvar[53]~combout\ & (!\Add2~105\)) # (!\sqrt_sequential:Rvar[53]~combout\ & ((\Add2~105\) # (GND)))
-- \Add2~107\ = CARRY((!\Add2~105\) # (!\sqrt_sequential:Rvar[53]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[53]~combout\,
	datad => VCC,
	cin => \Add2~105\,
	combout => \Add2~106_combout\,
	cout => \Add2~107\);

-- Location: LCCOMB_X22_Y14_N14
\Add2~108\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~108_combout\ = (\sqrt_sequential:Rvar[54]~combout\ & (\Add2~107\ $ (GND))) # (!\sqrt_sequential:Rvar[54]~combout\ & (!\Add2~107\ & VCC))
-- \Add2~109\ = CARRY((\sqrt_sequential:Rvar[54]~combout\ & !\Add2~107\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[54]~combout\,
	datad => VCC,
	cin => \Add2~107\,
	combout => \Add2~108_combout\,
	cout => \Add2~109\);

-- Location: LCCOMB_X22_Y14_N20
\Add2~114\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~114_combout\ = (\sqrt_sequential:Rvar[57]~combout\ & (!\Add2~113\)) # (!\sqrt_sequential:Rvar[57]~combout\ & ((\Add2~113\) # (GND)))
-- \Add2~115\ = CARRY((!\Add2~113\) # (!\sqrt_sequential:Rvar[57]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[57]~combout\,
	datad => VCC,
	cin => \Add2~113\,
	combout => \Add2~114_combout\,
	cout => \Add2~115\);

-- Location: LCCOMB_X23_Y17_N0
\Add3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = D(62) $ (VCC)
-- \Add3~1\ = CARRY(D(62))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => D(62),
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X23_Y17_N2
\Add3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (D(63) & (\Add3~1\ & VCC)) # (!D(63) & (!\Add3~1\))
-- \Add3~3\ = CARRY((!D(63) & !\Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => D(63),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X23_Y17_N8
\Add3~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (\Add2~4_combout\ & (\Add3~7\ $ (GND))) # (!\Add2~4_combout\ & (!\Add3~7\ & VCC))
-- \Add3~9\ = CARRY((\Add2~4_combout\ & !\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~4_combout\,
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X23_Y17_N12
\Add3~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = (\Add2~8_combout\ & (\Add3~11\ $ (GND))) # (!\Add2~8_combout\ & (!\Add3~11\ & VCC))
-- \Add3~13\ = CARRY((\Add2~8_combout\ & !\Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~8_combout\,
	datad => VCC,
	cin => \Add3~11\,
	combout => \Add3~12_combout\,
	cout => \Add3~13\);

-- Location: LCCOMB_X23_Y17_N14
\Add3~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = (\Add2~10_combout\ & (!\Add3~13\)) # (!\Add2~10_combout\ & ((\Add3~13\) # (GND)))
-- \Add3~15\ = CARRY((!\Add3~13\) # (!\Add2~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~10_combout\,
	datad => VCC,
	cin => \Add3~13\,
	combout => \Add3~14_combout\,
	cout => \Add3~15\);

-- Location: LCCOMB_X23_Y17_N16
\Add3~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~16_combout\ = (\Add2~12_combout\ & (\Add3~15\ $ (GND))) # (!\Add2~12_combout\ & (!\Add3~15\ & VCC))
-- \Add3~17\ = CARRY((\Add2~12_combout\ & !\Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~12_combout\,
	datad => VCC,
	cin => \Add3~15\,
	combout => \Add3~16_combout\,
	cout => \Add3~17\);

-- Location: LCCOMB_X23_Y17_N22
\Add3~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~22_combout\ = (\Add2~18_combout\ & (!\Add3~21\)) # (!\Add2~18_combout\ & ((\Add3~21\) # (GND)))
-- \Add3~23\ = CARRY((!\Add3~21\) # (!\Add2~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~18_combout\,
	datad => VCC,
	cin => \Add3~21\,
	combout => \Add3~22_combout\,
	cout => \Add3~23\);

-- Location: LCCOMB_X23_Y16_N0
\Add3~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~32_combout\ = (\Add2~28_combout\ & (\Add3~31\ $ (GND))) # (!\Add2~28_combout\ & (!\Add3~31\ & VCC))
-- \Add3~33\ = CARRY((\Add2~28_combout\ & !\Add3~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~28_combout\,
	datad => VCC,
	cin => \Add3~31\,
	combout => \Add3~32_combout\,
	cout => \Add3~33\);

-- Location: LCCOMB_X23_Y16_N4
\Add3~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~36_combout\ = (\Add2~32_combout\ & (\Add3~35\ $ (GND))) # (!\Add2~32_combout\ & (!\Add3~35\ & VCC))
-- \Add3~37\ = CARRY((\Add2~32_combout\ & !\Add3~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~32_combout\,
	datad => VCC,
	cin => \Add3~35\,
	combout => \Add3~36_combout\,
	cout => \Add3~37\);

-- Location: LCCOMB_X23_Y16_N10
\Add3~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~42_combout\ = (\Add2~38_combout\ & (!\Add3~41\)) # (!\Add2~38_combout\ & ((\Add3~41\) # (GND)))
-- \Add3~43\ = CARRY((!\Add3~41\) # (!\Add2~38_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~38_combout\,
	datad => VCC,
	cin => \Add3~41\,
	combout => \Add3~42_combout\,
	cout => \Add3~43\);

-- Location: LCCOMB_X23_Y16_N12
\Add3~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~44_combout\ = (\Add2~40_combout\ & (\Add3~43\ $ (GND))) # (!\Add2~40_combout\ & (!\Add3~43\ & VCC))
-- \Add3~45\ = CARRY((\Add2~40_combout\ & !\Add3~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~40_combout\,
	datad => VCC,
	cin => \Add3~43\,
	combout => \Add3~44_combout\,
	cout => \Add3~45\);

-- Location: LCCOMB_X23_Y16_N16
\Add3~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~48_combout\ = (\Add2~44_combout\ & (\Add3~47\ $ (GND))) # (!\Add2~44_combout\ & (!\Add3~47\ & VCC))
-- \Add3~49\ = CARRY((\Add2~44_combout\ & !\Add3~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~44_combout\,
	datad => VCC,
	cin => \Add3~47\,
	combout => \Add3~48_combout\,
	cout => \Add3~49\);

-- Location: LCCOMB_X23_Y16_N30
\Add3~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~62_combout\ = (\Add2~58_combout\ & (!\Add3~61\)) # (!\Add2~58_combout\ & ((\Add3~61\) # (GND)))
-- \Add3~63\ = CARRY((!\Add3~61\) # (!\Add2~58_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~58_combout\,
	datad => VCC,
	cin => \Add3~61\,
	combout => \Add3~62_combout\,
	cout => \Add3~63\);

-- Location: LCCOMB_X23_Y15_N18
\Add3~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~82_combout\ = (\Add2~78_combout\ & (!\Add3~81\)) # (!\Add2~78_combout\ & ((\Add3~81\) # (GND)))
-- \Add3~83\ = CARRY((!\Add3~81\) # (!\Add2~78_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~78_combout\,
	datad => VCC,
	cin => \Add3~81\,
	combout => \Add3~82_combout\,
	cout => \Add3~83\);

-- Location: LCCOMB_X23_Y14_N8
\Add3~104\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~104_combout\ = (\Add2~100_combout\ & (\Add3~103\ $ (GND))) # (!\Add2~100_combout\ & (!\Add3~103\ & VCC))
-- \Add3~105\ = CARRY((\Add2~100_combout\ & !\Add3~103\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~100_combout\,
	datad => VCC,
	cin => \Add3~103\,
	combout => \Add3~104_combout\,
	cout => \Add3~105\);

-- Location: LCCOMB_X23_Y14_N14
\Add3~110\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~110_combout\ = (\Add2~106_combout\ & (!\Add3~109\)) # (!\Add2~106_combout\ & ((\Add3~109\) # (GND)))
-- \Add3~111\ = CARRY((!\Add3~109\) # (!\Add2~106_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~106_combout\,
	datad => VCC,
	cin => \Add3~109\,
	combout => \Add3~110_combout\,
	cout => \Add3~111\);

-- Location: LCCOMB_X23_Y14_N16
\Add3~112\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~112_combout\ = (\Add2~108_combout\ & (\Add3~111\ $ (GND))) # (!\Add2~108_combout\ & (!\Add3~111\ & VCC))
-- \Add3~113\ = CARRY((\Add2~108_combout\ & !\Add3~111\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~108_combout\,
	datad => VCC,
	cin => \Add3~111\,
	combout => \Add3~112_combout\,
	cout => \Add3~113\);

-- Location: LCCOMB_X23_Y14_N20
\Add3~116\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~116_combout\ = (\Add2~112_combout\ & (\Add3~115\ $ (GND))) # (!\Add2~112_combout\ & (!\Add3~115\ & VCC))
-- \Add3~117\ = CARRY((\Add2~112_combout\ & !\Add3~115\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~112_combout\,
	datad => VCC,
	cin => \Add3~115\,
	combout => \Add3~116_combout\,
	cout => \Add3~117\);

-- Location: LCCOMB_X15_Y16_N16
\Add4~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~16_combout\ = (CNT(8) & (\Add4~15\ $ (GND))) # (!CNT(8) & (!\Add4~15\ & VCC))
-- \Add4~17\ = CARRY((CNT(8) & !\Add4~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(8),
	datad => VCC,
	cin => \Add4~15\,
	combout => \Add4~16_combout\,
	cout => \Add4~17\);

-- Location: LCCOMB_X15_Y16_N18
\Add4~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~18_combout\ = (CNT(9) & (!\Add4~17\)) # (!CNT(9) & ((\Add4~17\) # (GND)))
-- \Add4~19\ = CARRY((!\Add4~17\) # (!CNT(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(9),
	datad => VCC,
	cin => \Add4~17\,
	combout => \Add4~18_combout\,
	cout => \Add4~19\);

-- Location: LCCOMB_X15_Y16_N20
\Add4~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~20_combout\ = (CNT(10) & (\Add4~19\ $ (GND))) # (!CNT(10) & (!\Add4~19\ & VCC))
-- \Add4~21\ = CARRY((CNT(10) & !\Add4~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(10),
	datad => VCC,
	cin => \Add4~19\,
	combout => \Add4~20_combout\,
	cout => \Add4~21\);

-- Location: LCCOMB_X15_Y15_N2
\Add4~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~34_combout\ = (CNT(17) & (!\Add4~33\)) # (!CNT(17) & ((\Add4~33\) # (GND)))
-- \Add4~35\ = CARRY((!\Add4~33\) # (!CNT(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(17),
	datad => VCC,
	cin => \Add4~33\,
	combout => \Add4~34_combout\,
	cout => \Add4~35\);

-- Location: LCCOMB_X15_Y15_N6
\Add4~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~38_combout\ = (CNT(19) & (!\Add4~37\)) # (!CNT(19) & ((\Add4~37\) # (GND)))
-- \Add4~39\ = CARRY((!\Add4~37\) # (!CNT(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(19),
	datad => VCC,
	cin => \Add4~37\,
	combout => \Add4~38_combout\,
	cout => \Add4~39\);

-- Location: LCCOMB_X15_Y15_N10
\Add4~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~42_combout\ = (CNT(21) & (!\Add4~41\)) # (!CNT(21) & ((\Add4~41\) # (GND)))
-- \Add4~43\ = CARRY((!\Add4~41\) # (!CNT(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(21),
	datad => VCC,
	cin => \Add4~41\,
	combout => \Add4~42_combout\,
	cout => \Add4~43\);

-- Location: LCCOMB_X15_Y15_N16
\Add4~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~48_combout\ = (CNT(24) & (\Add4~47\ $ (GND))) # (!CNT(24) & (!\Add4~47\ & VCC))
-- \Add4~49\ = CARRY((CNT(24) & !\Add4~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(24),
	datad => VCC,
	cin => \Add4~47\,
	combout => \Add4~48_combout\,
	cout => \Add4~49\);

-- Location: LCCOMB_X15_Y15_N22
\Add4~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~54_combout\ = (CNT(27) & (!\Add4~53\)) # (!CNT(27) & ((\Add4~53\) # (GND)))
-- \Add4~55\ = CARRY((!\Add4~53\) # (!CNT(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(27),
	datad => VCC,
	cin => \Add4~53\,
	combout => \Add4~54_combout\,
	cout => \Add4~55\);

-- Location: LCCOMB_X15_Y15_N28
\Add4~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~60_combout\ = (CNT(30) & (\Add4~59\ $ (GND))) # (!CNT(30) & (!\Add4~59\ & VCC))
-- \Add4~61\ = CARRY((CNT(30) & !\Add4~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(30),
	datad => VCC,
	cin => \Add4~59\,
	combout => \Add4~60_combout\,
	cout => \Add4~61\);

-- Location: LCCOMB_X15_Y15_N30
\Add4~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~62_combout\ = \Add4~61\ $ (CNT(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => CNT(31),
	cin => \Add4~61\,
	combout => \Add4~62_combout\);

-- Location: LCFF_X14_Y17_N25
\D[63]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(63),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(63));

-- Location: LCFF_X19_Y18_N17
\D[62]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(62),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(62));

-- Location: LCFF_X14_Y15_N15
\CNT[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(31),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(31));

-- Location: LCFF_X14_Y15_N1
\CNT[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(27),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(27));

-- Location: LCFF_X14_Y15_N21
\CNT[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(24),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(24));

-- Location: LCCOMB_X14_Y15_N16
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!CNT(25) & (!CNT(27) & (!CNT(24) & !CNT(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNT(25),
	datab => CNT(27),
	datac => CNT(24),
	datad => CNT(26),
	combout => \Equal0~1_combout\);

-- Location: LCFF_X18_Y15_N23
\CNT[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \CNT[21]~feeder_combout\,
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(21));

-- Location: LCFF_X16_Y15_N11
\CNT[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(19),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(19));

-- Location: LCFF_X14_Y16_N31
\CNT[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(9),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(9));

-- Location: LCCOMB_X14_Y16_N8
\Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!CNT(8) & (!CNT(9) & (!CNT(11) & !CNT(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNT(8),
	datab => CNT(9),
	datac => CNT(11),
	datad => CNT(10),
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X18_Y16_N10
\Selector55~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector55~0_combout\ = (Z(19) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(19),
	datac => \current_state.exec_state~regout\,
	combout => \Selector55~0_combout\);

-- Location: LCCOMB_X19_Y13_N16
\Selector59~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector59~0_combout\ = (Z(23) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(23),
	datad => \current_state.exec_state~regout\,
	combout => \Selector59~0_combout\);

-- Location: LCCOMB_X24_Y14_N14
\Selector123~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector123~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~112_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~112_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~112_combout\,
	datac => \Add1~112_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector123~0_combout\);

-- Location: LCCOMB_X21_Y14_N4
\Selector119~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector119~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~104_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~104_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~104_combout\,
	datad => \Add1~104_combout\,
	combout => \Selector119~0_combout\);

-- Location: LCCOMB_X21_Y15_N16
\Selector108~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector108~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~82_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~82_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~82_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add1~82_combout\,
	combout => \Selector108~0_combout\);

-- Location: LCCOMB_X21_Y16_N24
\Selector89~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector89~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~44_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~44_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add3~44_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector89~0_combout\);

-- Location: LCCOMB_X21_Y16_N14
\Selector88~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector88~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~42_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~42_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add3~42_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector88~0_combout\);

-- Location: LCCOMB_X24_Y16_N20
\Selector85~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector85~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~36_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~36_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add3~36_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector85~0_combout\);

-- Location: LCCOMB_X21_Y17_N16
\Selector83~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector83~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~32_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~32_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~32_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add1~32_combout\,
	combout => \Selector83~0_combout\);

-- Location: LCCOMB_X18_Y14_N2
\Selector75~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector75~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~16_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~16_combout\,
	datac => \Add3~16_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector75~0_combout\);

-- Location: LCCOMB_X24_Y16_N6
\Selector67~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector67~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~0_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add3~0_combout\,
	combout => \Selector67~0_combout\);

-- Location: LCFF_X14_Y17_N27
\D[61]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(61),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(61));

-- Location: LCCOMB_X14_Y17_N12
\Selector194~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector194~0_combout\ = (\current_state.exec_state~regout\ & ((D(61)))) # (!\current_state.exec_state~regout\ & (\A~combout\(63)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(63),
	datac => \current_state.exec_state~regout\,
	datad => D(61),
	combout => \Selector194~0_combout\);

-- Location: LCFF_X19_Y18_N19
\D[60]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(60),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(60));

-- Location: LCCOMB_X19_Y18_N28
\Selector193~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector193~0_combout\ = (\current_state.exec_state~regout\ & ((D(60)))) # (!\current_state.exec_state~regout\ & (\A~combout\(62)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(62),
	datac => \current_state.exec_state~regout\,
	datad => D(60),
	combout => \Selector193~0_combout\);

-- Location: LCCOMB_X14_Y15_N6
\Add4~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~64_combout\ = (\current_state.exec_state~regout\ & \Add4~62_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datad => \Add4~62_combout\,
	combout => \Add4~64_combout\);

-- Location: LCCOMB_X14_Y15_N4
\Add4~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~68_combout\ = (\current_state.exec_state~regout\ & \Add4~54_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datad => \Add4~54_combout\,
	combout => \Add4~68_combout\);

-- Location: LCCOMB_X14_Y15_N2
\Add4~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~71_combout\ = (\Add4~48_combout\ & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add4~48_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Add4~71_combout\);

-- Location: LCCOMB_X18_Y15_N20
\Add4~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~74_combout\ = (\current_state.exec_state~regout\ & \Add4~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~42_combout\,
	combout => \Add4~74_combout\);

-- Location: LCCOMB_X16_Y15_N22
\Add4~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~76_combout\ = (\current_state.exec_state~regout\ & \Add4~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~38_combout\,
	combout => \Add4~76_combout\);

-- Location: LCCOMB_X16_Y15_N12
\Add4~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~78_combout\ = (\current_state.exec_state~regout\ & \Add4~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~34_combout\,
	combout => \Add4~78_combout\);

-- Location: LCCOMB_X14_Y16_N10
\Add4~85\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~85_combout\ = (\current_state.exec_state~regout\ & \Add4~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~20_combout\,
	combout => \Add4~85_combout\);

-- Location: LCCOMB_X14_Y16_N0
\Add4~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~86_combout\ = (\current_state.exec_state~regout\ & \Add4~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~18_combout\,
	combout => \Add4~86_combout\);

-- Location: LCCOMB_X14_Y16_N6
\Add4~87\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~87_combout\ = (\Add4~16_combout\ & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add4~16_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Add4~87_combout\);

-- Location: LCFF_X14_Y17_N23
\D[59]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(59),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(59));

-- Location: LCCOMB_X14_Y17_N28
\Selector192~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector192~0_combout\ = (\current_state.exec_state~regout\ & ((D(59)))) # (!\current_state.exec_state~regout\ & (\A~combout\(61)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(61),
	datac => \current_state.exec_state~regout\,
	datad => D(59),
	combout => \Selector192~0_combout\);

-- Location: LCFF_X19_Y18_N27
\D[58]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(58),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(58));

-- Location: LCCOMB_X19_Y18_N4
\Selector191~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector191~0_combout\ = (\current_state.exec_state~regout\ & ((D(58)))) # (!\current_state.exec_state~regout\ & (\A~combout\(60)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(60),
	datac => \current_state.exec_state~regout\,
	datad => D(58),
	combout => \Selector191~0_combout\);

-- Location: LCFF_X14_Y17_N31
\D[57]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(57),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(57));

-- Location: LCCOMB_X14_Y17_N0
\Selector190~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector190~0_combout\ = (\current_state.exec_state~regout\ & ((D(57)))) # (!\current_state.exec_state~regout\ & (\A~combout\(59)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(59),
	datac => \current_state.exec_state~regout\,
	datad => D(57),
	combout => \Selector190~0_combout\);

-- Location: LCFF_X19_Y18_N7
\D[56]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(56),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(56));

-- Location: LCCOMB_X19_Y18_N0
\Selector189~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector189~0_combout\ = (\current_state.exec_state~regout\ & ((D(56)))) # (!\current_state.exec_state~regout\ & (\A~combout\(58)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(58),
	datac => \current_state.exec_state~regout\,
	datad => D(56),
	combout => \Selector189~0_combout\);

-- Location: LCFF_X14_Y17_N3
\D[55]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(55),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(55));

-- Location: LCCOMB_X14_Y17_N4
\Selector188~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector188~0_combout\ = (\current_state.exec_state~regout\ & ((D(55)))) # (!\current_state.exec_state~regout\ & (\A~combout\(57)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(57),
	datac => \current_state.exec_state~regout\,
	datad => D(55),
	combout => \Selector188~0_combout\);

-- Location: LCFF_X19_Y18_N31
\D[54]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(54),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(54));

-- Location: LCCOMB_X19_Y18_N8
\Selector187~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector187~0_combout\ = (\current_state.exec_state~regout\ & ((D(54)))) # (!\current_state.exec_state~regout\ & (\A~combout\(56)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(56),
	datac => \current_state.exec_state~regout\,
	datad => D(54),
	combout => \Selector187~0_combout\);

-- Location: LCFF_X14_Y17_N15
\D[53]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(53),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(53));

-- Location: LCCOMB_X14_Y17_N16
\Selector186~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector186~0_combout\ = (\current_state.exec_state~regout\ & ((D(53)))) # (!\current_state.exec_state~regout\ & (\A~combout\(55)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(55),
	datac => D(53),
	datad => \current_state.exec_state~regout\,
	combout => \Selector186~0_combout\);

-- Location: LCFF_X18_Y18_N9
\D[52]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(52),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(52));

-- Location: LCCOMB_X19_Y18_N22
\Selector185~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector185~0_combout\ = (\current_state.exec_state~regout\ & ((D(52)))) # (!\current_state.exec_state~regout\ & (\A~combout\(54)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(54),
	datac => \current_state.exec_state~regout\,
	datad => D(52),
	combout => \Selector185~0_combout\);

-- Location: LCFF_X14_Y17_N19
\D[51]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(51),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(51));

-- Location: LCCOMB_X14_Y17_N20
\Selector184~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector184~0_combout\ = (\current_state.exec_state~regout\ & ((D(51)))) # (!\current_state.exec_state~regout\ & (\A~combout\(53)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(53),
	datac => \current_state.exec_state~regout\,
	datad => D(51),
	combout => \Selector184~0_combout\);

-- Location: LCFF_X18_Y18_N3
\D[50]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(50),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(50));

-- Location: LCCOMB_X18_Y18_N0
\Selector183~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector183~0_combout\ = (\current_state.exec_state~regout\ & ((D(50)))) # (!\current_state.exec_state~regout\ & (\A~combout\(52)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(52),
	datac => \current_state.exec_state~regout\,
	datad => D(50),
	combout => \Selector183~0_combout\);

-- Location: LCFF_X14_Y17_N11
\D[49]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(49),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(49));

-- Location: LCCOMB_X14_Y17_N8
\Selector182~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector182~0_combout\ = (\current_state.exec_state~regout\ & ((D(49)))) # (!\current_state.exec_state~regout\ & (\A~combout\(51)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(51),
	datac => \current_state.exec_state~regout\,
	datad => D(49),
	combout => \Selector182~0_combout\);

-- Location: LCFF_X18_Y18_N31
\D[48]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(48),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(48));

-- Location: LCCOMB_X18_Y18_N12
\Selector181~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector181~0_combout\ = (\current_state.exec_state~regout\ & ((D(48)))) # (!\current_state.exec_state~regout\ & (\A~combout\(50)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(50),
	datac => \current_state.exec_state~regout\,
	datad => D(48),
	combout => \Selector181~0_combout\);

-- Location: LCFF_X13_Y15_N25
\D[47]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(47),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(47));

-- Location: LCCOMB_X14_Y17_N6
\Selector180~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector180~0_combout\ = (\current_state.exec_state~regout\ & ((D(47)))) # (!\current_state.exec_state~regout\ & (\A~combout\(49)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(49),
	datac => \current_state.exec_state~regout\,
	datad => D(47),
	combout => \Selector180~0_combout\);

-- Location: LCFF_X18_Y18_N19
\D[46]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(46),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(46));

-- Location: LCCOMB_X18_Y18_N16
\Selector179~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector179~0_combout\ = (\current_state.exec_state~regout\ & ((D(46)))) # (!\current_state.exec_state~regout\ & (\A~combout\(48)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(48),
	datac => \current_state.exec_state~regout\,
	datad => D(46),
	combout => \Selector179~0_combout\);

-- Location: LCFF_X13_Y15_N19
\D[45]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(45),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(45));

-- Location: LCCOMB_X13_Y15_N12
\Selector178~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector178~0_combout\ = (\current_state.exec_state~regout\ & ((D(45)))) # (!\current_state.exec_state~regout\ & (\A~combout\(47)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(47),
	datac => \current_state.exec_state~regout\,
	datad => D(45),
	combout => \Selector178~0_combout\);

-- Location: LCFF_X18_Y18_N15
\D[44]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(44),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(44));

-- Location: LCCOMB_X18_Y18_N4
\Selector177~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector177~0_combout\ = (\current_state.exec_state~regout\ & ((D(44)))) # (!\current_state.exec_state~regout\ & (\A~combout\(46)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(46),
	datac => \current_state.exec_state~regout\,
	datad => D(44),
	combout => \Selector177~0_combout\);

-- Location: LCFF_X13_Y15_N27
\D[43]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(43),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(43));

-- Location: LCCOMB_X13_Y15_N16
\Selector176~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector176~0_combout\ = (\current_state.exec_state~regout\ & ((D(43)))) # (!\current_state.exec_state~regout\ & (\A~combout\(45)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(45),
	datac => \current_state.exec_state~regout\,
	datad => D(43),
	combout => \Selector176~0_combout\);

-- Location: LCFF_X18_Y18_N11
\D[42]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(42),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(42));

-- Location: LCCOMB_X18_Y18_N24
\Selector175~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector175~0_combout\ = (\current_state.exec_state~regout\ & ((D(42)))) # (!\current_state.exec_state~regout\ & (\A~combout\(44)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(44),
	datac => \current_state.exec_state~regout\,
	datad => D(42),
	combout => \Selector175~0_combout\);

-- Location: LCFF_X13_Y15_N23
\D[41]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(41),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(41));

-- Location: LCCOMB_X13_Y15_N4
\Selector174~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector174~0_combout\ = (\current_state.exec_state~regout\ & ((D(41)))) # (!\current_state.exec_state~regout\ & (\A~combout\(43)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(43),
	datac => \current_state.exec_state~regout\,
	datad => D(41),
	combout => \Selector174~0_combout\);

-- Location: LCFF_X18_Y18_N7
\D[40]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(40),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(40));

-- Location: LCCOMB_X18_Y18_N28
\Selector173~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector173~0_combout\ = (\current_state.exec_state~regout\ & ((D(40)))) # (!\current_state.exec_state~regout\ & (\A~combout\(42)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(42),
	datac => \current_state.exec_state~regout\,
	datad => D(40),
	combout => \Selector173~0_combout\);

-- Location: LCFF_X13_Y15_N31
\D[39]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(39),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(39));

-- Location: LCCOMB_X13_Y15_N8
\Selector172~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector172~0_combout\ = (\current_state.exec_state~regout\ & ((D(39)))) # (!\current_state.exec_state~regout\ & (\A~combout\(41)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(41),
	datac => \current_state.exec_state~regout\,
	datad => D(39),
	combout => \Selector172~0_combout\);

-- Location: LCFF_X18_Y18_N27
\D[38]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(38),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(38));

-- Location: LCCOMB_X18_Y18_N20
\Selector171~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector171~0_combout\ = (\current_state.exec_state~regout\ & ((D(38)))) # (!\current_state.exec_state~regout\ & (\A~combout\(40)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(40),
	datac => \current_state.exec_state~regout\,
	datad => D(38),
	combout => \Selector171~0_combout\);

-- Location: LCFF_X13_Y15_N11
\D[37]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(37),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(37));

-- Location: LCCOMB_X13_Y15_N28
\Selector170~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector170~0_combout\ = (\current_state.exec_state~regout\ & ((D(37)))) # (!\current_state.exec_state~regout\ & (\A~combout\(39)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(39),
	datac => \current_state.exec_state~regout\,
	datad => D(37),
	combout => \Selector170~0_combout\);

-- Location: LCFF_X15_Y18_N25
\D[36]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(36),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(36));

-- Location: LCCOMB_X18_Y18_N22
\Selector169~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector169~0_combout\ = (\current_state.exec_state~regout\ & ((D(36)))) # (!\current_state.exec_state~regout\ & (\A~combout\(38)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(38),
	datac => \current_state.exec_state~regout\,
	datad => D(36),
	combout => \Selector169~0_combout\);

-- Location: LCFF_X13_Y15_N15
\D[35]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(35),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(35));

-- Location: LCCOMB_X13_Y15_N0
\Selector168~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector168~0_combout\ = (\current_state.exec_state~regout\ & ((D(35)))) # (!\current_state.exec_state~regout\ & (\A~combout\(37)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(37),
	datac => \current_state.exec_state~regout\,
	datad => D(35),
	combout => \Selector168~0_combout\);

-- Location: LCFF_X15_Y18_N31
\D[34]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(34),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(34));

-- Location: LCCOMB_X15_Y18_N28
\Selector167~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector167~0_combout\ = (\current_state.exec_state~regout\ & ((D(34)))) # (!\current_state.exec_state~regout\ & (\A~combout\(36)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(36),
	datac => \current_state.exec_state~regout\,
	datad => D(34),
	combout => \Selector167~0_combout\);

-- Location: LCFF_X13_Y15_N7
\D[33]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(33),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(33));

-- Location: LCCOMB_X13_Y15_N20
\Selector166~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector166~0_combout\ = (\current_state.exec_state~regout\ & ((D(33)))) # (!\current_state.exec_state~regout\ & (\A~combout\(35)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(35),
	datac => \current_state.exec_state~regout\,
	datad => D(33),
	combout => \Selector166~0_combout\);

-- Location: LCFF_X15_Y18_N7
\D[32]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(32),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(32));

-- Location: LCCOMB_X15_Y18_N4
\Selector165~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector165~0_combout\ = (\current_state.exec_state~regout\ & ((D(32)))) # (!\current_state.exec_state~regout\ & (\A~combout\(34)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(34),
	datac => \current_state.exec_state~regout\,
	datad => D(32),
	combout => \Selector165~0_combout\);

-- Location: LCFF_X12_Y15_N9
\D[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(31),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(31));

-- Location: LCCOMB_X13_Y15_N2
\Selector164~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector164~0_combout\ = (\current_state.exec_state~regout\ & ((D(31)))) # (!\current_state.exec_state~regout\ & (\A~combout\(33)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(33),
	datac => \current_state.exec_state~regout\,
	datad => D(31),
	combout => \Selector164~0_combout\);

-- Location: LCFF_X15_Y18_N19
\D[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(30),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(30));

-- Location: LCCOMB_X15_Y18_N8
\Selector163~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector163~0_combout\ = (\current_state.exec_state~regout\ & ((D(30)))) # (!\current_state.exec_state~regout\ & (\A~combout\(32)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(32),
	datac => \current_state.exec_state~regout\,
	datad => D(30),
	combout => \Selector163~0_combout\);

-- Location: LCFF_X12_Y15_N23
\D[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(29),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(29));

-- Location: LCCOMB_X12_Y15_N28
\Selector162~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector162~0_combout\ = (\current_state.exec_state~regout\ & ((D(29)))) # (!\current_state.exec_state~regout\ & (\A~combout\(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(31),
	datac => \current_state.exec_state~regout\,
	datad => D(29),
	combout => \Selector162~0_combout\);

-- Location: LCFF_X15_Y18_N11
\D[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(28),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(28));

-- Location: LCCOMB_X15_Y18_N0
\Selector161~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector161~0_combout\ = (\current_state.exec_state~regout\ & ((D(28)))) # (!\current_state.exec_state~regout\ & (\A~combout\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(30),
	datac => \current_state.exec_state~regout\,
	datad => D(28),
	combout => \Selector161~0_combout\);

-- Location: LCFF_X12_Y15_N19
\D[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(27),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(27));

-- Location: LCCOMB_X12_Y15_N0
\Selector160~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector160~0_combout\ = (\current_state.exec_state~regout\ & ((D(27)))) # (!\current_state.exec_state~regout\ & (\A~combout\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(29),
	datac => \current_state.exec_state~regout\,
	datad => D(27),
	combout => \Selector160~0_combout\);

-- Location: LCFF_X15_Y18_N27
\D[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(26),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(26));

-- Location: LCCOMB_X15_Y18_N12
\Selector159~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector159~0_combout\ = (\current_state.exec_state~regout\ & ((D(26)))) # (!\current_state.exec_state~regout\ & (\A~combout\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(28),
	datac => \current_state.exec_state~regout\,
	datad => D(26),
	combout => \Selector159~0_combout\);

-- Location: LCFF_X12_Y15_N27
\D[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(25),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(25));

-- Location: LCCOMB_X12_Y15_N20
\Selector158~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector158~0_combout\ = (\current_state.exec_state~regout\ & ((D(25)))) # (!\current_state.exec_state~regout\ & (\A~combout\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(27),
	datac => \current_state.exec_state~regout\,
	datad => D(25),
	combout => \Selector158~0_combout\);

-- Location: LCFF_X15_Y18_N15
\D[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(24),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(24));

-- Location: LCCOMB_X15_Y18_N20
\Selector157~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector157~0_combout\ = (\current_state.exec_state~regout\ & ((D(24)))) # (!\current_state.exec_state~regout\ & (\A~combout\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(26),
	datac => D(24),
	datad => \current_state.exec_state~regout\,
	combout => \Selector157~0_combout\);

-- Location: LCFF_X12_Y15_N7
\D[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(23),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(23));

-- Location: LCCOMB_X12_Y15_N12
\Selector156~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector156~0_combout\ = (\current_state.exec_state~regout\ & ((D(23)))) # (!\current_state.exec_state~regout\ & (\A~combout\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(25),
	datac => \current_state.exec_state~regout\,
	datad => D(23),
	combout => \Selector156~0_combout\);

-- Location: LCFF_X15_Y18_N23
\D[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(22),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(22));

-- Location: LCCOMB_X15_Y18_N16
\Selector155~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector155~0_combout\ = (\current_state.exec_state~regout\ & ((D(22)))) # (!\current_state.exec_state~regout\ & (\A~combout\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(24),
	datac => \current_state.exec_state~regout\,
	datad => D(22),
	combout => \Selector155~0_combout\);

-- Location: LCFF_X12_Y15_N31
\D[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(21),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(21));

-- Location: LCCOMB_X12_Y15_N4
\Selector154~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector154~0_combout\ = (\current_state.exec_state~regout\ & ((D(21)))) # (!\current_state.exec_state~regout\ & (\A~combout\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(23),
	datac => \current_state.exec_state~regout\,
	datad => D(21),
	combout => \Selector154~0_combout\);

-- Location: LCFF_X19_Y18_N21
\D[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(20),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(20));

-- Location: LCCOMB_X15_Y18_N2
\Selector153~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector153~0_combout\ = (\current_state.exec_state~regout\ & ((D(20)))) # (!\current_state.exec_state~regout\ & (\A~combout\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(22),
	datac => \current_state.exec_state~regout\,
	datad => D(20),
	combout => \Selector153~0_combout\);

-- Location: LCFF_X12_Y15_N3
\D[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(19),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(19));

-- Location: LCCOMB_X12_Y15_N16
\Selector152~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector152~0_combout\ = (\current_state.exec_state~regout\ & ((D(19)))) # (!\current_state.exec_state~regout\ & (\A~combout\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(21),
	datac => \current_state.exec_state~regout\,
	datad => D(19),
	combout => \Selector152~0_combout\);

-- Location: LCFF_X19_Y18_N3
\D[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(18),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(18));

-- Location: LCCOMB_X19_Y18_N24
\Selector151~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector151~0_combout\ = (\current_state.exec_state~regout\ & ((D(18)))) # (!\current_state.exec_state~regout\ & (\A~combout\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(20),
	datac => \current_state.exec_state~regout\,
	datad => D(18),
	combout => \Selector151~0_combout\);

-- Location: LCFF_X12_Y15_N15
\D[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(17),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(17));

-- Location: LCCOMB_X12_Y15_N24
\Selector150~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector150~0_combout\ = (\current_state.exec_state~regout\ & ((D(17)))) # (!\current_state.exec_state~regout\ & (\A~combout\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(19),
	datac => \current_state.exec_state~regout\,
	datad => D(17),
	combout => \Selector150~0_combout\);

-- Location: LCFF_X19_Y18_N15
\D[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(16),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(16));

-- Location: LCCOMB_X19_Y18_N12
\Selector149~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector149~0_combout\ = (\current_state.exec_state~regout\ & ((D(16)))) # (!\current_state.exec_state~regout\ & (\A~combout\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datab => \A~combout\(18),
	datac => D(16),
	combout => \Selector149~0_combout\);

-- Location: LCFF_X11_Y15_N9
\D[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(15),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(15));

-- Location: LCCOMB_X12_Y15_N10
\Selector148~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector148~0_combout\ = (\current_state.exec_state~regout\ & ((D(15)))) # (!\current_state.exec_state~regout\ & (\A~combout\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(17),
	datac => \current_state.exec_state~regout\,
	datad => D(15),
	combout => \Selector148~0_combout\);

-- Location: LCFF_X20_Y18_N5
\D[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(14),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(14));

-- Location: LCCOMB_X19_Y18_N10
\Selector147~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector147~0_combout\ = (\current_state.exec_state~regout\ & ((D(14)))) # (!\current_state.exec_state~regout\ & (\A~combout\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(16),
	datac => \current_state.exec_state~regout\,
	datad => D(14),
	combout => \Selector147~0_combout\);

-- Location: LCFF_X11_Y15_N7
\D[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(13),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(13));

-- Location: LCCOMB_X11_Y15_N28
\Selector146~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector146~0_combout\ = (\current_state.exec_state~regout\ & ((D(13)))) # (!\current_state.exec_state~regout\ & (\A~combout\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(15),
	datac => \current_state.exec_state~regout\,
	datad => D(13),
	combout => \Selector146~0_combout\);

-- Location: LCFF_X20_Y18_N19
\D[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(12),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(12));

-- Location: LCCOMB_X20_Y18_N28
\Selector145~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector145~0_combout\ = (\current_state.exec_state~regout\ & ((D(12)))) # (!\current_state.exec_state~regout\ & (\A~combout\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(14),
	datac => \current_state.exec_state~regout\,
	datad => D(12),
	combout => \Selector145~0_combout\);

-- Location: LCFF_X11_Y15_N3
\D[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(11),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(11));

-- Location: LCCOMB_X11_Y15_N0
\Selector144~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector144~0_combout\ = (\current_state.exec_state~regout\ & ((D(11)))) # (!\current_state.exec_state~regout\ & (\A~combout\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(13),
	datac => \current_state.exec_state~regout\,
	datad => D(11),
	combout => \Selector144~0_combout\);

-- Location: LCFF_X20_Y18_N7
\D[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(10),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(10));

-- Location: LCCOMB_X20_Y18_N12
\Selector143~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector143~0_combout\ = (\current_state.exec_state~regout\ & ((D(10)))) # (!\current_state.exec_state~regout\ & (\A~combout\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(12),
	datac => \current_state.exec_state~regout\,
	datad => D(10),
	combout => \Selector143~0_combout\);

-- Location: LCFF_X11_Y15_N23
\D[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(9),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(9));

-- Location: LCCOMB_X11_Y15_N20
\Selector142~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector142~0_combout\ = (\current_state.exec_state~regout\ & ((D(9)))) # (!\current_state.exec_state~regout\ & (\A~combout\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(11),
	datac => \current_state.exec_state~regout\,
	datad => D(9),
	combout => \Selector142~0_combout\);

-- Location: LCFF_X20_Y18_N11
\D[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(8),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(8));

-- Location: LCCOMB_X20_Y18_N24
\Selector141~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector141~0_combout\ = (\current_state.exec_state~regout\ & ((D(8)))) # (!\current_state.exec_state~regout\ & (\A~combout\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(10),
	datac => \current_state.exec_state~regout\,
	datad => D(8),
	combout => \Selector141~0_combout\);

-- Location: LCFF_X11_Y15_N31
\D[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(7),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(7));

-- Location: LCCOMB_X11_Y15_N12
\Selector140~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector140~0_combout\ = (\current_state.exec_state~regout\ & ((D(7)))) # (!\current_state.exec_state~regout\ & (\A~combout\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(9),
	datac => \current_state.exec_state~regout\,
	datad => D(7),
	combout => \Selector140~0_combout\);

-- Location: LCFF_X20_Y18_N23
\D[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(6),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(6));

-- Location: LCCOMB_X20_Y18_N20
\Selector139~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector139~0_combout\ = (\current_state.exec_state~regout\ & ((D(6)))) # (!\current_state.exec_state~regout\ & (\A~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(8),
	datac => \current_state.exec_state~regout\,
	datad => D(6),
	combout => \Selector139~0_combout\);

-- Location: LCFF_X11_Y15_N15
\D[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(5),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(5));

-- Location: LCCOMB_X11_Y15_N24
\Selector138~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector138~0_combout\ = (\current_state.exec_state~regout\ & ((D(5)))) # (!\current_state.exec_state~regout\ & (\A~combout\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(7),
	datac => \current_state.exec_state~regout\,
	datad => D(5),
	combout => \Selector138~0_combout\);

-- Location: LCFF_X20_Y18_N3
\D[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(4),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(4));

-- Location: LCCOMB_X20_Y18_N8
\Selector137~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector137~0_combout\ = (\current_state.exec_state~regout\ & ((D(4)))) # (!\current_state.exec_state~regout\ & (\A~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(6),
	datac => \current_state.exec_state~regout\,
	datad => D(4),
	combout => \Selector137~0_combout\);

-- Location: LCFF_X11_Y15_N27
\D[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(3),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(3));

-- Location: LCCOMB_X11_Y15_N4
\Selector136~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector136~0_combout\ = (\current_state.exec_state~regout\ & ((D(3)))) # (!\current_state.exec_state~regout\ & (\A~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(5),
	datac => \current_state.exec_state~regout\,
	datad => D(3),
	combout => \Selector136~0_combout\);

-- Location: LCFF_X20_Y18_N27
\D[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(2),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(2));

-- Location: LCCOMB_X20_Y18_N0
\Selector135~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector135~0_combout\ = (\current_state.exec_state~regout\ & ((D(2)))) # (!\current_state.exec_state~regout\ & (\A~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(4),
	datac => \current_state.exec_state~regout\,
	datad => D(2),
	combout => \Selector135~0_combout\);

-- Location: LCFF_X11_Y15_N19
\D[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(1),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(1));

-- Location: LCCOMB_X11_Y15_N16
\Selector134~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector134~0_combout\ = (\current_state.exec_state~regout\ & ((D(1)))) # (!\current_state.exec_state~regout\ & (\A~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(3),
	datac => \current_state.exec_state~regout\,
	datad => D(1),
	combout => \Selector134~0_combout\);

-- Location: LCFF_X20_Y18_N31
\D[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Din(0),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => D(0));

-- Location: LCCOMB_X20_Y18_N16
\Selector133~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector133~0_combout\ = (\current_state.exec_state~regout\ & ((D(0)))) # (!\current_state.exec_state~regout\ & (\A~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(2),
	datac => \current_state.exec_state~regout\,
	datad => D(0),
	combout => \Selector133~0_combout\);

-- Location: LCCOMB_X11_Y15_N10
\Selector132~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector132~0_combout\ = (\A~combout\(1) & !\current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(1),
	datac => \current_state.exec_state~regout\,
	combout => \Selector132~0_combout\);

-- Location: LCCOMB_X20_Y18_N14
\Selector131~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector131~0_combout\ = (\A~combout\(0) & !\current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A~combout\(0),
	datad => \current_state.exec_state~regout\,
	combout => \Selector131~0_combout\);

-- Location: LCCOMB_X24_Y14_N28
\sqrt_sequential:Rvar[56]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[56]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[56]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector123~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[56]~combout\,
	datac => \Selector123~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[56]~combout\);

-- Location: LCCOMB_X21_Y14_N12
\sqrt_sequential:Rvar[52]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[52]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[52]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector119~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[52]~combout\,
	datac => \Selector119~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[52]~combout\);

-- Location: LCCOMB_X21_Y16_N2
\sqrt_sequential:Rvar[22]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[22]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[22]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector89~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[22]~combout\,
	datac => \Selector89~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[22]~combout\);

-- Location: LCCOMB_X21_Y16_N28
\sqrt_sequential:Rvar[21]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[21]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[21]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector88~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[21]~combout\,
	datac => \Selector88~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[21]~combout\);

-- Location: LCCOMB_X24_Y16_N28
\sqrt_sequential:Rvar[18]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[18]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[18]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector85~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[18]~combout\,
	datac => \Selector85~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[18]~combout\);

-- Location: LCCOMB_X21_Y16_N0
\sqrt_sequential:Rvar[16]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[16]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[16]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector83~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[16]~combout\,
	datac => \Selector83~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[16]~combout\);

-- Location: LCCOMB_X18_Y14_N18
\sqrt_sequential:Rvar[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[8]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[8]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector75~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector75~0_combout\,
	datac => \sqrt_sequential:Rvar[8]~combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[8]~combout\);

-- Location: LCCOMB_X24_Y16_N2
\sqrt_sequential:Rvar[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[0]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[0]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector67~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector67~0_combout\,
	datab => \sqrt_sequential:Rvar[0]~combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[0]~combout\);

-- Location: LCCOMB_X14_Y17_N24
\Din[63]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(63) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(63))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector194~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(63),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector194~0_combout\,
	combout => Din(63));

-- Location: LCCOMB_X19_Y18_N16
\Din[62]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(62) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(62))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector193~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(62),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector193~0_combout\,
	combout => Din(62));

-- Location: LCCOMB_X14_Y15_N14
\CNTin[31]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(31) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(31))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~64_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(31),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Add4~64_combout\,
	combout => CNTin(31));

-- Location: LCCOMB_X14_Y15_N0
\CNTin[27]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(27) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(27))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~68_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(27),
	datab => \current_state.end_state~clkctrl_outclk\,
	datac => \Add4~68_combout\,
	combout => CNTin(27));

-- Location: LCCOMB_X14_Y15_N20
\CNTin[24]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(24) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(24))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~71_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(24),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Add4~71_combout\,
	combout => CNTin(24));

-- Location: LCCOMB_X18_Y15_N12
\CNTin[21]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(21) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(21))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~74_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(21),
	datac => \Add4~74_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(21));

-- Location: LCCOMB_X16_Y15_N10
\CNTin[19]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(19) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(19)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~76_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~76_combout\,
	datac => CNTin(19),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(19));

-- Location: LCCOMB_X14_Y16_N30
\CNTin[9]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(9) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(9)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~86_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~86_combout\,
	datac => CNTin(9),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(9));

-- Location: LCCOMB_X14_Y17_N26
\Din[61]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(61) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(61))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector192~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(61),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector192~0_combout\,
	combout => Din(61));

-- Location: LCCOMB_X19_Y18_N18
\Din[60]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(60) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(60))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector191~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(60),
	datac => \Selector191~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(60));

-- Location: LCCOMB_X14_Y17_N22
\Din[59]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(59) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(59))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector190~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(59),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector190~0_combout\,
	combout => Din(59));

-- Location: LCCOMB_X19_Y18_N26
\Din[58]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(58) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(58))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector189~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(58),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector189~0_combout\,
	combout => Din(58));

-- Location: LCCOMB_X14_Y17_N30
\Din[57]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(57) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(57))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector188~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(57),
	datac => \Selector188~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(57));

-- Location: LCCOMB_X19_Y18_N6
\Din[56]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(56) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(56))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector187~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(56),
	datac => \Selector187~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(56));

-- Location: LCCOMB_X14_Y17_N2
\Din[55]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(55) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(55))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector186~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(55),
	datac => \Selector186~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(55));

-- Location: LCCOMB_X19_Y18_N30
\Din[54]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(54) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(54))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector185~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(54),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector185~0_combout\,
	combout => Din(54));

-- Location: LCCOMB_X14_Y17_N14
\Din[53]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(53) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(53))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector184~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(53),
	datac => \Selector184~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(53));

-- Location: LCCOMB_X18_Y18_N8
\Din[52]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(52) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(52))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector183~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(52),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector183~0_combout\,
	combout => Din(52));

-- Location: LCCOMB_X14_Y17_N18
\Din[51]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(51) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(51))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector182~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(51),
	datac => \Selector182~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(51));

-- Location: LCCOMB_X18_Y18_N2
\Din[50]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(50) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(50))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector181~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(50),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector181~0_combout\,
	combout => Din(50));

-- Location: LCCOMB_X14_Y17_N10
\Din[49]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(49) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(49))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector180~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(49),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector180~0_combout\,
	combout => Din(49));

-- Location: LCCOMB_X18_Y18_N30
\Din[48]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(48) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(48))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector179~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(48),
	datac => \Selector179~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(48));

-- Location: LCCOMB_X13_Y15_N24
\Din[47]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(47) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(47))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector178~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(47),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector178~0_combout\,
	combout => Din(47));

-- Location: LCCOMB_X18_Y18_N18
\Din[46]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(46) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(46))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector177~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(46),
	datac => \Selector177~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(46));

-- Location: LCCOMB_X13_Y15_N18
\Din[45]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(45) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(45))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector176~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(45),
	datac => \Selector176~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(45));

-- Location: LCCOMB_X18_Y18_N14
\Din[44]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(44) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(44))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector175~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(44),
	datac => \Selector175~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(44));

-- Location: LCCOMB_X13_Y15_N26
\Din[43]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(43) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(43))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector174~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(43),
	datac => \Selector174~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(43));

-- Location: LCCOMB_X18_Y18_N10
\Din[42]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(42) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(42))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector173~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(42),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector173~0_combout\,
	combout => Din(42));

-- Location: LCCOMB_X13_Y15_N22
\Din[41]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(41) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(41))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector172~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(41),
	datac => \Selector172~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(41));

-- Location: LCCOMB_X18_Y18_N6
\Din[40]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(40) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(40))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector171~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(40),
	datac => \Selector171~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(40));

-- Location: LCCOMB_X13_Y15_N30
\Din[39]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(39) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(39))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector170~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(39),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector170~0_combout\,
	combout => Din(39));

-- Location: LCCOMB_X18_Y18_N26
\Din[38]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(38) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(38))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector169~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(38),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector169~0_combout\,
	combout => Din(38));

-- Location: LCCOMB_X13_Y15_N10
\Din[37]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(37) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(37))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector168~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(37),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector168~0_combout\,
	combout => Din(37));

-- Location: LCCOMB_X15_Y18_N24
\Din[36]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(36) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(36))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector167~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(36),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector167~0_combout\,
	combout => Din(36));

-- Location: LCCOMB_X13_Y15_N14
\Din[35]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(35) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(35))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector166~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(35),
	datac => \Selector166~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(35));

-- Location: LCCOMB_X15_Y18_N30
\Din[34]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(34) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(34))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector165~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(34),
	datac => \Selector165~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(34));

-- Location: LCCOMB_X13_Y15_N6
\Din[33]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(33) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(33))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector164~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(33),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector164~0_combout\,
	combout => Din(33));

-- Location: LCCOMB_X15_Y18_N6
\Din[32]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(32) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(32))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector163~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(32),
	datac => \Selector163~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(32));

-- Location: LCCOMB_X12_Y15_N8
\Din[31]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(31) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(31))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector162~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(31),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector162~0_combout\,
	combout => Din(31));

-- Location: LCCOMB_X15_Y18_N18
\Din[30]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(30) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(30))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector161~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(30),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector161~0_combout\,
	combout => Din(30));

-- Location: LCCOMB_X12_Y15_N22
\Din[29]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(29) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(29))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector160~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(29),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector160~0_combout\,
	combout => Din(29));

-- Location: LCCOMB_X15_Y18_N10
\Din[28]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(28) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(28))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector159~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(28),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector159~0_combout\,
	combout => Din(28));

-- Location: LCCOMB_X12_Y15_N18
\Din[27]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(27) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(27))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector158~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(27),
	datac => \Selector158~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(27));

-- Location: LCCOMB_X15_Y18_N26
\Din[26]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(26) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(26))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector157~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(26),
	datac => \Selector157~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(26));

-- Location: LCCOMB_X12_Y15_N26
\Din[25]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(25) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(25))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector156~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(25),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector156~0_combout\,
	combout => Din(25));

-- Location: LCCOMB_X15_Y18_N14
\Din[24]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(24) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(24))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector155~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(24),
	datac => \Selector155~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(24));

-- Location: LCCOMB_X12_Y15_N6
\Din[23]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(23) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(23))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector154~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(23),
	datac => \Selector154~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(23));

-- Location: LCCOMB_X15_Y18_N22
\Din[22]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(22) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(22))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector153~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(22),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector153~0_combout\,
	combout => Din(22));

-- Location: LCCOMB_X12_Y15_N30
\Din[21]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(21) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(21))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector152~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(21),
	datac => \Selector152~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(21));

-- Location: LCCOMB_X19_Y18_N20
\Din[20]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(20) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(20))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector151~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(20),
	datac => \Selector151~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(20));

-- Location: LCCOMB_X12_Y15_N2
\Din[19]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(19) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(19))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector150~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(19),
	datac => \Selector150~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(19));

-- Location: LCCOMB_X19_Y18_N2
\Din[18]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(18) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(18))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector149~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(18),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector149~0_combout\,
	combout => Din(18));

-- Location: LCCOMB_X12_Y15_N14
\Din[17]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(17) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(17))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector148~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(17),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector148~0_combout\,
	combout => Din(17));

-- Location: LCCOMB_X19_Y18_N14
\Din[16]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(16) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(16))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector147~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(16),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector147~0_combout\,
	combout => Din(16));

-- Location: LCCOMB_X11_Y15_N8
\Din[15]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(15) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(15))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector146~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(15),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector146~0_combout\,
	combout => Din(15));

-- Location: LCCOMB_X20_Y18_N4
\Din[14]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(14) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(14))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector145~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(14),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector145~0_combout\,
	combout => Din(14));

-- Location: LCCOMB_X11_Y15_N6
\Din[13]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(13) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(13))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector144~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(13),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector144~0_combout\,
	combout => Din(13));

-- Location: LCCOMB_X20_Y18_N18
\Din[12]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(12) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(12))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector143~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(12),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector143~0_combout\,
	combout => Din(12));

-- Location: LCCOMB_X11_Y15_N2
\Din[11]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(11) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(11))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector142~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(11),
	datac => \Selector142~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(11));

-- Location: LCCOMB_X20_Y18_N6
\Din[10]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(10) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(10))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector141~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(10),
	datac => \Selector141~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(10));

-- Location: LCCOMB_X11_Y15_N22
\Din[9]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(9) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(9))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector140~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(9),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector140~0_combout\,
	combout => Din(9));

-- Location: LCCOMB_X20_Y18_N10
\Din[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(8) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(8))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector139~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(8),
	datac => \Selector139~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(8));

-- Location: LCCOMB_X11_Y15_N30
\Din[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(7) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(7))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector138~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(7),
	datac => \Selector138~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(7));

-- Location: LCCOMB_X20_Y18_N22
\Din[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(6) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(6))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector137~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(6),
	datac => \Selector137~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(6));

-- Location: LCCOMB_X11_Y15_N14
\Din[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(5) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(5))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector136~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Din(5),
	datac => \Selector136~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(5));

-- Location: LCCOMB_X20_Y18_N2
\Din[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(4) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(4))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector135~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(4),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector135~0_combout\,
	combout => Din(4));

-- Location: LCCOMB_X11_Y15_N26
\Din[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(3) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(3))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector134~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(3),
	datac => \Selector134~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(3));

-- Location: LCCOMB_X20_Y18_N26
\Din[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(2) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Din(2))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector133~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Din(2),
	datac => \Selector133~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(2));

-- Location: LCCOMB_X11_Y15_N18
\Din[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(1) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Din(1)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector132~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector132~0_combout\,
	datac => Din(1),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(1));

-- Location: LCCOMB_X20_Y18_N30
\Din[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- Din(0) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Din(0)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector131~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector131~0_combout\,
	datac => Din(0),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Din(0));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[63]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(63),
	combout => \A~combout\(63));

-- Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[62]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(62),
	combout => \A~combout\(62));

-- Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[61]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(61),
	combout => \A~combout\(61));

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[60]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(60),
	combout => \A~combout\(60));

-- Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[59]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(59),
	combout => \A~combout\(59));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[58]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(58),
	combout => \A~combout\(58));

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[57]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(57),
	combout => \A~combout\(57));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[56]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(56),
	combout => \A~combout\(56));

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[55]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(55),
	combout => \A~combout\(55));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[54]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(54),
	combout => \A~combout\(54));

-- Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[53]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(53),
	combout => \A~combout\(53));

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[52]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(52),
	combout => \A~combout\(52));

-- Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[51]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(51),
	combout => \A~combout\(51));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[50]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(50),
	combout => \A~combout\(50));

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[49]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(49),
	combout => \A~combout\(49));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[48]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(48),
	combout => \A~combout\(48));

-- Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[47]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(47),
	combout => \A~combout\(47));

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[46]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(46),
	combout => \A~combout\(46));

-- Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[45]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(45),
	combout => \A~combout\(45));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[44]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(44),
	combout => \A~combout\(44));

-- Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[43]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(43),
	combout => \A~combout\(43));

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[42]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(42),
	combout => \A~combout\(42));

-- Location: PIN_N7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[41]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(41),
	combout => \A~combout\(41));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[40]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(40),
	combout => \A~combout\(40));

-- Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[39]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(39),
	combout => \A~combout\(39));

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[38]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(38),
	combout => \A~combout\(38));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[37]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(37),
	combout => \A~combout\(37));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[36]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(36),
	combout => \A~combout\(36));

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[35]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(35),
	combout => \A~combout\(35));

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[34]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(34),
	combout => \A~combout\(34));

-- Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[33]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(33),
	combout => \A~combout\(33));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[32]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(32),
	combout => \A~combout\(32));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(31),
	combout => \A~combout\(31));

-- Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(30),
	combout => \A~combout\(30));

-- Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(29),
	combout => \A~combout\(29));

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(28),
	combout => \A~combout\(28));

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(27),
	combout => \A~combout\(27));

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(26),
	combout => \A~combout\(26));

-- Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(25),
	combout => \A~combout\(25));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(24),
	combout => \A~combout\(24));

-- Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(23),
	combout => \A~combout\(23));

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(22),
	combout => \A~combout\(22));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(21),
	combout => \A~combout\(21));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(20),
	combout => \A~combout\(20));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(19),
	combout => \A~combout\(19));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(18),
	combout => \A~combout\(18));

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(17),
	combout => \A~combout\(17));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(16),
	combout => \A~combout\(16));

-- Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(15),
	combout => \A~combout\(15));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(14),
	combout => \A~combout\(14));

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(13),
	combout => \A~combout\(13));

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(12),
	combout => \A~combout\(12));

-- Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(11),
	combout => \A~combout\(11));

-- Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(10),
	combout => \A~combout\(10));

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(9),
	combout => \A~combout\(9));

-- Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(8),
	combout => \A~combout\(8));

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(7),
	combout => \A~combout\(7));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(6),
	combout => \A~combout\(6));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(5),
	combout => \A~combout\(5));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(4),
	combout => \A~combout\(4));

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(3),
	combout => \A~combout\(3));

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(2),
	combout => \A~combout\(2));

-- Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(1),
	combout => \A~combout\(1));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(0),
	combout => \A~combout\(0));

-- Location: CLKCTRL_G3
\CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~clkctrl_outclk\);

-- Location: LCCOMB_X18_Y15_N22
\CNT[21]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CNT[21]~feeder_combout\ = CNTin(21)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => CNTin(21),
	combout => \CNT[21]~feeder_combout\);

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\start~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_start,
	combout => \start~combout\);

-- Location: LCCOMB_X18_Y15_N24
\Selector195~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector195~0_combout\ = (\current_state.exec_state~regout\) # ((\start~combout\ & \current_state.end_state~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datab => \start~combout\,
	datac => \current_state.end_state~regout\,
	combout => \Selector195~0_combout\);

-- Location: LCCOMB_X18_Y15_N14
\Selector198~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector198~0_combout\ = (\current_state.exec_state~regout\) # (\start~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datac => \start~combout\,
	combout => \Selector198~0_combout\);

-- Location: LCCOMB_X18_Y15_N30
\next_state.wait_state_2627\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_state.wait_state_2627~combout\ = (GLOBAL(\Selector196~0clkctrl_outclk\) & ((!\Selector198~0_combout\))) # (!GLOBAL(\Selector196~0clkctrl_outclk\) & (\next_state.wait_state_2627~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \next_state.wait_state_2627~combout\,
	datac => \Selector198~0_combout\,
	datad => \Selector196~0clkctrl_outclk\,
	combout => \next_state.wait_state_2627~combout\);

-- Location: LCCOMB_X18_Y15_N28
\current_state.wait_state~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \current_state.wait_state~0_combout\ = !\next_state.wait_state_2627~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_state.wait_state_2627~combout\,
	combout => \current_state.wait_state~0_combout\);

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RST~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_RST,
	combout => \RST~combout\);

-- Location: CLKCTRL_G2
\RST~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RST~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RST~clkctrl_outclk\);

-- Location: LCFF_X18_Y15_N29
\current_state.wait_state\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \current_state.wait_state~0_combout\,
	aclr => \RST~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state.wait_state~regout\);

-- Location: LCCOMB_X18_Y15_N18
\Selector197~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector197~0_combout\ = (\start~combout\ & !\current_state.wait_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \start~combout\,
	datad => \current_state.wait_state~regout\,
	combout => \Selector197~0_combout\);

-- Location: LCCOMB_X18_Y15_N0
\next_state.exec_state_2618\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_state.exec_state_2618~combout\ = (GLOBAL(\Selector196~0clkctrl_outclk\) & ((\Selector197~0_combout\))) # (!GLOBAL(\Selector196~0clkctrl_outclk\) & (\next_state.exec_state_2618~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \next_state.exec_state_2618~combout\,
	datac => \Selector196~0clkctrl_outclk\,
	datad => \Selector197~0_combout\,
	combout => \next_state.exec_state_2618~combout\);

-- Location: LCFF_X18_Y15_N1
\current_state.exec_state\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \next_state.exec_state_2618~combout\,
	aclr => \RST~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state.exec_state~regout\);

-- Location: LCCOMB_X16_Y15_N2
\CNTin[17]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(17) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(17)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~78_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~78_combout\,
	datac => CNTin(17),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(17));

-- Location: LCFF_X16_Y15_N3
\CNT[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(17),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(17));

-- Location: LCCOMB_X14_Y16_N18
\CNTin[10]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(10) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(10)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~85_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~85_combout\,
	datac => CNTin(10),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(10));

-- Location: LCFF_X14_Y16_N19
\CNT[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(10),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(10));

-- Location: LCCOMB_X14_Y16_N24
\CNTin[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(8) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(8)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~87_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~87_combout\,
	datac => CNTin(8),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(8));

-- Location: LCFF_X14_Y16_N25
\CNT[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(8),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(8));

-- Location: LCCOMB_X15_Y16_N0
\Add4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = CNT(0) $ (VCC)
-- \Add4~1\ = CARRY(CNT(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNT(0),
	datad => VCC,
	combout => \Add4~0_combout\,
	cout => \Add4~1\);

-- Location: LCCOMB_X16_Y17_N4
\Add4~95\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~95_combout\ = (\Add4~0_combout\ & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add4~0_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Add4~95_combout\);

-- Location: LCCOMB_X16_Y17_N16
\CNTin[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(0) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(0))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~95_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(0),
	datac => \Add4~95_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(0));

-- Location: LCFF_X16_Y17_N17
\CNT[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => CNTin(0),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(0));

-- Location: LCCOMB_X15_Y16_N2
\Add4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = (CNT(1) & (!\Add4~1\)) # (!CNT(1) & ((\Add4~1\) # (GND)))
-- \Add4~3\ = CARRY((!\Add4~1\) # (!CNT(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(1),
	datad => VCC,
	cin => \Add4~1\,
	combout => \Add4~2_combout\,
	cout => \Add4~3\);

-- Location: LCCOMB_X18_Y16_N4
\Add4~94\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~94_combout\ = (\Add4~2_combout\ & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add4~2_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Add4~94_combout\);

-- Location: LCCOMB_X18_Y16_N26
\CNTin[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(1) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(1))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~94_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(1),
	datac => \Add4~94_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(1));

-- Location: LCFF_X16_Y16_N1
\CNT[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	sdata => CNTin(1),
	sload => VCC,
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(1));

-- Location: LCCOMB_X15_Y16_N4
\Add4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~4_combout\ = (CNT(2) & (\Add4~3\ $ (GND))) # (!CNT(2) & (!\Add4~3\ & VCC))
-- \Add4~5\ = CARRY((CNT(2) & !\Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(2),
	datad => VCC,
	cin => \Add4~3\,
	combout => \Add4~4_combout\,
	cout => \Add4~5\);

-- Location: LCCOMB_X16_Y16_N0
\Add4~93\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~93_combout\ = (\Add4~4_combout\ & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~4_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Add4~93_combout\);

-- Location: LCCOMB_X16_Y16_N10
\CNTin[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(2) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(2))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~93_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(2),
	datac => \Add4~93_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(2));

-- Location: LCFF_X16_Y16_N11
\CNT[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(2),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(2));

-- Location: LCCOMB_X15_Y16_N6
\Add4~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~6_combout\ = (CNT(3) & (!\Add4~5\)) # (!CNT(3) & ((\Add4~5\) # (GND)))
-- \Add4~7\ = CARRY((!\Add4~5\) # (!CNT(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(3),
	datad => VCC,
	cin => \Add4~5\,
	combout => \Add4~6_combout\,
	cout => \Add4~7\);

-- Location: LCCOMB_X15_Y16_N8
\Add4~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~8_combout\ = (CNT(4) & (\Add4~7\ $ (GND))) # (!CNT(4) & (!\Add4~7\ & VCC))
-- \Add4~9\ = CARRY((CNT(4) & !\Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(4),
	datad => VCC,
	cin => \Add4~7\,
	combout => \Add4~8_combout\,
	cout => \Add4~9\);

-- Location: LCCOMB_X16_Y16_N26
\Add4~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~88_combout\ = (\current_state.exec_state~regout\ & \Add4~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~8_combout\,
	combout => \Add4~88_combout\);

-- Location: LCCOMB_X16_Y16_N30
\CNTin[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(4) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(4)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~88_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~88_combout\,
	datac => CNTin(4),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(4));

-- Location: LCFF_X16_Y16_N31
\CNT[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(4),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(4));

-- Location: LCCOMB_X15_Y16_N10
\Add4~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~10_combout\ = (CNT(5) & (!\Add4~9\)) # (!CNT(5) & ((\Add4~9\) # (GND)))
-- \Add4~11\ = CARRY((!\Add4~9\) # (!CNT(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(5),
	datad => VCC,
	cin => \Add4~9\,
	combout => \Add4~10_combout\,
	cout => \Add4~11\);

-- Location: LCCOMB_X16_Y16_N18
\Add4~91\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~91_combout\ = (\current_state.exec_state~regout\ & \Add4~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~10_combout\,
	combout => \Add4~91_combout\);

-- Location: LCCOMB_X16_Y16_N24
\CNTin[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(5) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(5)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~91_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~91_combout\,
	datac => CNTin(5),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(5));

-- Location: LCFF_X16_Y16_N25
\CNT[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(5),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(5));

-- Location: LCCOMB_X15_Y16_N12
\Add4~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~12_combout\ = (CNT(6) & (\Add4~11\ $ (GND))) # (!CNT(6) & (!\Add4~11\ & VCC))
-- \Add4~13\ = CARRY((CNT(6) & !\Add4~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(6),
	datad => VCC,
	cin => \Add4~11\,
	combout => \Add4~12_combout\,
	cout => \Add4~13\);

-- Location: LCCOMB_X15_Y16_N14
\Add4~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~14_combout\ = (CNT(7) & (!\Add4~13\)) # (!CNT(7) & ((\Add4~13\) # (GND)))
-- \Add4~15\ = CARRY((!\Add4~13\) # (!CNT(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(7),
	datad => VCC,
	cin => \Add4~13\,
	combout => \Add4~14_combout\,
	cout => \Add4~15\);

-- Location: LCCOMB_X16_Y16_N14
\Add4~89\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~89_combout\ = (\current_state.exec_state~regout\ & \Add4~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~14_combout\,
	combout => \Add4~89_combout\);

-- Location: LCCOMB_X16_Y16_N20
\CNTin[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(7) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(7))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~89_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(7),
	datac => \Add4~89_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(7));

-- Location: LCFF_X16_Y16_N21
\CNT[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(7),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(7));

-- Location: LCCOMB_X15_Y16_N22
\Add4~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~22_combout\ = (CNT(11) & (!\Add4~21\)) # (!CNT(11) & ((\Add4~21\) # (GND)))
-- \Add4~23\ = CARRY((!\Add4~21\) # (!CNT(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(11),
	datad => VCC,
	cin => \Add4~21\,
	combout => \Add4~22_combout\,
	cout => \Add4~23\);

-- Location: LCCOMB_X14_Y16_N2
\Add4~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~84_combout\ = (\current_state.exec_state~regout\ & \Add4~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~22_combout\,
	combout => \Add4~84_combout\);

-- Location: LCCOMB_X14_Y16_N20
\CNTin[11]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(11) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(11))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~84_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(11),
	datac => \Add4~84_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(11));

-- Location: LCFF_X14_Y16_N21
\CNT[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(11),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(11));

-- Location: LCCOMB_X15_Y16_N24
\Add4~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~24_combout\ = (CNT(12) & (\Add4~23\ $ (GND))) # (!CNT(12) & (!\Add4~23\ & VCC))
-- \Add4~25\ = CARRY((CNT(12) & !\Add4~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(12),
	datad => VCC,
	cin => \Add4~23\,
	combout => \Add4~24_combout\,
	cout => \Add4~25\);

-- Location: LCCOMB_X14_Y16_N26
\Add4~83\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~83_combout\ = (\current_state.exec_state~regout\ & \Add4~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~24_combout\,
	combout => \Add4~83_combout\);

-- Location: LCCOMB_X14_Y16_N12
\CNTin[12]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(12) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(12)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~83_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~83_combout\,
	datac => CNTin(12),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(12));

-- Location: LCFF_X14_Y16_N13
\CNT[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(12),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(12));

-- Location: LCCOMB_X15_Y16_N26
\Add4~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~26_combout\ = (CNT(13) & (!\Add4~25\)) # (!CNT(13) & ((\Add4~25\) # (GND)))
-- \Add4~27\ = CARRY((!\Add4~25\) # (!CNT(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(13),
	datad => VCC,
	cin => \Add4~25\,
	combout => \Add4~26_combout\,
	cout => \Add4~27\);

-- Location: LCCOMB_X15_Y14_N16
\Add4~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~82_combout\ = (\current_state.exec_state~regout\ & \Add4~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~26_combout\,
	combout => \Add4~82_combout\);

-- Location: LCCOMB_X15_Y14_N30
\CNTin[13]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(13) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(13))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~82_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(13),
	datac => \Add4~82_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(13));

-- Location: LCCOMB_X15_Y14_N26
\CNT[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CNT[13]~feeder_combout\ = CNTin(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => CNTin(13),
	combout => \CNT[13]~feeder_combout\);

-- Location: LCFF_X15_Y14_N27
\CNT[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \CNT[13]~feeder_combout\,
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(13));

-- Location: LCCOMB_X15_Y16_N28
\Add4~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~28_combout\ = (CNT(14) & (\Add4~27\ $ (GND))) # (!CNT(14) & (!\Add4~27\ & VCC))
-- \Add4~29\ = CARRY((CNT(14) & !\Add4~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(14),
	datad => VCC,
	cin => \Add4~27\,
	combout => \Add4~28_combout\,
	cout => \Add4~29\);

-- Location: LCCOMB_X15_Y16_N30
\Add4~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~30_combout\ = (CNT(15) & (!\Add4~29\)) # (!CNT(15) & ((\Add4~29\) # (GND)))
-- \Add4~31\ = CARRY((!\Add4~29\) # (!CNT(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(15),
	datad => VCC,
	cin => \Add4~29\,
	combout => \Add4~30_combout\,
	cout => \Add4~31\);

-- Location: LCCOMB_X14_Y16_N28
\Add4~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~80_combout\ = (\current_state.exec_state~regout\ & \Add4~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~30_combout\,
	combout => \Add4~80_combout\);

-- Location: LCCOMB_X14_Y16_N4
\CNTin[15]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(15) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(15)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~80_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~80_combout\,
	datac => CNTin(15),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(15));

-- Location: LCFF_X14_Y16_N5
\CNT[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(15),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(15));

-- Location: LCCOMB_X15_Y15_N0
\Add4~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~32_combout\ = (CNT(16) & (\Add4~31\ $ (GND))) # (!CNT(16) & (!\Add4~31\ & VCC))
-- \Add4~33\ = CARRY((CNT(16) & !\Add4~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(16),
	datad => VCC,
	cin => \Add4~31\,
	combout => \Add4~32_combout\,
	cout => \Add4~33\);

-- Location: LCCOMB_X15_Y15_N4
\Add4~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~36_combout\ = (CNT(18) & (\Add4~35\ $ (GND))) # (!CNT(18) & (!\Add4~35\ & VCC))
-- \Add4~37\ = CARRY((CNT(18) & !\Add4~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(18),
	datad => VCC,
	cin => \Add4~35\,
	combout => \Add4~36_combout\,
	cout => \Add4~37\);

-- Location: LCCOMB_X16_Y15_N30
\Add4~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~77_combout\ = (\current_state.exec_state~regout\ & \Add4~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~36_combout\,
	combout => \Add4~77_combout\);

-- Location: LCCOMB_X16_Y15_N20
\CNTin[18]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(18) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(18))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~77_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(18),
	datac => \Add4~77_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(18));

-- Location: LCFF_X16_Y15_N21
\CNT[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(18),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(18));

-- Location: LCCOMB_X15_Y15_N8
\Add4~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~40_combout\ = (CNT(20) & (\Add4~39\ $ (GND))) # (!CNT(20) & (!\Add4~39\ & VCC))
-- \Add4~41\ = CARRY((CNT(20) & !\Add4~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(20),
	datad => VCC,
	cin => \Add4~39\,
	combout => \Add4~40_combout\,
	cout => \Add4~41\);

-- Location: LCCOMB_X16_Y15_N24
\Add4~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~75_combout\ = (\current_state.exec_state~regout\ & \Add4~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~40_combout\,
	combout => \Add4~75_combout\);

-- Location: LCCOMB_X16_Y15_N28
\CNTin[20]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(20) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(20))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~75_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(20),
	datac => \Add4~75_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(20));

-- Location: LCFF_X16_Y15_N29
\CNT[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(20),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(20));

-- Location: LCCOMB_X15_Y15_N12
\Add4~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~44_combout\ = (CNT(22) & (\Add4~43\ $ (GND))) # (!CNT(22) & (!\Add4~43\ & VCC))
-- \Add4~45\ = CARRY((CNT(22) & !\Add4~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(22),
	datad => VCC,
	cin => \Add4~43\,
	combout => \Add4~44_combout\,
	cout => \Add4~45\);

-- Location: LCCOMB_X16_Y15_N14
\Add4~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~73_combout\ = (\current_state.exec_state~regout\ & \Add4~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~44_combout\,
	combout => \Add4~73_combout\);

-- Location: LCCOMB_X16_Y15_N8
\CNTin[22]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(22) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(22))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~73_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(22),
	datac => \Add4~73_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(22));

-- Location: LCFF_X16_Y15_N9
\CNT[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(22),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(22));

-- Location: LCCOMB_X15_Y15_N14
\Add4~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~46_combout\ = (CNT(23) & (!\Add4~45\)) # (!CNT(23) & ((\Add4~45\) # (GND)))
-- \Add4~47\ = CARRY((!\Add4~45\) # (!CNT(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(23),
	datad => VCC,
	cin => \Add4~45\,
	combout => \Add4~46_combout\,
	cout => \Add4~47\);

-- Location: LCCOMB_X16_Y15_N0
\Add4~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~72_combout\ = (\current_state.exec_state~regout\ & \Add4~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~46_combout\,
	combout => \Add4~72_combout\);

-- Location: LCCOMB_X16_Y15_N6
\CNTin[23]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(23) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(23)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~72_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~72_combout\,
	datac => CNTin(23),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(23));

-- Location: LCFF_X16_Y15_N7
\CNT[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(23),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(23));

-- Location: LCCOMB_X16_Y15_N26
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!CNT(21) & (!CNT(20) & (!CNT(22) & !CNT(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNT(21),
	datab => CNT(20),
	datac => CNT(22),
	datad => CNT(23),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X15_Y15_N18
\Add4~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~50_combout\ = (CNT(25) & (!\Add4~49\)) # (!CNT(25) & ((\Add4~49\) # (GND)))
-- \Add4~51\ = CARRY((!\Add4~49\) # (!CNT(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(25),
	datad => VCC,
	cin => \Add4~49\,
	combout => \Add4~50_combout\,
	cout => \Add4~51\);

-- Location: LCCOMB_X15_Y14_N28
\Add4~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~70_combout\ = (\current_state.exec_state~regout\ & \Add4~50_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datac => \Add4~50_combout\,
	combout => \Add4~70_combout\);

-- Location: LCCOMB_X15_Y14_N0
\CNTin[25]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(25) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(25))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~70_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(25),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Add4~70_combout\,
	combout => CNTin(25));

-- Location: LCFF_X15_Y14_N1
\CNT[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(25),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(25));

-- Location: LCCOMB_X15_Y15_N20
\Add4~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~52_combout\ = (CNT(26) & (\Add4~51\ $ (GND))) # (!CNT(26) & (!\Add4~51\ & VCC))
-- \Add4~53\ = CARRY((CNT(26) & !\Add4~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(26),
	datad => VCC,
	cin => \Add4~51\,
	combout => \Add4~52_combout\,
	cout => \Add4~53\);

-- Location: LCCOMB_X14_Y15_N24
\Add4~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~69_combout\ = (\current_state.exec_state~regout\ & \Add4~52_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datad => \Add4~52_combout\,
	combout => \Add4~69_combout\);

-- Location: LCCOMB_X14_Y15_N18
\CNTin[26]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(26) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(26))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~69_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CNTin(26),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Add4~69_combout\,
	combout => CNTin(26));

-- Location: LCFF_X14_Y15_N19
\CNT[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(26),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(26));

-- Location: LCCOMB_X15_Y15_N24
\Add4~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~56_combout\ = (CNT(28) & (\Add4~55\ $ (GND))) # (!CNT(28) & (!\Add4~55\ & VCC))
-- \Add4~57\ = CARRY((CNT(28) & !\Add4~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CNT(28),
	datad => VCC,
	cin => \Add4~55\,
	combout => \Add4~56_combout\,
	cout => \Add4~57\);

-- Location: LCCOMB_X15_Y15_N26
\Add4~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~58_combout\ = (CNT(29) & (!\Add4~57\)) # (!CNT(29) & ((\Add4~57\) # (GND)))
-- \Add4~59\ = CARRY((!\Add4~57\) # (!CNT(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CNT(29),
	datad => VCC,
	cin => \Add4~57\,
	combout => \Add4~58_combout\,
	cout => \Add4~59\);

-- Location: LCCOMB_X14_Y15_N30
\Add4~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~66_combout\ = (\Add4~58_combout\ & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add4~58_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Add4~66_combout\);

-- Location: LCCOMB_X14_Y15_N22
\CNTin[29]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(29) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(29))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~66_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(29),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Add4~66_combout\,
	combout => CNTin(29));

-- Location: LCFF_X14_Y15_N23
\CNT[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(29),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(29));

-- Location: LCCOMB_X14_Y15_N26
\Add4~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~65_combout\ = (\current_state.exec_state~regout\ & \Add4~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datad => \Add4~60_combout\,
	combout => \Add4~65_combout\);

-- Location: LCCOMB_X14_Y15_N8
\CNTin[30]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(30) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(30))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~65_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(30),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Add4~65_combout\,
	combout => CNTin(30));

-- Location: LCFF_X14_Y15_N9
\CNT[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(30),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(30));

-- Location: LCCOMB_X14_Y15_N12
\Add4~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~67_combout\ = (\current_state.exec_state~regout\ & \Add4~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datad => \Add4~56_combout\,
	combout => \Add4~67_combout\);

-- Location: LCCOMB_X14_Y15_N28
\CNTin[28]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(28) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(28))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~67_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(28),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Add4~67_combout\,
	combout => CNTin(28));

-- Location: LCFF_X14_Y15_N29
\CNT[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(28),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(28));

-- Location: LCCOMB_X14_Y15_N10
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!CNT(31) & (!CNT(29) & (!CNT(30) & !CNT(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNT(31),
	datab => CNT(29),
	datac => CNT(30),
	datad => CNT(28),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X16_Y15_N18
\Add4~79\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~79_combout\ = (\current_state.exec_state~regout\ & \Add4~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.exec_state~regout\,
	datac => \Add4~32_combout\,
	combout => \Add4~79_combout\);

-- Location: LCCOMB_X16_Y15_N4
\CNTin[16]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(16) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(16)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~79_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~79_combout\,
	datac => CNTin(16),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(16));

-- Location: LCFF_X16_Y15_N5
\CNT[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(16),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(16));

-- Location: LCCOMB_X16_Y15_N16
\Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!CNT(19) & (!CNT(17) & (!CNT(18) & !CNT(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNT(19),
	datab => CNT(17),
	datac => CNT(18),
	datad => CNT(16),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X15_Y14_N22
\Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~1_combout\ & (\Equal0~2_combout\ & (\Equal0~0_combout\ & \Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~2_combout\,
	datac => \Equal0~0_combout\,
	datad => \Equal0~3_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X16_Y16_N28
\Add4~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~90_combout\ = (\current_state.exec_state~regout\ & \Add4~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~12_combout\,
	combout => \Add4~90_combout\);

-- Location: LCCOMB_X16_Y16_N22
\CNTin[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(6) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((CNTin(6)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Add4~90_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add4~90_combout\,
	datac => CNTin(6),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(6));

-- Location: LCFF_X16_Y16_N23
\CNT[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(6),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(6));

-- Location: LCCOMB_X16_Y16_N4
\Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (!CNT(7) & (CNT(4) & (!CNT(5) & !CNT(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNT(7),
	datab => CNT(4),
	datac => CNT(5),
	datad => CNT(6),
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X14_Y16_N16
\Add4~81\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~81_combout\ = (\current_state.exec_state~regout\ & \Add4~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => \Add4~28_combout\,
	combout => \Add4~81_combout\);

-- Location: LCCOMB_X14_Y16_N14
\CNTin[14]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(14) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(14))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~81_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(14),
	datac => \Add4~81_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(14));

-- Location: LCFF_X14_Y16_N15
\CNT[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(14),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(14));

-- Location: LCCOMB_X14_Y16_N22
\Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!CNT(13) & (!CNT(15) & (!CNT(14) & !CNT(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNT(13),
	datab => CNT(15),
	datac => CNT(14),
	datad => CNT(12),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X16_Y16_N2
\Add4~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add4~92_combout\ = (\Add4~6_combout\ & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add4~6_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Add4~92_combout\);

-- Location: LCCOMB_X16_Y16_N16
\CNTin[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- CNTin(3) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (CNTin(3))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Add4~92_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNTin(3),
	datab => \Add4~92_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => CNTin(3));

-- Location: LCFF_X16_Y16_N17
\CNT[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => CNTin(3),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => CNT(3));

-- Location: LCCOMB_X16_Y16_N12
\Equal0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (CNT(0) & (CNT(1) & (CNT(3) & CNT(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CNT(0),
	datab => CNT(1),
	datac => CNT(3),
	datad => CNT(2),
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X16_Y16_N8
\Equal0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\Equal0~6_combout\ & (\Equal0~7_combout\ & (\Equal0~5_combout\ & \Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~6_combout\,
	datab => \Equal0~7_combout\,
	datac => \Equal0~5_combout\,
	datad => \Equal0~8_combout\,
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X16_Y16_N6
\Selector196~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector196~0_combout\ = ((\Equal0~4_combout\ & \Equal0~9_combout\)) # (!\current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~4_combout\,
	datac => \Equal0~9_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector196~0_combout\);

-- Location: CLKCTRL_G0
\Selector196~0clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Selector196~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Selector196~0clkctrl_outclk\);

-- Location: LCCOMB_X18_Y15_N26
\next_state.end_state_2609\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_state.end_state_2609~combout\ = (GLOBAL(\Selector196~0clkctrl_outclk\) & ((\Selector195~0_combout\))) # (!GLOBAL(\Selector196~0clkctrl_outclk\) & (\next_state.end_state_2609~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \next_state.end_state_2609~combout\,
	datac => \Selector195~0_combout\,
	datad => \Selector196~0clkctrl_outclk\,
	combout => \next_state.end_state_2609~combout\);

-- Location: LCFF_X18_Y15_N27
\current_state.end_state\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \next_state.end_state_2609~combout\,
	aclr => \RST~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \current_state.end_state~regout\);

-- Location: CLKCTRL_G1
\current_state.end_state~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \current_state.end_state~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \current_state.end_state~clkctrl_outclk\);

-- Location: LCCOMB_X19_Y13_N30
\Zin[24]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(24) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(24)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector59~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector59~0_combout\,
	datac => Zin(24),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(24));

-- Location: LCFF_X19_Y13_N31
\Z[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(24),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(24));

-- Location: LCCOMB_X19_Y13_N2
\Selector60~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector60~0_combout\ = (Z(24) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(24),
	datad => \current_state.exec_state~regout\,
	combout => \Selector60~0_combout\);

-- Location: LCCOMB_X19_Y13_N12
\Zin[25]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(25) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(25)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector60~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector60~0_combout\,
	datac => Zin(25),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(25));

-- Location: LCFF_X19_Y13_N13
\Z[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(25),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(25));

-- Location: LCCOMB_X21_Y13_N20
\Selector61~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector61~0_combout\ = (Z(25) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(25),
	datad => \current_state.exec_state~regout\,
	combout => \Selector61~0_combout\);

-- Location: LCCOMB_X21_Y13_N28
\Zin[26]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(26) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(26))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector61~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(26),
	datac => \Selector61~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(26));

-- Location: LCFF_X21_Y13_N29
\Z[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(26),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(26));

-- Location: LCCOMB_X20_Y13_N20
\Selector62~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector62~0_combout\ = (Z(26) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(26),
	datad => \current_state.exec_state~regout\,
	combout => \Selector62~0_combout\);

-- Location: LCCOMB_X20_Y13_N28
\Zin[27]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(27) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(27))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector62~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(27),
	datac => \Selector62~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(27));

-- Location: LCFF_X20_Y13_N29
\Z[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(27),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(27));

-- Location: LCCOMB_X21_Y13_N30
\Selector63~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector63~0_combout\ = (\current_state.exec_state~regout\ & Z(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => Z(27),
	combout => \Selector63~0_combout\);

-- Location: LCCOMB_X21_Y13_N26
\Zin[28]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(28) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(28)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector63~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector63~0_combout\,
	datac => Zin(28),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(28));

-- Location: LCFF_X21_Y13_N27
\Z[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(28),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(28));

-- Location: LCCOMB_X18_Y16_N16
\Selector50~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector50~0_combout\ = (Z(14) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Z(14),
	datac => \current_state.exec_state~regout\,
	combout => \Selector50~0_combout\);

-- Location: LCCOMB_X18_Y16_N28
\Zin[15]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(15) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(15)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector50~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector50~0_combout\,
	datac => Zin(15),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(15));

-- Location: LCFF_X18_Y16_N29
\Z[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(15),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(15));

-- Location: LCCOMB_X18_Y15_N4
\Selector51~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector51~0_combout\ = (\current_state.exec_state~regout\ & Z(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => Z(15),
	combout => \Selector51~0_combout\);

-- Location: LCCOMB_X18_Y16_N18
\Zin[16]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(16) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(16)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector51~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector51~0_combout\,
	datac => Zin(16),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(16));

-- Location: LCFF_X18_Y16_N19
\Z[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(16),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(16));

-- Location: LCCOMB_X18_Y17_N8
\Selector52~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector52~0_combout\ = (Z(16) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(16),
	datad => \current_state.exec_state~regout\,
	combout => \Selector52~0_combout\);

-- Location: LCCOMB_X18_Y16_N12
\Zin[17]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(17) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(17))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector52~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zin(17),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector52~0_combout\,
	combout => Zin(17));

-- Location: LCFF_X18_Y16_N13
\Z[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(17),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(17));

-- Location: LCCOMB_X18_Y15_N6
\Selector53~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector53~0_combout\ = (\current_state.exec_state~regout\ & Z(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => Z(17),
	combout => \Selector53~0_combout\);

-- Location: LCCOMB_X18_Y16_N6
\Zin[18]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(18) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(18)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector53~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector53~0_combout\,
	datac => Zin(18),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(18));

-- Location: LCFF_X18_Y16_N7
\Z[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(18),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(18));

-- Location: LCCOMB_X18_Y14_N22
\Selector36~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector36~0_combout\ = (Z(0) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(0),
	datad => \current_state.exec_state~regout\,
	combout => \Selector36~0_combout\);

-- Location: LCCOMB_X18_Y14_N26
\Zin[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(1) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(1)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector36~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector36~0_combout\,
	datac => Zin(1),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(1));

-- Location: LCFF_X18_Y14_N27
\Z[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(1),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(1));

-- Location: LCCOMB_X18_Y14_N4
\Selector37~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector37~0_combout\ = (Z(1) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(1),
	datad => \current_state.exec_state~regout\,
	combout => \Selector37~0_combout\);

-- Location: LCCOMB_X18_Y14_N0
\Zin[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(2) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(2)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector37~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector37~0_combout\,
	datac => Zin(2),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(2));

-- Location: LCFF_X18_Y14_N1
\Z[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(2),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(2));

-- Location: LCCOMB_X18_Y14_N30
\Selector38~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector38~0_combout\ = (Z(2) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(2),
	datad => \current_state.exec_state~regout\,
	combout => \Selector38~0_combout\);

-- Location: LCCOMB_X18_Y14_N6
\Zin[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(3) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(3))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector38~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zin(3),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector38~0_combout\,
	combout => Zin(3));

-- Location: LCFF_X18_Y14_N7
\Z[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(3),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(3));

-- Location: LCCOMB_X24_Y17_N16
\Selector39~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector39~0_combout\ = (Z(3) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(3),
	datad => \current_state.exec_state~regout\,
	combout => \Selector39~0_combout\);

-- Location: LCCOMB_X24_Y17_N28
\Zin[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(4) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(4))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector39~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(4),
	datac => \Selector39~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(4));

-- Location: LCFF_X24_Y17_N29
\Z[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(4),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(4));

-- Location: LCCOMB_X24_Y17_N18
\Selector40~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector40~0_combout\ = (Z(4) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(4),
	datad => \current_state.exec_state~regout\,
	combout => \Selector40~0_combout\);

-- Location: LCCOMB_X24_Y17_N2
\Zin[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(5) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(5))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector40~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(5),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector40~0_combout\,
	combout => Zin(5));

-- Location: LCFF_X24_Y17_N3
\Z[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(5),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(5));

-- Location: LCCOMB_X24_Y17_N8
\Selector41~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector41~0_combout\ = (Z(5) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(5),
	datad => \current_state.exec_state~regout\,
	combout => \Selector41~0_combout\);

-- Location: LCCOMB_X24_Y17_N12
\Zin[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(6) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(6))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector41~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zin(6),
	datac => \Selector41~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(6));

-- Location: LCFF_X24_Y17_N13
\Z[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(6),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(6));

-- Location: LCCOMB_X25_Y17_N4
\Selector42~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector42~0_combout\ = (\current_state.exec_state~regout\ & Z(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.exec_state~regout\,
	datad => Z(6),
	combout => \Selector42~0_combout\);

-- Location: LCCOMB_X24_Y17_N6
\Zin[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(7) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(7))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zin(7),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector42~0_combout\,
	combout => Zin(7));

-- Location: LCFF_X24_Y17_N7
\Z[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(7),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(7));

-- Location: LCCOMB_X25_Y17_N30
\Selector43~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector43~0_combout\ = (Z(7) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(7),
	datad => \current_state.exec_state~regout\,
	combout => \Selector43~0_combout\);

-- Location: LCCOMB_X24_Y17_N0
\Zin[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(8) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(8))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector43~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(8),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector43~0_combout\,
	combout => Zin(8));

-- Location: LCFF_X24_Y17_N1
\Z[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(8),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(8));

-- Location: LCCOMB_X23_Y17_N4
\Add3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (\Add2~0_combout\ & (\Add3~3\ $ (GND))) # (!\Add2~0_combout\ & (!\Add3~3\ & VCC))
-- \Add3~5\ = CARRY((\Add2~0_combout\ & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~0_combout\,
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X21_Y14_N18
\Selector69~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector69~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~4_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~4_combout\,
	datab => \Add3~4_combout\,
	datac => \sqrt_sequential:Rvar[63]~combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector69~0_combout\);

-- Location: LCCOMB_X21_Y14_N26
\sqrt_sequential:Rvar[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[2]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[2]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector69~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector69~0_combout\,
	datac => \sqrt_sequential:Rvar[2]~combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[2]~combout\);

-- Location: LCCOMB_X20_Y17_N2
\Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (D(63) & (\Add1~1\ & VCC)) # (!D(63) & (!\Add1~1\))
-- \Add1~3\ = CARRY((!D(63) & !\Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => D(63),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X16_Y17_N26
\Selector68~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector68~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~2_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~2_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add1~2_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector68~0_combout\);

-- Location: LCCOMB_X18_Y17_N22
\sqrt_sequential:Rvar[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[1]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[1]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector68~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[1]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector68~0_combout\,
	combout => \sqrt_sequential:Rvar[1]~combout\);

-- Location: LCCOMB_X19_Y17_N4
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (Z(1) & ((\sqrt_sequential:Rvar[1]~combout\ & (!\Add0~1\)) # (!\sqrt_sequential:Rvar[1]~combout\ & ((\Add0~1\) # (GND))))) # (!Z(1) & ((\sqrt_sequential:Rvar[1]~combout\ & (\Add0~1\ & VCC)) # (!\sqrt_sequential:Rvar[1]~combout\ & 
-- (!\Add0~1\))))
-- \Add0~3\ = CARRY((Z(1) & ((!\Add0~1\) # (!\sqrt_sequential:Rvar[1]~combout\))) # (!Z(1) & (!\sqrt_sequential:Rvar[1]~combout\ & !\Add0~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(1),
	datab => \sqrt_sequential:Rvar[1]~combout\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X19_Y17_N6
\Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((Z(2) $ (\sqrt_sequential:Rvar[2]~combout\ $ (\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((Z(2) & (\sqrt_sequential:Rvar[2]~combout\ & !\Add0~3\)) # (!Z(2) & ((\sqrt_sequential:Rvar[2]~combout\) # (!\Add0~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(2),
	datab => \sqrt_sequential:Rvar[2]~combout\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X20_Y17_N8
\Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (\Add0~4_combout\ & ((GND) # (!\Add1~7\))) # (!\Add0~4_combout\ & (\Add1~7\ $ (GND)))
-- \Add1~9\ = CARRY((\Add0~4_combout\) # (!\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~4_combout\,
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X20_Y17_N12
\Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (\Add0~8_combout\ & ((GND) # (!\Add1~11\))) # (!\Add0~8_combout\ & (\Add1~11\ $ (GND)))
-- \Add1~13\ = CARRY((\Add0~8_combout\) # (!\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X20_Y17_N14
\Add1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (\Add0~10_combout\ & (\Add1~13\ & VCC)) # (!\Add0~10_combout\ & (!\Add1~13\))
-- \Add1~15\ = CARRY((!\Add0~10_combout\ & !\Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X16_Y17_N14
\Selector74~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector74~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~14_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~14_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add1~14_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector74~0_combout\);

-- Location: LCCOMB_X16_Y17_N10
\sqrt_sequential:Rvar[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[7]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[7]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector74~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[7]~combout\,
	datac => \Selector74~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[7]~combout\);

-- Location: LCCOMB_X22_Y17_N4
\Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (\sqrt_sequential:Rvar[1]~combout\ & ((Z(1) & (\Add2~1\ & VCC)) # (!Z(1) & (!\Add2~1\)))) # (!\sqrt_sequential:Rvar[1]~combout\ & ((Z(1) & (!\Add2~1\)) # (!Z(1) & ((\Add2~1\) # (GND)))))
-- \Add2~3\ = CARRY((\sqrt_sequential:Rvar[1]~combout\ & (!Z(1) & !\Add2~1\)) # (!\sqrt_sequential:Rvar[1]~combout\ & ((!\Add2~1\) # (!Z(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[1]~combout\,
	datab => Z(1),
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCCOMB_X22_Y17_N6
\Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = ((Z(2) $ (\sqrt_sequential:Rvar[2]~combout\ $ (!\Add2~3\)))) # (GND)
-- \Add2~5\ = CARRY((Z(2) & ((\sqrt_sequential:Rvar[2]~combout\) # (!\Add2~3\))) # (!Z(2) & (\sqrt_sequential:Rvar[2]~combout\ & !\Add2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(2),
	datab => \sqrt_sequential:Rvar[2]~combout\,
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: LCCOMB_X23_Y17_N6
\Add3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (\Add2~2_combout\ & (!\Add3~5\)) # (!\Add2~2_combout\ & ((\Add3~5\) # (GND)))
-- \Add3~7\ = CARRY((!\Add3~5\) # (!\Add2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~2_combout\,
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X23_Y17_N10
\Add3~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (\Add2~6_combout\ & (!\Add3~9\)) # (!\Add2~6_combout\ & ((\Add3~9\) # (GND)))
-- \Add3~11\ = CARRY((!\Add3~9\) # (!\Add2~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~6_combout\,
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X16_Y17_N12
\Selector72~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector72~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~10_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~10_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add3~10_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector72~0_combout\);

-- Location: LCCOMB_X18_Y17_N20
\sqrt_sequential:Rvar[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[5]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[5]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector72~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[5]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector72~0_combout\,
	combout => \sqrt_sequential:Rvar[5]~combout\);

-- Location: LCCOMB_X21_Y15_N26
\Selector71~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector71~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~8_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~8_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add1~8_combout\,
	combout => \Selector71~0_combout\);

-- Location: LCCOMB_X21_Y15_N22
\sqrt_sequential:Rvar[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[4]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[4]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector71~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[4]~combout\,
	datac => \Selector71~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[4]~combout\);

-- Location: LCCOMB_X16_Y17_N24
\Selector70~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector70~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~6_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~6_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add3~6_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector70~0_combout\);

-- Location: LCCOMB_X16_Y17_N2
\sqrt_sequential:Rvar[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[3]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[3]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector70~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[3]~combout\,
	datac => \Selector70~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[3]~combout\);

-- Location: LCCOMB_X22_Y17_N16
\Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = (Z(7) & ((\sqrt_sequential:Rvar[7]~combout\ & (\Add2~13\ & VCC)) # (!\sqrt_sequential:Rvar[7]~combout\ & (!\Add2~13\)))) # (!Z(7) & ((\sqrt_sequential:Rvar[7]~combout\ & (!\Add2~13\)) # (!\sqrt_sequential:Rvar[7]~combout\ & 
-- ((\Add2~13\) # (GND)))))
-- \Add2~15\ = CARRY((Z(7) & (!\sqrt_sequential:Rvar[7]~combout\ & !\Add2~13\)) # (!Z(7) & ((!\Add2~13\) # (!\sqrt_sequential:Rvar[7]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(7),
	datab => \sqrt_sequential:Rvar[7]~combout\,
	datad => VCC,
	cin => \Add2~13\,
	combout => \Add2~14_combout\,
	cout => \Add2~15\);

-- Location: LCCOMB_X22_Y17_N18
\Add2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~16_combout\ = ((\sqrt_sequential:Rvar[8]~combout\ $ (Z(8) $ (!\Add2~15\)))) # (GND)
-- \Add2~17\ = CARRY((\sqrt_sequential:Rvar[8]~combout\ & ((Z(8)) # (!\Add2~15\))) # (!\sqrt_sequential:Rvar[8]~combout\ & (Z(8) & !\Add2~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[8]~combout\,
	datab => Z(8),
	datad => VCC,
	cin => \Add2~15\,
	combout => \Add2~16_combout\,
	cout => \Add2~17\);

-- Location: LCCOMB_X23_Y17_N18
\Add3~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~18_combout\ = (\Add2~14_combout\ & (!\Add3~17\)) # (!\Add2~14_combout\ & ((\Add3~17\) # (GND)))
-- \Add3~19\ = CARRY((!\Add3~17\) # (!\Add2~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~14_combout\,
	datad => VCC,
	cin => \Add3~17\,
	combout => \Add3~18_combout\,
	cout => \Add3~19\);

-- Location: LCCOMB_X23_Y17_N20
\Add3~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~20_combout\ = (\Add2~16_combout\ & (\Add3~19\ $ (GND))) # (!\Add2~16_combout\ & (!\Add3~19\ & VCC))
-- \Add3~21\ = CARRY((\Add2~16_combout\ & !\Add3~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~16_combout\,
	datad => VCC,
	cin => \Add3~19\,
	combout => \Add3~20_combout\,
	cout => \Add3~21\);

-- Location: LCCOMB_X21_Y17_N14
\Selector77~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector77~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~20_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~20_combout\,
	datab => \Add3~20_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \sqrt_sequential:Rvar[63]~combout\,
	combout => \Selector77~0_combout\);

-- Location: LCCOMB_X21_Y17_N30
\sqrt_sequential:Rvar[10]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[10]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[10]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector77~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[10]~combout\,
	datac => \Selector77~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[10]~combout\);

-- Location: LCCOMB_X16_Y17_N20
\Selector73~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector73~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~12_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~12_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add1~12_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector73~0_combout\);

-- Location: LCCOMB_X16_Y17_N6
\sqrt_sequential:Rvar[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[6]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[6]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector73~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[6]~combout\,
	datac => \Selector73~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[6]~combout\);

-- Location: LCCOMB_X19_Y17_N16
\Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\sqrt_sequential:Rvar[7]~combout\ & ((Z(7) & (!\Add0~13\)) # (!Z(7) & (\Add0~13\ & VCC)))) # (!\sqrt_sequential:Rvar[7]~combout\ & ((Z(7) & ((\Add0~13\) # (GND))) # (!Z(7) & (!\Add0~13\))))
-- \Add0~15\ = CARRY((\sqrt_sequential:Rvar[7]~combout\ & (Z(7) & !\Add0~13\)) # (!\sqrt_sequential:Rvar[7]~combout\ & ((Z(7)) # (!\Add0~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[7]~combout\,
	datab => Z(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X20_Y17_N18
\Add1~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (\Add0~14_combout\ & (\Add1~17\ & VCC)) # (!\Add0~14_combout\ & (!\Add1~17\))
-- \Add1~19\ = CARRY((!\Add0~14_combout\ & !\Add1~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~14_combout\,
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: LCCOMB_X21_Y17_N0
\Selector76~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector76~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~18_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~18_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add3~18_combout\,
	combout => \Selector76~0_combout\);

-- Location: LCCOMB_X18_Y17_N6
\sqrt_sequential:Rvar[9]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[9]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[9]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector76~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[9]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector76~0_combout\,
	combout => \sqrt_sequential:Rvar[9]~combout\);

-- Location: LCCOMB_X19_Y17_N18
\Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = ((\sqrt_sequential:Rvar[8]~combout\ $ (Z(8) $ (\Add0~15\)))) # (GND)
-- \Add0~17\ = CARRY((\sqrt_sequential:Rvar[8]~combout\ & ((!\Add0~15\) # (!Z(8)))) # (!\sqrt_sequential:Rvar[8]~combout\ & (!Z(8) & !\Add0~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[8]~combout\,
	datab => Z(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X19_Y17_N22
\Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = ((Z(10) $ (\sqrt_sequential:Rvar[10]~combout\ $ (\Add0~19\)))) # (GND)
-- \Add0~21\ = CARRY((Z(10) & (\sqrt_sequential:Rvar[10]~combout\ & !\Add0~19\)) # (!Z(10) & ((\sqrt_sequential:Rvar[10]~combout\) # (!\Add0~19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(10),
	datab => \sqrt_sequential:Rvar[10]~combout\,
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X20_Y17_N22
\Add1~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~22_combout\ = (\Add0~18_combout\ & (\Add1~21\ & VCC)) # (!\Add0~18_combout\ & (!\Add1~21\))
-- \Add1~23\ = CARRY((!\Add0~18_combout\ & !\Add1~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~18_combout\,
	datad => VCC,
	cin => \Add1~21\,
	combout => \Add1~22_combout\,
	cout => \Add1~23\);

-- Location: LCCOMB_X20_Y17_N24
\Add1~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~24_combout\ = (\Add0~20_combout\ & ((GND) # (!\Add1~23\))) # (!\Add0~20_combout\ & (\Add1~23\ $ (GND)))
-- \Add1~25\ = CARRY((\Add0~20_combout\) # (!\Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~20_combout\,
	datad => VCC,
	cin => \Add1~23\,
	combout => \Add1~24_combout\,
	cout => \Add1~25\);

-- Location: LCCOMB_X24_Y17_N14
\Selector44~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector44~0_combout\ = (Z(8) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Z(8),
	datad => \current_state.exec_state~regout\,
	combout => \Selector44~0_combout\);

-- Location: LCCOMB_X24_Y17_N10
\Zin[9]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(9) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(9))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector44~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zin(9),
	datac => \Selector44~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(9));

-- Location: LCFF_X24_Y17_N11
\Z[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(9),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(9));

-- Location: LCCOMB_X16_Y17_N30
\Selector45~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector45~0_combout\ = (Z(9) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(9),
	datad => \current_state.exec_state~regout\,
	combout => \Selector45~0_combout\);

-- Location: LCCOMB_X18_Y17_N12
\Zin[10]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(10) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(10))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector45~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(10),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector45~0_combout\,
	combout => Zin(10));

-- Location: LCFF_X18_Y17_N13
\Z[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(10),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(10));

-- Location: LCCOMB_X22_Y17_N22
\Add2~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~20_combout\ = ((\sqrt_sequential:Rvar[10]~combout\ $ (Z(10) $ (!\Add2~19\)))) # (GND)
-- \Add2~21\ = CARRY((\sqrt_sequential:Rvar[10]~combout\ & ((Z(10)) # (!\Add2~19\))) # (!\sqrt_sequential:Rvar[10]~combout\ & (Z(10) & !\Add2~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[10]~combout\,
	datab => Z(10),
	datad => VCC,
	cin => \Add2~19\,
	combout => \Add2~20_combout\,
	cout => \Add2~21\);

-- Location: LCCOMB_X23_Y17_N24
\Add3~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~24_combout\ = (\Add2~20_combout\ & (\Add3~23\ $ (GND))) # (!\Add2~20_combout\ & (!\Add3~23\ & VCC))
-- \Add3~25\ = CARRY((\Add2~20_combout\ & !\Add3~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~20_combout\,
	datad => VCC,
	cin => \Add3~23\,
	combout => \Add3~24_combout\,
	cout => \Add3~25\);

-- Location: LCCOMB_X21_Y17_N24
\Selector79~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector79~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~24_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~24_combout\,
	datac => \Add3~24_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector79~0_combout\);

-- Location: LCCOMB_X21_Y17_N8
\sqrt_sequential:Rvar[12]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[12]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[12]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector79~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[12]~combout\,
	datac => \Selector79~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[12]~combout\);

-- Location: LCCOMB_X18_Y17_N2
\Selector46~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector46~0_combout\ = (Z(10) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(10),
	datad => \current_state.exec_state~regout\,
	combout => \Selector46~0_combout\);

-- Location: LCCOMB_X18_Y17_N26
\Zin[11]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(11) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(11)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector46~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector46~0_combout\,
	datac => Zin(11),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(11));

-- Location: LCFF_X18_Y17_N27
\Z[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(11),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(11));

-- Location: LCCOMB_X19_Y17_N24
\Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\sqrt_sequential:Rvar[11]~combout\ & ((Z(11) & (!\Add0~21\)) # (!Z(11) & (\Add0~21\ & VCC)))) # (!\sqrt_sequential:Rvar[11]~combout\ & ((Z(11) & ((\Add0~21\) # (GND))) # (!Z(11) & (!\Add0~21\))))
-- \Add0~23\ = CARRY((\sqrt_sequential:Rvar[11]~combout\ & (Z(11) & !\Add0~21\)) # (!\sqrt_sequential:Rvar[11]~combout\ & ((Z(11)) # (!\Add0~21\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[11]~combout\,
	datab => Z(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X19_Y17_N26
\Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = ((Z(12) $ (\sqrt_sequential:Rvar[12]~combout\ $ (\Add0~23\)))) # (GND)
-- \Add0~25\ = CARRY((Z(12) & (\sqrt_sequential:Rvar[12]~combout\ & !\Add0~23\)) # (!Z(12) & ((\sqrt_sequential:Rvar[12]~combout\) # (!\Add0~23\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(12),
	datab => \sqrt_sequential:Rvar[12]~combout\,
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X20_Y17_N26
\Add1~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~26_combout\ = (\Add0~22_combout\ & (\Add1~25\ & VCC)) # (!\Add0~22_combout\ & (!\Add1~25\))
-- \Add1~27\ = CARRY((!\Add0~22_combout\ & !\Add1~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~22_combout\,
	datad => VCC,
	cin => \Add1~25\,
	combout => \Add1~26_combout\,
	cout => \Add1~27\);

-- Location: LCCOMB_X20_Y17_N28
\Add1~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~28_combout\ = (\Add0~24_combout\ & ((GND) # (!\Add1~27\))) # (!\Add0~24_combout\ & (\Add1~27\ $ (GND)))
-- \Add1~29\ = CARRY((\Add0~24_combout\) # (!\Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~24_combout\,
	datad => VCC,
	cin => \Add1~27\,
	combout => \Add1~28_combout\,
	cout => \Add1~29\);

-- Location: LCCOMB_X16_Y17_N8
\Selector78~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector78~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~22_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~22_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add1~22_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector78~0_combout\);

-- Location: LCCOMB_X18_Y17_N24
\sqrt_sequential:Rvar[11]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[11]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[11]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector78~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[11]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector78~0_combout\,
	combout => \sqrt_sequential:Rvar[11]~combout\);

-- Location: LCCOMB_X22_Y17_N24
\Add2~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~22_combout\ = (Z(11) & ((\sqrt_sequential:Rvar[11]~combout\ & (\Add2~21\ & VCC)) # (!\sqrt_sequential:Rvar[11]~combout\ & (!\Add2~21\)))) # (!Z(11) & ((\sqrt_sequential:Rvar[11]~combout\ & (!\Add2~21\)) # (!\sqrt_sequential:Rvar[11]~combout\ & 
-- ((\Add2~21\) # (GND)))))
-- \Add2~23\ = CARRY((Z(11) & (!\sqrt_sequential:Rvar[11]~combout\ & !\Add2~21\)) # (!Z(11) & ((!\Add2~21\) # (!\sqrt_sequential:Rvar[11]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(11),
	datab => \sqrt_sequential:Rvar[11]~combout\,
	datad => VCC,
	cin => \Add2~21\,
	combout => \Add2~22_combout\,
	cout => \Add2~23\);

-- Location: LCCOMB_X22_Y17_N26
\Add2~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~24_combout\ = ((Z(12) $ (\sqrt_sequential:Rvar[12]~combout\ $ (!\Add2~23\)))) # (GND)
-- \Add2~25\ = CARRY((Z(12) & ((\sqrt_sequential:Rvar[12]~combout\) # (!\Add2~23\))) # (!Z(12) & (\sqrt_sequential:Rvar[12]~combout\ & !\Add2~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(12),
	datab => \sqrt_sequential:Rvar[12]~combout\,
	datad => VCC,
	cin => \Add2~23\,
	combout => \Add2~24_combout\,
	cout => \Add2~25\);

-- Location: LCCOMB_X23_Y17_N26
\Add3~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~26_combout\ = (\Add2~22_combout\ & (!\Add3~25\)) # (!\Add2~22_combout\ & ((\Add3~25\) # (GND)))
-- \Add3~27\ = CARRY((!\Add3~25\) # (!\Add2~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~22_combout\,
	datad => VCC,
	cin => \Add3~25\,
	combout => \Add3~26_combout\,
	cout => \Add3~27\);

-- Location: LCCOMB_X23_Y17_N28
\Add3~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~28_combout\ = (\Add2~24_combout\ & (\Add3~27\ $ (GND))) # (!\Add2~24_combout\ & (!\Add3~27\ & VCC))
-- \Add3~29\ = CARRY((\Add2~24_combout\ & !\Add3~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~24_combout\,
	datad => VCC,
	cin => \Add3~27\,
	combout => \Add3~28_combout\,
	cout => \Add3~29\);

-- Location: LCCOMB_X21_Y17_N4
\Selector81~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector81~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~28_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~28_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add3~28_combout\,
	combout => \Selector81~0_combout\);

-- Location: LCCOMB_X21_Y17_N12
\sqrt_sequential:Rvar[14]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[14]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[14]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector81~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[14]~combout\,
	datac => \Selector81~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[14]~combout\);

-- Location: LCCOMB_X21_Y17_N2
\Selector80~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector80~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~26_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~26_combout\,
	datac => \Add3~26_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector80~0_combout\);

-- Location: LCCOMB_X21_Y17_N18
\sqrt_sequential:Rvar[13]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[13]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[13]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector80~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector80~0_combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \sqrt_sequential:Rvar[13]~combout\,
	combout => \sqrt_sequential:Rvar[13]~combout\);

-- Location: LCCOMB_X19_Y17_N28
\Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (Z(13) & ((\sqrt_sequential:Rvar[13]~combout\ & (!\Add0~25\)) # (!\sqrt_sequential:Rvar[13]~combout\ & ((\Add0~25\) # (GND))))) # (!Z(13) & ((\sqrt_sequential:Rvar[13]~combout\ & (\Add0~25\ & VCC)) # 
-- (!\sqrt_sequential:Rvar[13]~combout\ & (!\Add0~25\))))
-- \Add0~27\ = CARRY((Z(13) & ((!\Add0~25\) # (!\sqrt_sequential:Rvar[13]~combout\))) # (!Z(13) & (!\sqrt_sequential:Rvar[13]~combout\ & !\Add0~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(13),
	datab => \sqrt_sequential:Rvar[13]~combout\,
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X19_Y16_N0
\Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (\sqrt_sequential:Rvar[15]~combout\ & ((Z(15) & (!\Add0~29\)) # (!Z(15) & (\Add0~29\ & VCC)))) # (!\sqrt_sequential:Rvar[15]~combout\ & ((Z(15) & ((\Add0~29\) # (GND))) # (!Z(15) & (!\Add0~29\))))
-- \Add0~31\ = CARRY((\sqrt_sequential:Rvar[15]~combout\ & (Z(15) & !\Add0~29\)) # (!\sqrt_sequential:Rvar[15]~combout\ & ((Z(15)) # (!\Add0~29\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[15]~combout\,
	datab => Z(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X20_Y17_N30
\Add1~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~30_combout\ = (\Add0~26_combout\ & (\Add1~29\ & VCC)) # (!\Add0~26_combout\ & (!\Add1~29\))
-- \Add1~31\ = CARRY((!\Add0~26_combout\ & !\Add1~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~26_combout\,
	datad => VCC,
	cin => \Add1~29\,
	combout => \Add1~30_combout\,
	cout => \Add1~31\);

-- Location: LCCOMB_X20_Y16_N2
\Add1~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~34_combout\ = (\Add0~30_combout\ & (\Add1~33\ & VCC)) # (!\Add0~30_combout\ & (!\Add1~33\))
-- \Add1~35\ = CARRY((!\Add0~30_combout\ & !\Add1~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~30_combout\,
	datad => VCC,
	cin => \Add1~33\,
	combout => \Add1~34_combout\,
	cout => \Add1~35\);

-- Location: LCCOMB_X22_Y17_N28
\Add2~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~26_combout\ = (Z(13) & ((\sqrt_sequential:Rvar[13]~combout\ & (\Add2~25\ & VCC)) # (!\sqrt_sequential:Rvar[13]~combout\ & (!\Add2~25\)))) # (!Z(13) & ((\sqrt_sequential:Rvar[13]~combout\ & (!\Add2~25\)) # (!\sqrt_sequential:Rvar[13]~combout\ & 
-- ((\Add2~25\) # (GND)))))
-- \Add2~27\ = CARRY((Z(13) & (!\sqrt_sequential:Rvar[13]~combout\ & !\Add2~25\)) # (!Z(13) & ((!\Add2~25\) # (!\sqrt_sequential:Rvar[13]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(13),
	datab => \sqrt_sequential:Rvar[13]~combout\,
	datad => VCC,
	cin => \Add2~25\,
	combout => \Add2~26_combout\,
	cout => \Add2~27\);

-- Location: LCCOMB_X23_Y17_N30
\Add3~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~30_combout\ = (\Add2~26_combout\ & (!\Add3~29\)) # (!\Add2~26_combout\ & ((\Add3~29\) # (GND)))
-- \Add3~31\ = CARRY((!\Add3~29\) # (!\Add2~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~26_combout\,
	datad => VCC,
	cin => \Add3~29\,
	combout => \Add3~30_combout\,
	cout => \Add3~31\);

-- Location: LCCOMB_X23_Y16_N2
\Add3~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~34_combout\ = (\Add2~30_combout\ & (!\Add3~33\)) # (!\Add2~30_combout\ & ((\Add3~33\) # (GND)))
-- \Add3~35\ = CARRY((!\Add3~33\) # (!\Add2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~30_combout\,
	datad => VCC,
	cin => \Add3~33\,
	combout => \Add3~34_combout\,
	cout => \Add3~35\);

-- Location: LCCOMB_X21_Y17_N26
\Selector84~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector84~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~34_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~34_combout\,
	datac => \Add3~34_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector84~0_combout\);

-- Location: LCCOMB_X21_Y17_N28
\sqrt_sequential:Rvar[17]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[17]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[17]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector84~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector84~0_combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \sqrt_sequential:Rvar[17]~combout\,
	combout => \sqrt_sequential:Rvar[17]~combout\);

-- Location: LCCOMB_X19_Y16_N4
\Add0~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (Z(17) & ((\sqrt_sequential:Rvar[17]~combout\ & (!\Add0~33\)) # (!\sqrt_sequential:Rvar[17]~combout\ & ((\Add0~33\) # (GND))))) # (!Z(17) & ((\sqrt_sequential:Rvar[17]~combout\ & (\Add0~33\ & VCC)) # 
-- (!\sqrt_sequential:Rvar[17]~combout\ & (!\Add0~33\))))
-- \Add0~35\ = CARRY((Z(17) & ((!\Add0~33\) # (!\sqrt_sequential:Rvar[17]~combout\))) # (!Z(17) & (!\sqrt_sequential:Rvar[17]~combout\ & !\Add0~33\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(17),
	datab => \sqrt_sequential:Rvar[17]~combout\,
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X19_Y16_N6
\Add0~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = ((\sqrt_sequential:Rvar[18]~combout\ $ (Z(18) $ (\Add0~35\)))) # (GND)
-- \Add0~37\ = CARRY((\sqrt_sequential:Rvar[18]~combout\ & ((!\Add0~35\) # (!Z(18)))) # (!\sqrt_sequential:Rvar[18]~combout\ & (!Z(18) & !\Add0~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[18]~combout\,
	datab => Z(18),
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: LCCOMB_X20_Y16_N6
\Add1~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~38_combout\ = (\Add0~34_combout\ & (\Add1~37\ & VCC)) # (!\Add0~34_combout\ & (!\Add1~37\))
-- \Add1~39\ = CARRY((!\Add0~34_combout\ & !\Add1~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~34_combout\,
	datad => VCC,
	cin => \Add1~37\,
	combout => \Add1~38_combout\,
	cout => \Add1~39\);

-- Location: LCCOMB_X20_Y16_N8
\Add1~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~40_combout\ = (\Add0~36_combout\ & ((GND) # (!\Add1~39\))) # (!\Add0~36_combout\ & (\Add1~39\ $ (GND)))
-- \Add1~41\ = CARRY((\Add0~36_combout\) # (!\Add1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~36_combout\,
	datad => VCC,
	cin => \Add1~39\,
	combout => \Add1~40_combout\,
	cout => \Add1~41\);

-- Location: LCCOMB_X20_Y16_N16
\Add1~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~48_combout\ = (\Add0~44_combout\ & ((GND) # (!\Add1~47\))) # (!\Add0~44_combout\ & (\Add1~47\ $ (GND)))
-- \Add1~49\ = CARRY((\Add0~44_combout\) # (!\Add1~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~44_combout\,
	datad => VCC,
	cin => \Add1~47\,
	combout => \Add1~48_combout\,
	cout => \Add1~49\);

-- Location: LCCOMB_X21_Y16_N4
\Selector91~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector91~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~48_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~48_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~48_combout\,
	datab => \Add1~48_combout\,
	datac => \sqrt_sequential:Rvar[63]~combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector91~0_combout\);

-- Location: LCCOMB_X21_Y16_N22
\sqrt_sequential:Rvar[24]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[24]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[24]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector91~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[24]~combout\,
	datac => \Selector91~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[24]~combout\);

-- Location: LCCOMB_X18_Y16_N30
\Zin[20]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(20) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(20)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector55~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datac => Zin(20),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(20));

-- Location: LCFF_X18_Y16_N31
\Z[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(20),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(20));

-- Location: LCCOMB_X19_Y13_N22
\Selector56~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector56~0_combout\ = (Z(20) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(20),
	datad => \current_state.exec_state~regout\,
	combout => \Selector56~0_combout\);

-- Location: LCCOMB_X19_Y13_N28
\Zin[21]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(21) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(21)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector56~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector56~0_combout\,
	datac => Zin(21),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(21));

-- Location: LCFF_X19_Y13_N29
\Z[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(21),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(21));

-- Location: LCCOMB_X19_Y13_N8
\Selector57~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector57~0_combout\ = (Z(21) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(21),
	datad => \current_state.exec_state~regout\,
	combout => \Selector57~0_combout\);

-- Location: LCCOMB_X19_Y13_N6
\Zin[22]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(22) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(22))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector57~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(22),
	datac => \Selector57~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(22));

-- Location: LCFF_X19_Y13_N7
\Z[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(22),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(22));

-- Location: LCCOMB_X19_Y13_N18
\Selector58~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector58~0_combout\ = (Z(22) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(22),
	datad => \current_state.exec_state~regout\,
	combout => \Selector58~0_combout\);

-- Location: LCCOMB_X19_Y13_N0
\Zin[23]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(23) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(23)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector58~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector58~0_combout\,
	datac => Zin(23),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(23));

-- Location: LCFF_X19_Y13_N1
\Z[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(23),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(23));

-- Location: LCCOMB_X18_Y15_N2
\Selector54~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector54~0_combout\ = (Z(18) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(18),
	datac => \current_state.exec_state~regout\,
	combout => \Selector54~0_combout\);

-- Location: LCCOMB_X18_Y16_N0
\Zin[19]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(19) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(19))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector54~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(19),
	datac => \Selector54~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(19));

-- Location: LCFF_X18_Y16_N1
\Z[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(19),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(19));

-- Location: LCCOMB_X21_Y17_N22
\Selector82~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector82~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~30_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~30_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~30_combout\,
	datac => \Add1~30_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector82~0_combout\);

-- Location: LCCOMB_X21_Y17_N10
\sqrt_sequential:Rvar[15]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[15]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[15]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector82~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[15]~combout\,
	datab => \Selector82~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[15]~combout\);

-- Location: LCCOMB_X16_Y17_N22
\Selector48~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector48~0_combout\ = (Z(12) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Z(12),
	datad => \current_state.exec_state~regout\,
	combout => \Selector48~0_combout\);

-- Location: LCCOMB_X18_Y17_N10
\Zin[13]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(13) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(13))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector48~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zin(13),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector48~0_combout\,
	combout => Zin(13));

-- Location: LCFF_X18_Y17_N11
\Z[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(13),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(13));

-- Location: LCCOMB_X16_Y17_N28
\Selector49~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector49~0_combout\ = (Z(13) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(13),
	datad => \current_state.exec_state~regout\,
	combout => \Selector49~0_combout\);

-- Location: LCCOMB_X18_Y17_N28
\Zin[14]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(14) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(14))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector49~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(14),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector49~0_combout\,
	combout => Zin(14));

-- Location: LCFF_X18_Y17_N29
\Z[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(14),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(14));

-- Location: LCCOMB_X22_Y16_N2
\Add2~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~32_combout\ = ((\sqrt_sequential:Rvar[16]~combout\ $ (Z(16) $ (!\Add2~31\)))) # (GND)
-- \Add2~33\ = CARRY((\sqrt_sequential:Rvar[16]~combout\ & ((Z(16)) # (!\Add2~31\))) # (!\sqrt_sequential:Rvar[16]~combout\ & (Z(16) & !\Add2~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[16]~combout\,
	datab => Z(16),
	datad => VCC,
	cin => \Add2~31\,
	combout => \Add2~32_combout\,
	cout => \Add2~33\);

-- Location: LCCOMB_X22_Y16_N4
\Add2~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~34_combout\ = (\sqrt_sequential:Rvar[17]~combout\ & ((Z(17) & (\Add2~33\ & VCC)) # (!Z(17) & (!\Add2~33\)))) # (!\sqrt_sequential:Rvar[17]~combout\ & ((Z(17) & (!\Add2~33\)) # (!Z(17) & ((\Add2~33\) # (GND)))))
-- \Add2~35\ = CARRY((\sqrt_sequential:Rvar[17]~combout\ & (!Z(17) & !\Add2~33\)) # (!\sqrt_sequential:Rvar[17]~combout\ & ((!\Add2~33\) # (!Z(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[17]~combout\,
	datab => Z(17),
	datad => VCC,
	cin => \Add2~33\,
	combout => \Add2~34_combout\,
	cout => \Add2~35\);

-- Location: LCCOMB_X22_Y16_N16
\Add2~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~46_combout\ = (\sqrt_sequential:Rvar[23]~combout\ & ((Z(23) & (\Add2~45\ & VCC)) # (!Z(23) & (!\Add2~45\)))) # (!\sqrt_sequential:Rvar[23]~combout\ & ((Z(23) & (!\Add2~45\)) # (!Z(23) & ((\Add2~45\) # (GND)))))
-- \Add2~47\ = CARRY((\sqrt_sequential:Rvar[23]~combout\ & (!Z(23) & !\Add2~45\)) # (!\sqrt_sequential:Rvar[23]~combout\ & ((!\Add2~45\) # (!Z(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[23]~combout\,
	datab => Z(23),
	datad => VCC,
	cin => \Add2~45\,
	combout => \Add2~46_combout\,
	cout => \Add2~47\);

-- Location: LCCOMB_X22_Y16_N18
\Add2~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~48_combout\ = ((Z(24) $ (\sqrt_sequential:Rvar[24]~combout\ $ (!\Add2~47\)))) # (GND)
-- \Add2~49\ = CARRY((Z(24) & ((\sqrt_sequential:Rvar[24]~combout\) # (!\Add2~47\))) # (!Z(24) & (\sqrt_sequential:Rvar[24]~combout\ & !\Add2~47\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(24),
	datab => \sqrt_sequential:Rvar[24]~combout\,
	datad => VCC,
	cin => \Add2~47\,
	combout => \Add2~48_combout\,
	cout => \Add2~49\);

-- Location: LCCOMB_X23_Y16_N6
\Add3~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~38_combout\ = (\Add2~34_combout\ & (!\Add3~37\)) # (!\Add2~34_combout\ & ((\Add3~37\) # (GND)))
-- \Add3~39\ = CARRY((!\Add3~37\) # (!\Add2~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~34_combout\,
	datad => VCC,
	cin => \Add3~37\,
	combout => \Add3~38_combout\,
	cout => \Add3~39\);

-- Location: LCCOMB_X23_Y16_N8
\Add3~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~40_combout\ = (\Add2~36_combout\ & (\Add3~39\ $ (GND))) # (!\Add2~36_combout\ & (!\Add3~39\ & VCC))
-- \Add3~41\ = CARRY((\Add2~36_combout\ & !\Add3~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~36_combout\,
	datad => VCC,
	cin => \Add3~39\,
	combout => \Add3~40_combout\,
	cout => \Add3~41\);

-- Location: LCCOMB_X23_Y16_N14
\Add3~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~46_combout\ = (\Add2~42_combout\ & (!\Add3~45\)) # (!\Add2~42_combout\ & ((\Add3~45\) # (GND)))
-- \Add3~47\ = CARRY((!\Add3~45\) # (!\Add2~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~42_combout\,
	datad => VCC,
	cin => \Add3~45\,
	combout => \Add3~46_combout\,
	cout => \Add3~47\);

-- Location: LCCOMB_X23_Y16_N18
\Add3~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~50_combout\ = (\Add2~46_combout\ & (!\Add3~49\)) # (!\Add2~46_combout\ & ((\Add3~49\) # (GND)))
-- \Add3~51\ = CARRY((!\Add3~49\) # (!\Add2~46_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~46_combout\,
	datad => VCC,
	cin => \Add3~49\,
	combout => \Add3~50_combout\,
	cout => \Add3~51\);

-- Location: LCCOMB_X23_Y16_N20
\Add3~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~52_combout\ = (\Add2~48_combout\ & (\Add3~51\ $ (GND))) # (!\Add2~48_combout\ & (!\Add3~51\ & VCC))
-- \Add3~53\ = CARRY((\Add2~48_combout\ & !\Add3~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~48_combout\,
	datad => VCC,
	cin => \Add3~51\,
	combout => \Add3~52_combout\,
	cout => \Add3~53\);

-- Location: LCCOMB_X21_Y16_N18
\Selector90~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector90~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~46_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~46_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add3~46_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector90~0_combout\);

-- Location: LCCOMB_X21_Y16_N12
\sqrt_sequential:Rvar[23]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[23]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[23]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector90~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector90~0_combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \sqrt_sequential:Rvar[23]~combout\,
	combout => \sqrt_sequential:Rvar[23]~combout\);

-- Location: LCCOMB_X21_Y16_N16
\Selector87~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector87~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~40_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~40_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add3~40_combout\,
	datad => \Add1~40_combout\,
	combout => \Selector87~0_combout\);

-- Location: LCCOMB_X21_Y16_N30
\sqrt_sequential:Rvar[20]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[20]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[20]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector87~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[20]~combout\,
	datac => \Selector87~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[20]~combout\);

-- Location: LCCOMB_X21_Y17_N20
\Selector86~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector86~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~38_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~38_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~38_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add1~38_combout\,
	combout => \Selector86~0_combout\);

-- Location: LCCOMB_X21_Y17_N6
\sqrt_sequential:Rvar[19]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[19]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[19]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector86~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[19]~combout\,
	datac => \Selector86~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[19]~combout\);

-- Location: LCCOMB_X19_Y16_N16
\Add0~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (Z(23) & ((\sqrt_sequential:Rvar[23]~combout\ & (!\Add0~45\)) # (!\sqrt_sequential:Rvar[23]~combout\ & ((\Add0~45\) # (GND))))) # (!Z(23) & ((\sqrt_sequential:Rvar[23]~combout\ & (\Add0~45\ & VCC)) # 
-- (!\sqrt_sequential:Rvar[23]~combout\ & (!\Add0~45\))))
-- \Add0~47\ = CARRY((Z(23) & ((!\Add0~45\) # (!\sqrt_sequential:Rvar[23]~combout\))) # (!Z(23) & (!\sqrt_sequential:Rvar[23]~combout\ & !\Add0~45\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(23),
	datab => \sqrt_sequential:Rvar[23]~combout\,
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

-- Location: LCCOMB_X19_Y16_N18
\Add0~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = ((Z(24) $ (\sqrt_sequential:Rvar[24]~combout\ $ (\Add0~47\)))) # (GND)
-- \Add0~49\ = CARRY((Z(24) & (\sqrt_sequential:Rvar[24]~combout\ & !\Add0~47\)) # (!Z(24) & ((\sqrt_sequential:Rvar[24]~combout\) # (!\Add0~47\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(24),
	datab => \sqrt_sequential:Rvar[24]~combout\,
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

-- Location: LCCOMB_X20_Y16_N18
\Add1~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~50_combout\ = (\Add0~46_combout\ & (\Add1~49\ & VCC)) # (!\Add0~46_combout\ & (!\Add1~49\))
-- \Add1~51\ = CARRY((!\Add0~46_combout\ & !\Add1~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~46_combout\,
	datad => VCC,
	cin => \Add1~49\,
	combout => \Add1~50_combout\,
	cout => \Add1~51\);

-- Location: LCCOMB_X20_Y16_N20
\Add1~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~52_combout\ = (\Add0~48_combout\ & ((GND) # (!\Add1~51\))) # (!\Add0~48_combout\ & (\Add1~51\ $ (GND)))
-- \Add1~53\ = CARRY((\Add0~48_combout\) # (!\Add1~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~48_combout\,
	datad => VCC,
	cin => \Add1~51\,
	combout => \Add1~52_combout\,
	cout => \Add1~53\);

-- Location: LCCOMB_X21_Y16_N8
\Selector93~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector93~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~52_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~52_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~52_combout\,
	datac => \Add1~52_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector93~0_combout\);

-- Location: LCCOMB_X21_Y16_N6
\sqrt_sequential:Rvar[26]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[26]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[26]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector93~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[26]~combout\,
	datac => \Selector93~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[26]~combout\);

-- Location: LCCOMB_X22_Y16_N22
\Add2~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~52_combout\ = ((Z(26) $ (\sqrt_sequential:Rvar[26]~combout\ $ (!\Add2~51\)))) # (GND)
-- \Add2~53\ = CARRY((Z(26) & ((\sqrt_sequential:Rvar[26]~combout\) # (!\Add2~51\))) # (!Z(26) & (\sqrt_sequential:Rvar[26]~combout\ & !\Add2~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(26),
	datab => \sqrt_sequential:Rvar[26]~combout\,
	datad => VCC,
	cin => \Add2~51\,
	combout => \Add2~52_combout\,
	cout => \Add2~53\);

-- Location: LCCOMB_X22_Y16_N24
\Add2~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~54_combout\ = (\sqrt_sequential:Rvar[27]~combout\ & ((Z(27) & (\Add2~53\ & VCC)) # (!Z(27) & (!\Add2~53\)))) # (!\sqrt_sequential:Rvar[27]~combout\ & ((Z(27) & (!\Add2~53\)) # (!Z(27) & ((\Add2~53\) # (GND)))))
-- \Add2~55\ = CARRY((\sqrt_sequential:Rvar[27]~combout\ & (!Z(27) & !\Add2~53\)) # (!\sqrt_sequential:Rvar[27]~combout\ & ((!\Add2~53\) # (!Z(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[27]~combout\,
	datab => Z(27),
	datad => VCC,
	cin => \Add2~53\,
	combout => \Add2~54_combout\,
	cout => \Add2~55\);

-- Location: LCCOMB_X22_Y16_N26
\Add2~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~56_combout\ = ((\sqrt_sequential:Rvar[28]~combout\ $ (Z(28) $ (!\Add2~55\)))) # (GND)
-- \Add2~57\ = CARRY((\sqrt_sequential:Rvar[28]~combout\ & ((Z(28)) # (!\Add2~55\))) # (!\sqrt_sequential:Rvar[28]~combout\ & (Z(28) & !\Add2~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[28]~combout\,
	datab => Z(28),
	datad => VCC,
	cin => \Add2~55\,
	combout => \Add2~56_combout\,
	cout => \Add2~57\);

-- Location: LCCOMB_X23_Y16_N22
\Add3~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~54_combout\ = (\Add2~50_combout\ & (!\Add3~53\)) # (!\Add2~50_combout\ & ((\Add3~53\) # (GND)))
-- \Add3~55\ = CARRY((!\Add3~53\) # (!\Add2~50_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~50_combout\,
	datad => VCC,
	cin => \Add3~53\,
	combout => \Add3~54_combout\,
	cout => \Add3~55\);

-- Location: LCCOMB_X23_Y16_N24
\Add3~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~56_combout\ = (\Add2~52_combout\ & (\Add3~55\ $ (GND))) # (!\Add2~52_combout\ & (!\Add3~55\ & VCC))
-- \Add3~57\ = CARRY((\Add2~52_combout\ & !\Add3~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~52_combout\,
	datad => VCC,
	cin => \Add3~55\,
	combout => \Add3~56_combout\,
	cout => \Add3~57\);

-- Location: LCCOMB_X23_Y16_N26
\Add3~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~58_combout\ = (\Add2~54_combout\ & (!\Add3~57\)) # (!\Add2~54_combout\ & ((\Add3~57\) # (GND)))
-- \Add3~59\ = CARRY((!\Add3~57\) # (!\Add2~54_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~54_combout\,
	datad => VCC,
	cin => \Add3~57\,
	combout => \Add3~58_combout\,
	cout => \Add3~59\);

-- Location: LCCOMB_X23_Y16_N28
\Add3~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~60_combout\ = (\Add2~56_combout\ & (\Add3~59\ $ (GND))) # (!\Add2~56_combout\ & (!\Add3~59\ & VCC))
-- \Add3~61\ = CARRY((\Add2~56_combout\ & !\Add3~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~56_combout\,
	datad => VCC,
	cin => \Add3~59\,
	combout => \Add3~60_combout\,
	cout => \Add3~61\);

-- Location: LCCOMB_X24_Y16_N8
\Selector97~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector97~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~60_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~60_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~60_combout\,
	datab => \Add3~60_combout\,
	datac => \sqrt_sequential:Rvar[63]~combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector97~0_combout\);

-- Location: LCCOMB_X24_Y16_N0
\sqrt_sequential:Rvar[30]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[30]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[30]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector97~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[30]~combout\,
	datac => \Selector97~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[30]~combout\);

-- Location: LCCOMB_X20_Y16_N22
\Add1~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~54_combout\ = (\Add0~50_combout\ & (\Add1~53\ & VCC)) # (!\Add0~50_combout\ & (!\Add1~53\))
-- \Add1~55\ = CARRY((!\Add0~50_combout\ & !\Add1~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~50_combout\,
	datad => VCC,
	cin => \Add1~53\,
	combout => \Add1~54_combout\,
	cout => \Add1~55\);

-- Location: LCCOMB_X24_Y16_N10
\Selector94~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector94~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~54_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~54_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~54_combout\,
	datac => \Add1~54_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector94~0_combout\);

-- Location: LCCOMB_X24_Y16_N30
\sqrt_sequential:Rvar[27]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[27]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[27]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector94~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[27]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector94~0_combout\,
	combout => \sqrt_sequential:Rvar[27]~combout\);

-- Location: LCCOMB_X21_Y16_N26
\Selector92~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector92~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~50_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~50_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add3~50_combout\,
	combout => \Selector92~0_combout\);

-- Location: LCCOMB_X21_Y16_N20
\sqrt_sequential:Rvar[25]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[25]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[25]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector92~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector92~0_combout\,
	datac => \sqrt_sequential:Rvar[25]~combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[25]~combout\);

-- Location: LCCOMB_X19_Y16_N22
\Add0~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = ((\sqrt_sequential:Rvar[26]~combout\ $ (Z(26) $ (\Add0~51\)))) # (GND)
-- \Add0~53\ = CARRY((\sqrt_sequential:Rvar[26]~combout\ & ((!\Add0~51\) # (!Z(26)))) # (!\sqrt_sequential:Rvar[26]~combout\ & (!Z(26) & !\Add0~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[26]~combout\,
	datab => Z(26),
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

-- Location: LCCOMB_X19_Y16_N24
\Add0~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (Z(27) & ((\sqrt_sequential:Rvar[27]~combout\ & (!\Add0~53\)) # (!\sqrt_sequential:Rvar[27]~combout\ & ((\Add0~53\) # (GND))))) # (!Z(27) & ((\sqrt_sequential:Rvar[27]~combout\ & (\Add0~53\ & VCC)) # 
-- (!\sqrt_sequential:Rvar[27]~combout\ & (!\Add0~53\))))
-- \Add0~55\ = CARRY((Z(27) & ((!\Add0~53\) # (!\sqrt_sequential:Rvar[27]~combout\))) # (!Z(27) & (!\sqrt_sequential:Rvar[27]~combout\ & !\Add0~53\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(27),
	datab => \sqrt_sequential:Rvar[27]~combout\,
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

-- Location: LCCOMB_X20_Y16_N26
\Add1~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~58_combout\ = (\Add0~54_combout\ & (\Add1~57\ & VCC)) # (!\Add0~54_combout\ & (!\Add1~57\))
-- \Add1~59\ = CARRY((!\Add0~54_combout\ & !\Add1~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~54_combout\,
	datad => VCC,
	cin => \Add1~57\,
	combout => \Add1~58_combout\,
	cout => \Add1~59\);

-- Location: LCCOMB_X24_Y16_N14
\Selector96~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector96~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~58_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.exec_state~regout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add1~58_combout\,
	datad => \Add3~58_combout\,
	combout => \Selector96~0_combout\);

-- Location: LCCOMB_X24_Y16_N22
\sqrt_sequential:Rvar[29]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[29]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[29]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector96~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[29]~combout\,
	datac => \Selector96~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[29]~combout\);

-- Location: LCCOMB_X24_Y16_N24
\Selector95~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector95~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~56_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~56_combout\,
	datab => \Add3~56_combout\,
	datac => \sqrt_sequential:Rvar[63]~combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector95~0_combout\);

-- Location: LCCOMB_X24_Y16_N12
\sqrt_sequential:Rvar[28]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[28]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[28]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector95~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[28]~combout\,
	datac => \Selector95~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[28]~combout\);

-- Location: LCCOMB_X19_Y16_N26
\Add0~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = ((Z(28) $ (\sqrt_sequential:Rvar[28]~combout\ $ (\Add0~55\)))) # (GND)
-- \Add0~57\ = CARRY((Z(28) & (\sqrt_sequential:Rvar[28]~combout\ & !\Add0~55\)) # (!Z(28) & ((\sqrt_sequential:Rvar[28]~combout\) # (!\Add0~55\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(28),
	datab => \sqrt_sequential:Rvar[28]~combout\,
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

-- Location: LCCOMB_X19_Y16_N28
\Add0~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (Z(29) & ((\sqrt_sequential:Rvar[29]~combout\ & (!\Add0~57\)) # (!\sqrt_sequential:Rvar[29]~combout\ & ((\Add0~57\) # (GND))))) # (!Z(29) & ((\sqrt_sequential:Rvar[29]~combout\ & (\Add0~57\ & VCC)) # 
-- (!\sqrt_sequential:Rvar[29]~combout\ & (!\Add0~57\))))
-- \Add0~59\ = CARRY((Z(29) & ((!\Add0~57\) # (!\sqrt_sequential:Rvar[29]~combout\))) # (!Z(29) & (!\sqrt_sequential:Rvar[29]~combout\ & !\Add0~57\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(29),
	datab => \sqrt_sequential:Rvar[29]~combout\,
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

-- Location: LCCOMB_X19_Y16_N30
\Add0~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = ((Z(30) $ (\sqrt_sequential:Rvar[30]~combout\ $ (\Add0~59\)))) # (GND)
-- \Add0~61\ = CARRY((Z(30) & (\sqrt_sequential:Rvar[30]~combout\ & !\Add0~59\)) # (!Z(30) & ((\sqrt_sequential:Rvar[30]~combout\) # (!\Add0~59\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(30),
	datab => \sqrt_sequential:Rvar[30]~combout\,
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

-- Location: LCCOMB_X20_Y16_N30
\Add1~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~62_combout\ = (\Add0~58_combout\ & (\Add1~61\ & VCC)) # (!\Add0~58_combout\ & (!\Add1~61\))
-- \Add1~63\ = CARRY((!\Add0~58_combout\ & !\Add1~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~58_combout\,
	datad => VCC,
	cin => \Add1~61\,
	combout => \Add1~62_combout\,
	cout => \Add1~63\);

-- Location: LCCOMB_X20_Y15_N2
\Add1~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~66_combout\ = (\Add0~62_combout\ & (\Add1~65\ & VCC)) # (!\Add0~62_combout\ & (!\Add1~65\))
-- \Add1~67\ = CARRY((!\Add0~62_combout\ & !\Add1~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~62_combout\,
	datad => VCC,
	cin => \Add1~65\,
	combout => \Add1~66_combout\,
	cout => \Add1~67\);

-- Location: LCCOMB_X20_Y13_N30
\Selector64~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector64~0_combout\ = (Z(28) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(28),
	datad => \current_state.exec_state~regout\,
	combout => \Selector64~0_combout\);

-- Location: LCCOMB_X20_Y13_N0
\Zin[29]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(29) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(29)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector64~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector64~0_combout\,
	datac => Zin(29),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(29));

-- Location: LCCOMB_X20_Y13_N2
\Z[29]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z[29]~feeder_combout\ = Zin(29)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => Zin(29),
	combout => \Z[29]~feeder_combout\);

-- Location: LCFF_X20_Y13_N3
\Z[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Z[29]~feeder_combout\,
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(29));

-- Location: LCCOMB_X18_Y13_N22
\Selector65~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector65~0_combout\ = (Z(29) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(29),
	datad => \current_state.exec_state~regout\,
	combout => \Selector65~0_combout\);

-- Location: LCCOMB_X18_Y13_N28
\Zin[30]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(30) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Zin(30)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector65~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector65~0_combout\,
	datac => Zin(30),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(30));

-- Location: LCFF_X18_Y13_N29
\Z[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(30),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(30));

-- Location: LCCOMB_X22_Y16_N28
\Add2~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~58_combout\ = (Z(29) & ((\sqrt_sequential:Rvar[29]~combout\ & (\Add2~57\ & VCC)) # (!\sqrt_sequential:Rvar[29]~combout\ & (!\Add2~57\)))) # (!Z(29) & ((\sqrt_sequential:Rvar[29]~combout\ & (!\Add2~57\)) # (!\sqrt_sequential:Rvar[29]~combout\ & 
-- ((\Add2~57\) # (GND)))))
-- \Add2~59\ = CARRY((Z(29) & (!\sqrt_sequential:Rvar[29]~combout\ & !\Add2~57\)) # (!Z(29) & ((!\Add2~57\) # (!\sqrt_sequential:Rvar[29]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Z(29),
	datab => \sqrt_sequential:Rvar[29]~combout\,
	datad => VCC,
	cin => \Add2~57\,
	combout => \Add2~58_combout\,
	cout => \Add2~59\);

-- Location: LCCOMB_X22_Y16_N30
\Add2~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~60_combout\ = ((\sqrt_sequential:Rvar[30]~combout\ $ (Z(30) $ (!\Add2~59\)))) # (GND)
-- \Add2~61\ = CARRY((\sqrt_sequential:Rvar[30]~combout\ & ((Z(30)) # (!\Add2~59\))) # (!\sqrt_sequential:Rvar[30]~combout\ & (Z(30) & !\Add2~59\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[30]~combout\,
	datab => Z(30),
	datad => VCC,
	cin => \Add2~59\,
	combout => \Add2~60_combout\,
	cout => \Add2~61\);

-- Location: LCCOMB_X23_Y15_N0
\Add3~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~64_combout\ = (\Add2~60_combout\ & (\Add3~63\ $ (GND))) # (!\Add2~60_combout\ & (!\Add3~63\ & VCC))
-- \Add3~65\ = CARRY((\Add2~60_combout\ & !\Add3~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~60_combout\,
	datad => VCC,
	cin => \Add3~63\,
	combout => \Add3~64_combout\,
	cout => \Add3~65\);

-- Location: LCCOMB_X23_Y15_N2
\Add3~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~66_combout\ = (\Add2~62_combout\ & (!\Add3~65\)) # (!\Add2~62_combout\ & ((\Add3~65\) # (GND)))
-- \Add3~67\ = CARRY((!\Add3~65\) # (!\Add2~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~62_combout\,
	datad => VCC,
	cin => \Add3~65\,
	combout => \Add3~66_combout\,
	cout => \Add3~67\);

-- Location: LCCOMB_X24_Y15_N6
\Selector100~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector100~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~66_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~66_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~66_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add3~66_combout\,
	combout => \Selector100~0_combout\);

-- Location: LCCOMB_X24_Y15_N30
\sqrt_sequential:Rvar[33]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[33]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[33]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector100~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[33]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector100~0_combout\,
	combout => \sqrt_sequential:Rvar[33]~combout\);

-- Location: LCCOMB_X24_Y16_N16
\Selector99~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector99~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~64_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~64_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~64_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add3~64_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector99~0_combout\);

-- Location: LCCOMB_X24_Y16_N4
\sqrt_sequential:Rvar[32]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[32]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[32]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector99~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[32]~combout\,
	datac => \Selector99~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[32]~combout\);

-- Location: LCCOMB_X24_Y16_N26
\Selector98~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector98~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~62_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~62_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~62_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add1~62_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector98~0_combout\);

-- Location: LCCOMB_X24_Y16_N18
\sqrt_sequential:Rvar[31]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[31]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[31]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector98~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector98~0_combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \sqrt_sequential:Rvar[31]~combout\,
	combout => \sqrt_sequential:Rvar[31]~combout\);

-- Location: LCCOMB_X19_Y15_N4
\Add0~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~66_combout\ = (\sqrt_sequential:Rvar[33]~combout\ & (\Add0~65\ & VCC)) # (!\sqrt_sequential:Rvar[33]~combout\ & (!\Add0~65\))
-- \Add0~67\ = CARRY((!\sqrt_sequential:Rvar[33]~combout\ & !\Add0~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[33]~combout\,
	datad => VCC,
	cin => \Add0~65\,
	combout => \Add0~66_combout\,
	cout => \Add0~67\);

-- Location: LCCOMB_X19_Y15_N6
\Add0~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~68_combout\ = (\sqrt_sequential:Rvar[34]~combout\ & ((GND) # (!\Add0~67\))) # (!\sqrt_sequential:Rvar[34]~combout\ & (\Add0~67\ $ (GND)))
-- \Add0~69\ = CARRY((\sqrt_sequential:Rvar[34]~combout\) # (!\Add0~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[34]~combout\,
	datad => VCC,
	cin => \Add0~67\,
	combout => \Add0~68_combout\,
	cout => \Add0~69\);

-- Location: LCCOMB_X20_Y15_N4
\Add1~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~68_combout\ = (\Add0~64_combout\ & ((GND) # (!\Add1~67\))) # (!\Add0~64_combout\ & (\Add1~67\ $ (GND)))
-- \Add1~69\ = CARRY((\Add0~64_combout\) # (!\Add1~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~64_combout\,
	datad => VCC,
	cin => \Add1~67\,
	combout => \Add1~68_combout\,
	cout => \Add1~69\);

-- Location: LCCOMB_X20_Y15_N8
\Add1~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~72_combout\ = (\Add0~68_combout\ & ((GND) # (!\Add1~71\))) # (!\Add0~68_combout\ & (\Add1~71\ $ (GND)))
-- \Add1~73\ = CARRY((\Add0~68_combout\) # (!\Add1~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~68_combout\,
	datad => VCC,
	cin => \Add1~71\,
	combout => \Add1~72_combout\,
	cout => \Add1~73\);

-- Location: LCCOMB_X20_Y15_N10
\Add1~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~74_combout\ = (\Add0~70_combout\ & (\Add1~73\ & VCC)) # (!\Add0~70_combout\ & (!\Add1~73\))
-- \Add1~75\ = CARRY((!\Add0~70_combout\ & !\Add1~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~70_combout\,
	datad => VCC,
	cin => \Add1~73\,
	combout => \Add1~74_combout\,
	cout => \Add1~75\);

-- Location: LCCOMB_X20_Y15_N12
\Add1~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~76_combout\ = (\Add0~72_combout\ & ((GND) # (!\Add1~75\))) # (!\Add0~72_combout\ & (\Add1~75\ $ (GND)))
-- \Add1~77\ = CARRY((\Add0~72_combout\) # (!\Add1~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~72_combout\,
	datad => VCC,
	cin => \Add1~75\,
	combout => \Add1~76_combout\,
	cout => \Add1~77\);

-- Location: LCCOMB_X20_Y15_N14
\Add1~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~78_combout\ = (\Add0~74_combout\ & (\Add1~77\ & VCC)) # (!\Add0~74_combout\ & (!\Add1~77\))
-- \Add1~79\ = CARRY((!\Add0~74_combout\ & !\Add1~77\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~74_combout\,
	datad => VCC,
	cin => \Add1~77\,
	combout => \Add1~78_combout\,
	cout => \Add1~79\);

-- Location: LCCOMB_X20_Y15_N16
\Add1~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~80_combout\ = (\Add0~76_combout\ & ((GND) # (!\Add1~79\))) # (!\Add0~76_combout\ & (\Add1~79\ $ (GND)))
-- \Add1~81\ = CARRY((\Add0~76_combout\) # (!\Add1~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~76_combout\,
	datad => VCC,
	cin => \Add1~79\,
	combout => \Add1~80_combout\,
	cout => \Add1~81\);

-- Location: LCCOMB_X22_Y13_N14
\Selector66~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector66~0_combout\ = (Z(30) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Z(30),
	datad => \current_state.exec_state~regout\,
	combout => \Selector66~0_combout\);

-- Location: LCCOMB_X22_Y13_N22
\Zin[31]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(31) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(31))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector66~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zin(31),
	datac => \Selector66~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => Zin(31));

-- Location: LCCOMB_X22_Y13_N28
\Z[31]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z[31]~feeder_combout\ = Zin(31)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => Zin(31),
	combout => \Z[31]~feeder_combout\);

-- Location: LCFF_X22_Y13_N29
\Z[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \Z[31]~feeder_combout\,
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(31));

-- Location: LCCOMB_X22_Y15_N4
\Add2~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~66_combout\ = (\sqrt_sequential:Rvar[33]~combout\ & (!\Add2~65\)) # (!\sqrt_sequential:Rvar[33]~combout\ & ((\Add2~65\) # (GND)))
-- \Add2~67\ = CARRY((!\Add2~65\) # (!\sqrt_sequential:Rvar[33]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[33]~combout\,
	datad => VCC,
	cin => \Add2~65\,
	combout => \Add2~66_combout\,
	cout => \Add2~67\);

-- Location: LCCOMB_X23_Y15_N4
\Add3~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~68_combout\ = (\Add2~64_combout\ & (\Add3~67\ $ (GND))) # (!\Add2~64_combout\ & (!\Add3~67\ & VCC))
-- \Add3~69\ = CARRY((\Add2~64_combout\ & !\Add3~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~64_combout\,
	datad => VCC,
	cin => \Add3~67\,
	combout => \Add3~68_combout\,
	cout => \Add3~69\);

-- Location: LCCOMB_X23_Y15_N6
\Add3~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~70_combout\ = (\Add2~66_combout\ & (!\Add3~69\)) # (!\Add2~66_combout\ & ((\Add3~69\) # (GND)))
-- \Add3~71\ = CARRY((!\Add3~69\) # (!\Add2~66_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~66_combout\,
	datad => VCC,
	cin => \Add3~69\,
	combout => \Add3~70_combout\,
	cout => \Add3~71\);

-- Location: LCCOMB_X23_Y15_N8
\Add3~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~72_combout\ = (\Add2~68_combout\ & (\Add3~71\ $ (GND))) # (!\Add2~68_combout\ & (!\Add3~71\ & VCC))
-- \Add3~73\ = CARRY((\Add2~68_combout\ & !\Add3~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~68_combout\,
	datad => VCC,
	cin => \Add3~71\,
	combout => \Add3~72_combout\,
	cout => \Add3~73\);

-- Location: LCCOMB_X23_Y15_N10
\Add3~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~74_combout\ = (\Add2~70_combout\ & (!\Add3~73\)) # (!\Add2~70_combout\ & ((\Add3~73\) # (GND)))
-- \Add3~75\ = CARRY((!\Add3~73\) # (!\Add2~70_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~70_combout\,
	datad => VCC,
	cin => \Add3~73\,
	combout => \Add3~74_combout\,
	cout => \Add3~75\);

-- Location: LCCOMB_X23_Y15_N12
\Add3~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~76_combout\ = (\Add2~72_combout\ & (\Add3~75\ $ (GND))) # (!\Add2~72_combout\ & (!\Add3~75\ & VCC))
-- \Add3~77\ = CARRY((\Add2~72_combout\ & !\Add3~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~72_combout\,
	datad => VCC,
	cin => \Add3~75\,
	combout => \Add3~76_combout\,
	cout => \Add3~77\);

-- Location: LCCOMB_X23_Y15_N14
\Add3~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~78_combout\ = (\Add2~74_combout\ & (!\Add3~77\)) # (!\Add2~74_combout\ & ((\Add3~77\) # (GND)))
-- \Add3~79\ = CARRY((!\Add3~77\) # (!\Add2~74_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~74_combout\,
	datad => VCC,
	cin => \Add3~77\,
	combout => \Add3~78_combout\,
	cout => \Add3~79\);

-- Location: LCCOMB_X23_Y15_N16
\Add3~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~80_combout\ = (\Add2~76_combout\ & (\Add3~79\ $ (GND))) # (!\Add2~76_combout\ & (!\Add3~79\ & VCC))
-- \Add3~81\ = CARRY((\Add2~76_combout\ & !\Add3~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~76_combout\,
	datad => VCC,
	cin => \Add3~79\,
	combout => \Add3~80_combout\,
	cout => \Add3~81\);

-- Location: LCCOMB_X24_Y15_N4
\Selector107~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector107~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~80_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~80_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add1~80_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add3~80_combout\,
	combout => \Selector107~0_combout\);

-- Location: LCCOMB_X24_Y15_N12
\sqrt_sequential:Rvar[40]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[40]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[40]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector107~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[40]~combout\,
	datac => \Selector107~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[40]~combout\);

-- Location: LCCOMB_X24_Y15_N14
\Selector106~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector106~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~78_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~78_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~78_combout\,
	datad => \Add3~78_combout\,
	combout => \Selector106~0_combout\);

-- Location: LCCOMB_X24_Y15_N22
\sqrt_sequential:Rvar[39]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[39]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[39]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector106~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[39]~combout\,
	datac => \Selector106~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[39]~combout\);

-- Location: LCCOMB_X24_Y15_N8
\Selector105~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector105~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~76_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~76_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~76_combout\,
	datad => \Add3~76_combout\,
	combout => \Selector105~0_combout\);

-- Location: LCCOMB_X24_Y15_N20
\sqrt_sequential:Rvar[38]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[38]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[38]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector105~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector105~0_combout\,
	datac => \sqrt_sequential:Rvar[38]~combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[38]~combout\);

-- Location: LCCOMB_X24_Y15_N16
\Selector103~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector103~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~72_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~72_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~72_combout\,
	datad => \Add3~72_combout\,
	combout => \Selector103~0_combout\);

-- Location: LCCOMB_X24_Y15_N28
\sqrt_sequential:Rvar[36]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[36]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[36]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector103~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[36]~combout\,
	datac => \Selector103~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[36]~combout\);

-- Location: LCCOMB_X24_Y15_N24
\Selector101~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector101~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~68_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~68_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~68_combout\,
	datad => \Add1~68_combout\,
	combout => \Selector101~0_combout\);

-- Location: LCCOMB_X24_Y15_N0
\sqrt_sequential:Rvar[34]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[34]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[34]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector101~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[34]~combout\,
	datac => \Selector101~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[34]~combout\);

-- Location: LCCOMB_X22_Y15_N16
\Add2~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~78_combout\ = (\sqrt_sequential:Rvar[39]~combout\ & (!\Add2~77\)) # (!\sqrt_sequential:Rvar[39]~combout\ & ((\Add2~77\) # (GND)))
-- \Add2~79\ = CARRY((!\Add2~77\) # (!\sqrt_sequential:Rvar[39]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[39]~combout\,
	datad => VCC,
	cin => \Add2~77\,
	combout => \Add2~78_combout\,
	cout => \Add2~79\);

-- Location: LCCOMB_X22_Y15_N18
\Add2~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~80_combout\ = (\sqrt_sequential:Rvar[40]~combout\ & (\Add2~79\ $ (GND))) # (!\sqrt_sequential:Rvar[40]~combout\ & (!\Add2~79\ & VCC))
-- \Add2~81\ = CARRY((\sqrt_sequential:Rvar[40]~combout\ & !\Add2~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[40]~combout\,
	datad => VCC,
	cin => \Add2~79\,
	combout => \Add2~80_combout\,
	cout => \Add2~81\);

-- Location: LCCOMB_X22_Y15_N22
\Add2~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~84_combout\ = (\sqrt_sequential:Rvar[42]~combout\ & (\Add2~83\ $ (GND))) # (!\sqrt_sequential:Rvar[42]~combout\ & (!\Add2~83\ & VCC))
-- \Add2~85\ = CARRY((\sqrt_sequential:Rvar[42]~combout\ & !\Add2~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[42]~combout\,
	datad => VCC,
	cin => \Add2~83\,
	combout => \Add2~84_combout\,
	cout => \Add2~85\);

-- Location: LCCOMB_X22_Y15_N24
\Add2~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~86_combout\ = (\sqrt_sequential:Rvar[43]~combout\ & (!\Add2~85\)) # (!\sqrt_sequential:Rvar[43]~combout\ & ((\Add2~85\) # (GND)))
-- \Add2~87\ = CARRY((!\Add2~85\) # (!\sqrt_sequential:Rvar[43]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[43]~combout\,
	datad => VCC,
	cin => \Add2~85\,
	combout => \Add2~86_combout\,
	cout => \Add2~87\);

-- Location: LCCOMB_X23_Y15_N20
\Add3~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~84_combout\ = (\Add2~80_combout\ & (\Add3~83\ $ (GND))) # (!\Add2~80_combout\ & (!\Add3~83\ & VCC))
-- \Add3~85\ = CARRY((\Add2~80_combout\ & !\Add3~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~80_combout\,
	datad => VCC,
	cin => \Add3~83\,
	combout => \Add3~84_combout\,
	cout => \Add3~85\);

-- Location: LCCOMB_X23_Y15_N22
\Add3~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~86_combout\ = (\Add2~82_combout\ & (!\Add3~85\)) # (!\Add2~82_combout\ & ((\Add3~85\) # (GND)))
-- \Add3~87\ = CARRY((!\Add3~85\) # (!\Add2~82_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~82_combout\,
	datad => VCC,
	cin => \Add3~85\,
	combout => \Add3~86_combout\,
	cout => \Add3~87\);

-- Location: LCCOMB_X23_Y15_N24
\Add3~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~88_combout\ = (\Add2~84_combout\ & (\Add3~87\ $ (GND))) # (!\Add2~84_combout\ & (!\Add3~87\ & VCC))
-- \Add3~89\ = CARRY((\Add2~84_combout\ & !\Add3~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~84_combout\,
	datad => VCC,
	cin => \Add3~87\,
	combout => \Add3~88_combout\,
	cout => \Add3~89\);

-- Location: LCCOMB_X23_Y15_N26
\Add3~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~90_combout\ = (\Add2~86_combout\ & (!\Add3~89\)) # (!\Add2~86_combout\ & ((\Add3~89\) # (GND)))
-- \Add3~91\ = CARRY((!\Add3~89\) # (!\Add2~86_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~86_combout\,
	datad => VCC,
	cin => \Add3~89\,
	combout => \Add3~90_combout\,
	cout => \Add3~91\);

-- Location: LCCOMB_X24_Y15_N2
\Selector104~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector104~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~74_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~74_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~74_combout\,
	datad => \Add3~74_combout\,
	combout => \Selector104~0_combout\);

-- Location: LCCOMB_X24_Y15_N18
\sqrt_sequential:Rvar[37]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[37]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[37]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector104~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector104~0_combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \sqrt_sequential:Rvar[37]~combout\,
	combout => \sqrt_sequential:Rvar[37]~combout\);

-- Location: LCCOMB_X24_Y15_N26
\Selector102~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector102~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~70_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~70_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~70_combout\,
	datab => \Add3~70_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \sqrt_sequential:Rvar[63]~combout\,
	combout => \Selector102~0_combout\);

-- Location: LCCOMB_X24_Y15_N10
\sqrt_sequential:Rvar[35]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[35]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[35]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector102~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector102~0_combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \sqrt_sequential:Rvar[35]~combout\,
	combout => \sqrt_sequential:Rvar[35]~combout\);

-- Location: LCCOMB_X19_Y15_N16
\Add0~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~78_combout\ = (\sqrt_sequential:Rvar[39]~combout\ & (\Add0~77\ & VCC)) # (!\sqrt_sequential:Rvar[39]~combout\ & (!\Add0~77\))
-- \Add0~79\ = CARRY((!\sqrt_sequential:Rvar[39]~combout\ & !\Add0~77\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[39]~combout\,
	datad => VCC,
	cin => \Add0~77\,
	combout => \Add0~78_combout\,
	cout => \Add0~79\);

-- Location: LCCOMB_X19_Y15_N18
\Add0~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~80_combout\ = (\sqrt_sequential:Rvar[40]~combout\ & ((GND) # (!\Add0~79\))) # (!\sqrt_sequential:Rvar[40]~combout\ & (\Add0~79\ $ (GND)))
-- \Add0~81\ = CARRY((\sqrt_sequential:Rvar[40]~combout\) # (!\Add0~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[40]~combout\,
	datad => VCC,
	cin => \Add0~79\,
	combout => \Add0~80_combout\,
	cout => \Add0~81\);

-- Location: LCCOMB_X20_Y15_N20
\Add1~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~84_combout\ = (\Add0~80_combout\ & ((GND) # (!\Add1~83\))) # (!\Add0~80_combout\ & (\Add1~83\ $ (GND)))
-- \Add1~85\ = CARRY((\Add0~80_combout\) # (!\Add1~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~80_combout\,
	datad => VCC,
	cin => \Add1~83\,
	combout => \Add1~84_combout\,
	cout => \Add1~85\);

-- Location: LCCOMB_X20_Y15_N22
\Add1~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~86_combout\ = (\Add0~82_combout\ & (\Add1~85\ & VCC)) # (!\Add0~82_combout\ & (!\Add1~85\))
-- \Add1~87\ = CARRY((!\Add0~82_combout\ & !\Add1~85\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~82_combout\,
	datad => VCC,
	cin => \Add1~85\,
	combout => \Add1~86_combout\,
	cout => \Add1~87\);

-- Location: LCCOMB_X21_Y15_N4
\Selector110~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector110~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~86_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~86_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~86_combout\,
	datad => \Add1~86_combout\,
	combout => \Selector110~0_combout\);

-- Location: LCCOMB_X21_Y15_N12
\sqrt_sequential:Rvar[43]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[43]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[43]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector110~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[43]~combout\,
	datab => \Selector110~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[43]~combout\);

-- Location: LCCOMB_X21_Y15_N14
\Selector109~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector109~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~84_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~84_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~84_combout\,
	datad => \Add3~84_combout\,
	combout => \Selector109~0_combout\);

-- Location: LCCOMB_X21_Y15_N30
\sqrt_sequential:Rvar[42]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[42]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[42]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector109~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[42]~combout\,
	datac => \Selector109~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[42]~combout\);

-- Location: LCCOMB_X21_Y15_N20
\sqrt_sequential:Rvar[41]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[41]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[41]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector108~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector108~0_combout\,
	datac => \sqrt_sequential:Rvar[41]~combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[41]~combout\);

-- Location: LCCOMB_X19_Y15_N22
\Add0~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~84_combout\ = (\sqrt_sequential:Rvar[42]~combout\ & ((GND) # (!\Add0~83\))) # (!\sqrt_sequential:Rvar[42]~combout\ & (\Add0~83\ $ (GND)))
-- \Add0~85\ = CARRY((\sqrt_sequential:Rvar[42]~combout\) # (!\Add0~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[42]~combout\,
	datad => VCC,
	cin => \Add0~83\,
	combout => \Add0~84_combout\,
	cout => \Add0~85\);

-- Location: LCCOMB_X19_Y15_N24
\Add0~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~86_combout\ = (\sqrt_sequential:Rvar[43]~combout\ & (\Add0~85\ & VCC)) # (!\sqrt_sequential:Rvar[43]~combout\ & (!\Add0~85\))
-- \Add0~87\ = CARRY((!\sqrt_sequential:Rvar[43]~combout\ & !\Add0~85\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[43]~combout\,
	datad => VCC,
	cin => \Add0~85\,
	combout => \Add0~86_combout\,
	cout => \Add0~87\);

-- Location: LCCOMB_X20_Y15_N24
\Add1~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~88_combout\ = (\Add0~84_combout\ & ((GND) # (!\Add1~87\))) # (!\Add0~84_combout\ & (\Add1~87\ $ (GND)))
-- \Add1~89\ = CARRY((\Add0~84_combout\) # (!\Add1~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~84_combout\,
	datad => VCC,
	cin => \Add1~87\,
	combout => \Add1~88_combout\,
	cout => \Add1~89\);

-- Location: LCCOMB_X20_Y15_N26
\Add1~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~90_combout\ = (\Add0~86_combout\ & (\Add1~89\ & VCC)) # (!\Add0~86_combout\ & (!\Add1~89\))
-- \Add1~91\ = CARRY((!\Add0~86_combout\ & !\Add1~89\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~86_combout\,
	datad => VCC,
	cin => \Add1~89\,
	combout => \Add1~90_combout\,
	cout => \Add1~91\);

-- Location: LCCOMB_X21_Y15_N24
\Selector112~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector112~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~90_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~90_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~90_combout\,
	datad => \Add1~90_combout\,
	combout => \Selector112~0_combout\);

-- Location: LCCOMB_X21_Y15_N28
\sqrt_sequential:Rvar[45]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[45]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[45]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector112~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[45]~combout\,
	datac => \Selector112~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[45]~combout\);

-- Location: LCCOMB_X21_Y15_N2
\Selector111~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector111~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~88_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~88_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~88_combout\,
	datad => \Add1~88_combout\,
	combout => \Selector111~0_combout\);

-- Location: LCCOMB_X21_Y15_N6
\sqrt_sequential:Rvar[44]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[44]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[44]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector111~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[44]~combout\,
	datab => \Selector111~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[44]~combout\);

-- Location: LCCOMB_X22_Y15_N26
\Add2~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~88_combout\ = (\sqrt_sequential:Rvar[44]~combout\ & (\Add2~87\ $ (GND))) # (!\sqrt_sequential:Rvar[44]~combout\ & (!\Add2~87\ & VCC))
-- \Add2~89\ = CARRY((\sqrt_sequential:Rvar[44]~combout\ & !\Add2~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[44]~combout\,
	datad => VCC,
	cin => \Add2~87\,
	combout => \Add2~88_combout\,
	cout => \Add2~89\);

-- Location: LCCOMB_X22_Y15_N28
\Add2~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~90_combout\ = (\sqrt_sequential:Rvar[45]~combout\ & (!\Add2~89\)) # (!\sqrt_sequential:Rvar[45]~combout\ & ((\Add2~89\) # (GND)))
-- \Add2~91\ = CARRY((!\Add2~89\) # (!\sqrt_sequential:Rvar[45]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[45]~combout\,
	datad => VCC,
	cin => \Add2~89\,
	combout => \Add2~90_combout\,
	cout => \Add2~91\);

-- Location: LCCOMB_X23_Y15_N28
\Add3~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~92_combout\ = (\Add2~88_combout\ & (\Add3~91\ $ (GND))) # (!\Add2~88_combout\ & (!\Add3~91\ & VCC))
-- \Add3~93\ = CARRY((\Add2~88_combout\ & !\Add3~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~88_combout\,
	datad => VCC,
	cin => \Add3~91\,
	combout => \Add3~92_combout\,
	cout => \Add3~93\);

-- Location: LCCOMB_X23_Y15_N30
\Add3~94\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~94_combout\ = (\Add2~90_combout\ & (!\Add3~93\)) # (!\Add2~90_combout\ & ((\Add3~93\) # (GND)))
-- \Add3~95\ = CARRY((!\Add3~93\) # (!\Add2~90_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~90_combout\,
	datad => VCC,
	cin => \Add3~93\,
	combout => \Add3~94_combout\,
	cout => \Add3~95\);

-- Location: LCCOMB_X23_Y14_N0
\Add3~96\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~96_combout\ = (\Add2~92_combout\ & (\Add3~95\ $ (GND))) # (!\Add2~92_combout\ & (!\Add3~95\ & VCC))
-- \Add3~97\ = CARRY((\Add2~92_combout\ & !\Add3~95\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~92_combout\,
	datad => VCC,
	cin => \Add3~95\,
	combout => \Add3~96_combout\,
	cout => \Add3~97\);

-- Location: LCCOMB_X23_Y14_N2
\Add3~98\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~98_combout\ = (\Add2~94_combout\ & (!\Add3~97\)) # (!\Add2~94_combout\ & ((\Add3~97\) # (GND)))
-- \Add3~99\ = CARRY((!\Add3~97\) # (!\Add2~94_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~94_combout\,
	datad => VCC,
	cin => \Add3~97\,
	combout => \Add3~98_combout\,
	cout => \Add3~99\);

-- Location: LCCOMB_X23_Y14_N4
\Add3~100\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~100_combout\ = (\Add2~96_combout\ & (\Add3~99\ $ (GND))) # (!\Add2~96_combout\ & (!\Add3~99\ & VCC))
-- \Add3~101\ = CARRY((\Add2~96_combout\ & !\Add3~99\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~96_combout\,
	datad => VCC,
	cin => \Add3~99\,
	combout => \Add3~100_combout\,
	cout => \Add3~101\);

-- Location: LCCOMB_X19_Y15_N26
\Add0~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~88_combout\ = (\sqrt_sequential:Rvar[44]~combout\ & ((GND) # (!\Add0~87\))) # (!\sqrt_sequential:Rvar[44]~combout\ & (\Add0~87\ $ (GND)))
-- \Add0~89\ = CARRY((\sqrt_sequential:Rvar[44]~combout\) # (!\Add0~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[44]~combout\,
	datad => VCC,
	cin => \Add0~87\,
	combout => \Add0~88_combout\,
	cout => \Add0~89\);

-- Location: LCCOMB_X19_Y15_N28
\Add0~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~90_combout\ = (\sqrt_sequential:Rvar[45]~combout\ & (\Add0~89\ & VCC)) # (!\sqrt_sequential:Rvar[45]~combout\ & (!\Add0~89\))
-- \Add0~91\ = CARRY((!\sqrt_sequential:Rvar[45]~combout\ & !\Add0~89\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[45]~combout\,
	datad => VCC,
	cin => \Add0~89\,
	combout => \Add0~90_combout\,
	cout => \Add0~91\);

-- Location: LCCOMB_X20_Y15_N28
\Add1~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~92_combout\ = (\Add0~88_combout\ & ((GND) # (!\Add1~91\))) # (!\Add0~88_combout\ & (\Add1~91\ $ (GND)))
-- \Add1~93\ = CARRY((\Add0~88_combout\) # (!\Add1~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~88_combout\,
	datad => VCC,
	cin => \Add1~91\,
	combout => \Add1~92_combout\,
	cout => \Add1~93\);

-- Location: LCCOMB_X20_Y15_N30
\Add1~94\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~94_combout\ = (\Add0~90_combout\ & (\Add1~93\ & VCC)) # (!\Add0~90_combout\ & (!\Add1~93\))
-- \Add1~95\ = CARRY((!\Add0~90_combout\ & !\Add1~93\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~90_combout\,
	datad => VCC,
	cin => \Add1~93\,
	combout => \Add1~94_combout\,
	cout => \Add1~95\);

-- Location: LCCOMB_X21_Y15_N8
\Selector114~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector114~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~94_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~94_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~94_combout\,
	datad => \Add3~94_combout\,
	combout => \Selector114~0_combout\);

-- Location: LCCOMB_X21_Y15_N0
\sqrt_sequential:Rvar[47]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[47]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[47]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector114~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[47]~combout\,
	datac => \Selector114~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[47]~combout\);

-- Location: LCCOMB_X21_Y15_N18
\Selector113~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector113~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~92_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~92_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~92_combout\,
	datad => \Add1~92_combout\,
	combout => \Selector113~0_combout\);

-- Location: LCCOMB_X21_Y15_N10
\sqrt_sequential:Rvar[46]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[46]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\sqrt_sequential:Rvar[46]~combout\))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Selector113~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector113~0_combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \sqrt_sequential:Rvar[46]~combout\,
	combout => \sqrt_sequential:Rvar[46]~combout\);

-- Location: LCCOMB_X19_Y14_N0
\Add0~94\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~94_combout\ = (\sqrt_sequential:Rvar[47]~combout\ & (\Add0~93\ & VCC)) # (!\sqrt_sequential:Rvar[47]~combout\ & (!\Add0~93\))
-- \Add0~95\ = CARRY((!\sqrt_sequential:Rvar[47]~combout\ & !\Add0~93\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[47]~combout\,
	datad => VCC,
	cin => \Add0~93\,
	combout => \Add0~94_combout\,
	cout => \Add0~95\);

-- Location: LCCOMB_X20_Y14_N0
\Add1~96\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~96_combout\ = (\Add0~92_combout\ & ((GND) # (!\Add1~95\))) # (!\Add0~92_combout\ & (\Add1~95\ $ (GND)))
-- \Add1~97\ = CARRY((\Add0~92_combout\) # (!\Add1~95\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~92_combout\,
	datad => VCC,
	cin => \Add1~95\,
	combout => \Add1~96_combout\,
	cout => \Add1~97\);

-- Location: LCCOMB_X20_Y14_N2
\Add1~98\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~98_combout\ = (\Add0~94_combout\ & (\Add1~97\ & VCC)) # (!\Add0~94_combout\ & (!\Add1~97\))
-- \Add1~99\ = CARRY((!\Add0~94_combout\ & !\Add1~97\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~94_combout\,
	datad => VCC,
	cin => \Add1~97\,
	combout => \Add1~98_combout\,
	cout => \Add1~99\);

-- Location: LCCOMB_X20_Y14_N4
\Add1~100\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~100_combout\ = (\Add0~96_combout\ & ((GND) # (!\Add1~99\))) # (!\Add0~96_combout\ & (\Add1~99\ $ (GND)))
-- \Add1~101\ = CARRY((\Add0~96_combout\) # (!\Add1~99\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~96_combout\,
	datad => VCC,
	cin => \Add1~99\,
	combout => \Add1~100_combout\,
	cout => \Add1~101\);

-- Location: LCCOMB_X21_Y14_N8
\Selector117~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector117~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~100_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~100_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~100_combout\,
	datac => \Add1~100_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector117~0_combout\);

-- Location: LCCOMB_X21_Y14_N28
\sqrt_sequential:Rvar[50]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[50]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[50]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector117~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[50]~combout\,
	datac => \Selector117~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[50]~combout\);

-- Location: LCCOMB_X21_Y14_N6
\Selector116~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector116~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~98_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~98_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~98_combout\,
	datad => \Add1~98_combout\,
	combout => \Selector116~0_combout\);

-- Location: LCCOMB_X21_Y14_N22
\sqrt_sequential:Rvar[49]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[49]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[49]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector116~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[49]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector116~0_combout\,
	combout => \sqrt_sequential:Rvar[49]~combout\);

-- Location: LCCOMB_X21_Y14_N24
\Selector115~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector115~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~96_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~96_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~96_combout\,
	datad => \Add3~96_combout\,
	combout => \Selector115~0_combout\);

-- Location: LCCOMB_X21_Y14_N16
\sqrt_sequential:Rvar[48]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[48]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[48]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector115~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[48]~combout\,
	datac => \Selector115~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[48]~combout\);

-- Location: LCCOMB_X22_Y14_N4
\Add2~98\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~98_combout\ = (\sqrt_sequential:Rvar[49]~combout\ & (!\Add2~97\)) # (!\sqrt_sequential:Rvar[49]~combout\ & ((\Add2~97\) # (GND)))
-- \Add2~99\ = CARRY((!\Add2~97\) # (!\sqrt_sequential:Rvar[49]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[49]~combout\,
	datad => VCC,
	cin => \Add2~97\,
	combout => \Add2~98_combout\,
	cout => \Add2~99\);

-- Location: LCCOMB_X22_Y14_N6
\Add2~100\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~100_combout\ = (\sqrt_sequential:Rvar[50]~combout\ & (\Add2~99\ $ (GND))) # (!\sqrt_sequential:Rvar[50]~combout\ & (!\Add2~99\ & VCC))
-- \Add2~101\ = CARRY((\sqrt_sequential:Rvar[50]~combout\ & !\Add2~99\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[50]~combout\,
	datad => VCC,
	cin => \Add2~99\,
	combout => \Add2~100_combout\,
	cout => \Add2~101\);

-- Location: LCCOMB_X22_Y14_N10
\Add2~104\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~104_combout\ = (\sqrt_sequential:Rvar[52]~combout\ & (\Add2~103\ $ (GND))) # (!\sqrt_sequential:Rvar[52]~combout\ & (!\Add2~103\ & VCC))
-- \Add2~105\ = CARRY((\sqrt_sequential:Rvar[52]~combout\ & !\Add2~103\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[52]~combout\,
	datad => VCC,
	cin => \Add2~103\,
	combout => \Add2~104_combout\,
	cout => \Add2~105\);

-- Location: LCCOMB_X22_Y14_N16
\Add2~110\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~110_combout\ = (\sqrt_sequential:Rvar[55]~combout\ & (!\Add2~109\)) # (!\sqrt_sequential:Rvar[55]~combout\ & ((\Add2~109\) # (GND)))
-- \Add2~111\ = CARRY((!\Add2~109\) # (!\sqrt_sequential:Rvar[55]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[55]~combout\,
	datad => VCC,
	cin => \Add2~109\,
	combout => \Add2~110_combout\,
	cout => \Add2~111\);

-- Location: LCCOMB_X22_Y14_N18
\Add2~112\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~112_combout\ = (\sqrt_sequential:Rvar[56]~combout\ & (\Add2~111\ $ (GND))) # (!\sqrt_sequential:Rvar[56]~combout\ & (!\Add2~111\ & VCC))
-- \Add2~113\ = CARRY((\sqrt_sequential:Rvar[56]~combout\ & !\Add2~111\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[56]~combout\,
	datad => VCC,
	cin => \Add2~111\,
	combout => \Add2~112_combout\,
	cout => \Add2~113\);

-- Location: LCCOMB_X23_Y14_N6
\Add3~102\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~102_combout\ = (\Add2~98_combout\ & (!\Add3~101\)) # (!\Add2~98_combout\ & ((\Add3~101\) # (GND)))
-- \Add3~103\ = CARRY((!\Add3~101\) # (!\Add2~98_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~98_combout\,
	datad => VCC,
	cin => \Add3~101\,
	combout => \Add3~102_combout\,
	cout => \Add3~103\);

-- Location: LCCOMB_X23_Y14_N10
\Add3~106\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~106_combout\ = (\Add2~102_combout\ & (!\Add3~105\)) # (!\Add2~102_combout\ & ((\Add3~105\) # (GND)))
-- \Add3~107\ = CARRY((!\Add3~105\) # (!\Add2~102_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~102_combout\,
	datad => VCC,
	cin => \Add3~105\,
	combout => \Add3~106_combout\,
	cout => \Add3~107\);

-- Location: LCCOMB_X23_Y14_N12
\Add3~108\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~108_combout\ = (\Add2~104_combout\ & (\Add3~107\ $ (GND))) # (!\Add2~104_combout\ & (!\Add3~107\ & VCC))
-- \Add3~109\ = CARRY((\Add2~104_combout\ & !\Add3~107\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~104_combout\,
	datad => VCC,
	cin => \Add3~107\,
	combout => \Add3~108_combout\,
	cout => \Add3~109\);

-- Location: LCCOMB_X23_Y14_N18
\Add3~114\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~114_combout\ = (\Add2~110_combout\ & (!\Add3~113\)) # (!\Add2~110_combout\ & ((\Add3~113\) # (GND)))
-- \Add3~115\ = CARRY((!\Add3~113\) # (!\Add2~110_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~110_combout\,
	datad => VCC,
	cin => \Add3~113\,
	combout => \Add3~114_combout\,
	cout => \Add3~115\);

-- Location: LCCOMB_X23_Y14_N22
\Add3~118\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~118_combout\ = (\Add2~114_combout\ & (!\Add3~117\)) # (!\Add2~114_combout\ & ((\Add3~117\) # (GND)))
-- \Add3~119\ = CARRY((!\Add3~117\) # (!\Add2~114_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~114_combout\,
	datad => VCC,
	cin => \Add3~117\,
	combout => \Add3~118_combout\,
	cout => \Add3~119\);

-- Location: LCCOMB_X19_Y14_N4
\Add0~98\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~98_combout\ = (\sqrt_sequential:Rvar[49]~combout\ & (\Add0~97\ & VCC)) # (!\sqrt_sequential:Rvar[49]~combout\ & (!\Add0~97\))
-- \Add0~99\ = CARRY((!\sqrt_sequential:Rvar[49]~combout\ & !\Add0~97\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[49]~combout\,
	datad => VCC,
	cin => \Add0~97\,
	combout => \Add0~98_combout\,
	cout => \Add0~99\);

-- Location: LCCOMB_X19_Y14_N6
\Add0~100\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~100_combout\ = (\sqrt_sequential:Rvar[50]~combout\ & ((GND) # (!\Add0~99\))) # (!\sqrt_sequential:Rvar[50]~combout\ & (\Add0~99\ $ (GND)))
-- \Add0~101\ = CARRY((\sqrt_sequential:Rvar[50]~combout\) # (!\Add0~99\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[50]~combout\,
	datad => VCC,
	cin => \Add0~99\,
	combout => \Add0~100_combout\,
	cout => \Add0~101\);

-- Location: LCCOMB_X20_Y14_N6
\Add1~102\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~102_combout\ = (\Add0~98_combout\ & (\Add1~101\ & VCC)) # (!\Add0~98_combout\ & (!\Add1~101\))
-- \Add1~103\ = CARRY((!\Add0~98_combout\ & !\Add1~101\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~98_combout\,
	datad => VCC,
	cin => \Add1~101\,
	combout => \Add1~102_combout\,
	cout => \Add1~103\);

-- Location: LCCOMB_X20_Y14_N10
\Add1~106\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~106_combout\ = (\Add0~102_combout\ & (\Add1~105\ & VCC)) # (!\Add0~102_combout\ & (!\Add1~105\))
-- \Add1~107\ = CARRY((!\Add0~102_combout\ & !\Add1~105\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~102_combout\,
	datad => VCC,
	cin => \Add1~105\,
	combout => \Add1~106_combout\,
	cout => \Add1~107\);

-- Location: LCCOMB_X20_Y14_N12
\Add1~108\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~108_combout\ = (\Add0~104_combout\ & ((GND) # (!\Add1~107\))) # (!\Add0~104_combout\ & (\Add1~107\ $ (GND)))
-- \Add1~109\ = CARRY((\Add0~104_combout\) # (!\Add1~107\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~104_combout\,
	datad => VCC,
	cin => \Add1~107\,
	combout => \Add1~108_combout\,
	cout => \Add1~109\);

-- Location: LCCOMB_X21_Y14_N20
\Selector121~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector121~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~108_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~108_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~108_combout\,
	datad => \Add1~108_combout\,
	combout => \Selector121~0_combout\);

-- Location: LCCOMB_X21_Y14_N0
\sqrt_sequential:Rvar[54]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[54]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[54]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector121~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[54]~combout\,
	datac => \Selector121~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[54]~combout\);

-- Location: LCCOMB_X21_Y14_N14
\Selector120~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector120~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~106_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~106_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add3~106_combout\,
	datad => \Add1~106_combout\,
	combout => \Selector120~0_combout\);

-- Location: LCCOMB_X21_Y14_N2
\sqrt_sequential:Rvar[53]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[53]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[53]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector120~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[53]~combout\,
	datac => \Selector120~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[53]~combout\);

-- Location: LCCOMB_X21_Y14_N10
\Selector118~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector118~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~102_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~102_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~102_combout\,
	datad => \Add3~102_combout\,
	combout => \Selector118~0_combout\);

-- Location: LCCOMB_X21_Y14_N30
\sqrt_sequential:Rvar[51]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[51]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[51]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector118~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[51]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector118~0_combout\,
	combout => \sqrt_sequential:Rvar[51]~combout\);

-- Location: LCCOMB_X19_Y14_N16
\Add0~110\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~110_combout\ = (\sqrt_sequential:Rvar[55]~combout\ & (\Add0~109\ & VCC)) # (!\sqrt_sequential:Rvar[55]~combout\ & (!\Add0~109\))
-- \Add0~111\ = CARRY((!\sqrt_sequential:Rvar[55]~combout\ & !\Add0~109\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[55]~combout\,
	datad => VCC,
	cin => \Add0~109\,
	combout => \Add0~110_combout\,
	cout => \Add0~111\);

-- Location: LCCOMB_X19_Y14_N18
\Add0~112\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~112_combout\ = (\sqrt_sequential:Rvar[56]~combout\ & ((GND) # (!\Add0~111\))) # (!\sqrt_sequential:Rvar[56]~combout\ & (\Add0~111\ $ (GND)))
-- \Add0~113\ = CARRY((\sqrt_sequential:Rvar[56]~combout\) # (!\Add0~111\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[56]~combout\,
	datad => VCC,
	cin => \Add0~111\,
	combout => \Add0~112_combout\,
	cout => \Add0~113\);

-- Location: LCCOMB_X20_Y14_N14
\Add1~110\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~110_combout\ = (\Add0~106_combout\ & (\Add1~109\ & VCC)) # (!\Add0~106_combout\ & (!\Add1~109\))
-- \Add1~111\ = CARRY((!\Add0~106_combout\ & !\Add1~109\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~106_combout\,
	datad => VCC,
	cin => \Add1~109\,
	combout => \Add1~110_combout\,
	cout => \Add1~111\);

-- Location: LCCOMB_X20_Y14_N18
\Add1~114\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~114_combout\ = (\Add0~110_combout\ & (\Add1~113\ & VCC)) # (!\Add0~110_combout\ & (!\Add1~113\))
-- \Add1~115\ = CARRY((!\Add0~110_combout\ & !\Add1~113\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~110_combout\,
	datad => VCC,
	cin => \Add1~113\,
	combout => \Add1~114_combout\,
	cout => \Add1~115\);

-- Location: LCCOMB_X20_Y14_N20
\Add1~116\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~116_combout\ = (\Add0~112_combout\ & ((GND) # (!\Add1~115\))) # (!\Add0~112_combout\ & (\Add1~115\ $ (GND)))
-- \Add1~117\ = CARRY((\Add0~112_combout\) # (!\Add1~115\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~112_combout\,
	datad => VCC,
	cin => \Add1~115\,
	combout => \Add1~116_combout\,
	cout => \Add1~117\);

-- Location: LCCOMB_X20_Y14_N22
\Add1~118\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~118_combout\ = (\Add0~114_combout\ & (\Add1~117\ & VCC)) # (!\Add0~114_combout\ & (!\Add1~117\))
-- \Add1~119\ = CARRY((!\Add0~114_combout\ & !\Add1~117\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~114_combout\,
	datad => VCC,
	cin => \Add1~117\,
	combout => \Add1~118_combout\,
	cout => \Add1~119\);

-- Location: LCCOMB_X24_Y14_N24
\Selector126~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector126~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~118_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~118_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~118_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add1~118_combout\,
	combout => \Selector126~0_combout\);

-- Location: LCCOMB_X24_Y14_N6
\sqrt_sequential:Rvar[59]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[59]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[59]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector126~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[59]~combout\,
	datac => \Selector126~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[59]~combout\);

-- Location: LCCOMB_X22_Y14_N22
\Add2~116\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~116_combout\ = (\sqrt_sequential:Rvar[58]~combout\ & (\Add2~115\ $ (GND))) # (!\sqrt_sequential:Rvar[58]~combout\ & (!\Add2~115\ & VCC))
-- \Add2~117\ = CARRY((\sqrt_sequential:Rvar[58]~combout\ & !\Add2~115\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[58]~combout\,
	datad => VCC,
	cin => \Add2~115\,
	combout => \Add2~116_combout\,
	cout => \Add2~117\);

-- Location: LCCOMB_X22_Y14_N24
\Add2~118\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~118_combout\ = (\sqrt_sequential:Rvar[59]~combout\ & (!\Add2~117\)) # (!\sqrt_sequential:Rvar[59]~combout\ & ((\Add2~117\) # (GND)))
-- \Add2~119\ = CARRY((!\Add2~117\) # (!\sqrt_sequential:Rvar[59]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[59]~combout\,
	datad => VCC,
	cin => \Add2~117\,
	combout => \Add2~118_combout\,
	cout => \Add2~119\);

-- Location: LCCOMB_X23_Y14_N24
\Add3~120\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~120_combout\ = (\Add2~116_combout\ & (\Add3~119\ $ (GND))) # (!\Add2~116_combout\ & (!\Add3~119\ & VCC))
-- \Add3~121\ = CARRY((\Add2~116_combout\ & !\Add3~119\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~116_combout\,
	datad => VCC,
	cin => \Add3~119\,
	combout => \Add3~120_combout\,
	cout => \Add3~121\);

-- Location: LCCOMB_X23_Y14_N26
\Add3~122\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~122_combout\ = (\Add2~118_combout\ & (!\Add3~121\)) # (!\Add2~118_combout\ & ((\Add3~121\) # (GND)))
-- \Add3~123\ = CARRY((!\Add3~121\) # (!\Add2~118_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~118_combout\,
	datad => VCC,
	cin => \Add3~121\,
	combout => \Add3~122_combout\,
	cout => \Add3~123\);

-- Location: LCCOMB_X24_Y14_N26
\Selector125~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector125~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~116_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~116_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~116_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add1~116_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector125~0_combout\);

-- Location: LCCOMB_X24_Y14_N20
\sqrt_sequential:Rvar[58]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[58]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[58]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector125~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[58]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector125~0_combout\,
	combout => \sqrt_sequential:Rvar[58]~combout\);

-- Location: LCCOMB_X19_Y14_N22
\Add0~116\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~116_combout\ = (\sqrt_sequential:Rvar[58]~combout\ & ((GND) # (!\Add0~115\))) # (!\sqrt_sequential:Rvar[58]~combout\ & (\Add0~115\ $ (GND)))
-- \Add0~117\ = CARRY((\sqrt_sequential:Rvar[58]~combout\) # (!\Add0~115\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[58]~combout\,
	datad => VCC,
	cin => \Add0~115\,
	combout => \Add0~116_combout\,
	cout => \Add0~117\);

-- Location: LCCOMB_X19_Y14_N24
\Add0~118\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~118_combout\ = (\sqrt_sequential:Rvar[59]~combout\ & (\Add0~117\ & VCC)) # (!\sqrt_sequential:Rvar[59]~combout\ & (!\Add0~117\))
-- \Add0~119\ = CARRY((!\sqrt_sequential:Rvar[59]~combout\ & !\Add0~117\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[59]~combout\,
	datad => VCC,
	cin => \Add0~117\,
	combout => \Add0~118_combout\,
	cout => \Add0~119\);

-- Location: LCCOMB_X20_Y14_N24
\Add1~120\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~120_combout\ = (\Add0~116_combout\ & ((GND) # (!\Add1~119\))) # (!\Add0~116_combout\ & (\Add1~119\ $ (GND)))
-- \Add1~121\ = CARRY((\Add0~116_combout\) # (!\Add1~119\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~116_combout\,
	datad => VCC,
	cin => \Add1~119\,
	combout => \Add1~120_combout\,
	cout => \Add1~121\);

-- Location: LCCOMB_X20_Y14_N26
\Add1~122\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~122_combout\ = (\Add0~118_combout\ & (\Add1~121\ & VCC)) # (!\Add0~118_combout\ & (!\Add1~121\))
-- \Add1~123\ = CARRY((!\Add0~118_combout\ & !\Add1~121\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~118_combout\,
	datad => VCC,
	cin => \Add1~121\,
	combout => \Add1~122_combout\,
	cout => \Add1~123\);

-- Location: LCCOMB_X24_Y14_N0
\Selector128~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector128~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~122_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~122_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~122_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add1~122_combout\,
	combout => \Selector128~0_combout\);

-- Location: LCCOMB_X24_Y14_N18
\sqrt_sequential:Rvar[61]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[61]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[61]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector128~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[61]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector128~0_combout\,
	combout => \sqrt_sequential:Rvar[61]~combout\);

-- Location: LCCOMB_X22_Y14_N26
\Add2~120\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~120_combout\ = (\sqrt_sequential:Rvar[60]~combout\ & (\Add2~119\ $ (GND))) # (!\sqrt_sequential:Rvar[60]~combout\ & (!\Add2~119\ & VCC))
-- \Add2~121\ = CARRY((\sqrt_sequential:Rvar[60]~combout\ & !\Add2~119\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[60]~combout\,
	datad => VCC,
	cin => \Add2~119\,
	combout => \Add2~120_combout\,
	cout => \Add2~121\);

-- Location: LCCOMB_X22_Y14_N28
\Add2~122\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add2~122_combout\ = \Add2~121\ $ (\sqrt_sequential:Rvar[61]~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \sqrt_sequential:Rvar[61]~combout\,
	cin => \Add2~121\,
	combout => \Add2~122_combout\);

-- Location: LCCOMB_X23_Y14_N28
\Add3~125\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~125_cout\ = CARRY((\Add2~120_combout\ & !\Add3~123\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~120_combout\,
	datad => VCC,
	cin => \Add3~123\,
	cout => \Add3~125_cout\);

-- Location: LCCOMB_X23_Y14_N30
\Add3~126\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~126_combout\ = \Add3~125_cout\ $ (\Add2~122_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Add2~122_combout\,
	cin => \Add3~125_cout\,
	combout => \Add3~126_combout\);

-- Location: LCCOMB_X18_Y14_N12
\Selector130~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector130~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((\Add3~126_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (\Add1~126_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~126_combout\,
	datad => \Add3~126_combout\,
	combout => \Selector130~0_combout\);

-- Location: LCCOMB_X18_Y14_N16
\sqrt_sequential:Rvar[63]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[63]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[63]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector130~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector130~0_combout\,
	combout => \sqrt_sequential:Rvar[63]~combout\);

-- Location: LCCOMB_X24_Y14_N16
\Selector122~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector122~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~110_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~110_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~110_combout\,
	datab => \sqrt_sequential:Rvar[63]~combout\,
	datac => \Add1~110_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector122~0_combout\);

-- Location: LCCOMB_X24_Y14_N10
\sqrt_sequential:Rvar[55]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[55]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[55]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector122~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[55]~combout\,
	datac => \Selector122~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[55]~combout\);

-- Location: LCCOMB_X24_Y14_N4
\Selector124~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector124~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~114_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~114_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~114_combout\,
	datac => \Add1~114_combout\,
	datad => \current_state.exec_state~regout\,
	combout => \Selector124~0_combout\);

-- Location: LCCOMB_X24_Y14_N30
\sqrt_sequential:Rvar[57]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[57]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[57]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector124~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[57]~combout\,
	datac => \Selector124~0_combout\,
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \sqrt_sequential:Rvar[57]~combout\);

-- Location: LCCOMB_X24_Y14_N22
\Selector127~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector127~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & (\Add3~120_combout\)) # (!\sqrt_sequential:Rvar[63]~combout\ & ((\Add1~120_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \Add3~120_combout\,
	datac => \current_state.exec_state~regout\,
	datad => \Add1~120_combout\,
	combout => \Selector127~0_combout\);

-- Location: LCCOMB_X24_Y14_N8
\sqrt_sequential:Rvar[60]\ : cycloneii_lcell_comb
-- Equation(s):
-- \sqrt_sequential:Rvar[60]~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\sqrt_sequential:Rvar[60]~combout\)) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector127~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[60]~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector127~0_combout\,
	combout => \sqrt_sequential:Rvar[60]~combout\);

-- Location: LCCOMB_X19_Y14_N26
\Add0~120\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~120_combout\ = (\sqrt_sequential:Rvar[60]~combout\ & ((GND) # (!\Add0~119\))) # (!\sqrt_sequential:Rvar[60]~combout\ & (\Add0~119\ $ (GND)))
-- \Add0~121\ = CARRY((\sqrt_sequential:Rvar[60]~combout\) # (!\Add0~119\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sqrt_sequential:Rvar[60]~combout\,
	datad => VCC,
	cin => \Add0~119\,
	combout => \Add0~120_combout\,
	cout => \Add0~121\);

-- Location: LCCOMB_X19_Y14_N28
\Add0~122\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~122_combout\ = \sqrt_sequential:Rvar[61]~combout\ $ (!\Add0~121\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[61]~combout\,
	cin => \Add0~121\,
	combout => \Add0~122_combout\);

-- Location: LCCOMB_X20_Y14_N28
\Add1~125\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~125_cout\ = CARRY((\Add0~120_combout\) # (!\Add1~123\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~120_combout\,
	datad => VCC,
	cin => \Add1~123\,
	cout => \Add1~125_cout\);

-- Location: LCCOMB_X20_Y14_N30
\Add1~126\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~126_combout\ = \Add1~125_cout\ $ (!\Add0~122_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Add0~122_combout\,
	cin => \Add1~125_cout\,
	combout => \Add1~126_combout\);

-- Location: LCCOMB_X18_Y14_N28
\Selector35~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector35~0_combout\ = (\current_state.exec_state~regout\ & ((\sqrt_sequential:Rvar[63]~combout\ & ((!\Add3~126_combout\))) # (!\sqrt_sequential:Rvar[63]~combout\ & (!\Add1~126_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sqrt_sequential:Rvar[63]~combout\,
	datab => \current_state.exec_state~regout\,
	datac => \Add1~126_combout\,
	datad => \Add3~126_combout\,
	combout => \Selector35~0_combout\);

-- Location: LCCOMB_X18_Y14_N24
\Zin[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(0) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(0))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector35~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Zin(0),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector35~0_combout\,
	combout => Zin(0));

-- Location: LCFF_X18_Y14_N25
\Z[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(0),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(0));

-- Location: LCCOMB_X18_Y14_N20
\Z_OUT[0]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[0]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(0)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[0]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[0]$latch~combout\,
	datac => Z(0),
	datad => \current_state.end_state~clkctrl_outclk\,
	combout => \Z_OUT[0]$latch~combout\);

-- Location: LCCOMB_X18_Y14_N14
\Z_OUT[1]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[1]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(1)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[1]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[1]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(1),
	combout => \Z_OUT[1]$latch~combout\);

-- Location: LCCOMB_X18_Y14_N8
\Z_OUT[2]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[2]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(2)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[2]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[2]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(2),
	combout => \Z_OUT[2]$latch~combout\);

-- Location: LCCOMB_X18_Y14_N10
\Z_OUT[3]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[3]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(3)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[3]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[3]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(3),
	combout => \Z_OUT[3]$latch~combout\);

-- Location: LCCOMB_X24_Y17_N20
\Z_OUT[4]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[4]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(4)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[4]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[4]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(4),
	combout => \Z_OUT[4]$latch~combout\);

-- Location: LCCOMB_X24_Y17_N26
\Z_OUT[5]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[5]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(5)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[5]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[5]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(5),
	combout => \Z_OUT[5]$latch~combout\);

-- Location: LCCOMB_X24_Y17_N24
\Z_OUT[6]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[6]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(6)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[6]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[6]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(6),
	combout => \Z_OUT[6]$latch~combout\);

-- Location: LCCOMB_X24_Y17_N30
\Z_OUT[7]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[7]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(7)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[7]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[7]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(7),
	combout => \Z_OUT[7]$latch~combout\);

-- Location: LCCOMB_X24_Y17_N4
\Z_OUT[8]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[8]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(8)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[8]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[8]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(8),
	combout => \Z_OUT[8]$latch~combout\);

-- Location: LCCOMB_X24_Y17_N22
\Z_OUT[9]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[9]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(9)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[9]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[9]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(9),
	combout => \Z_OUT[9]$latch~combout\);

-- Location: LCCOMB_X18_Y17_N30
\Z_OUT[10]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[10]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(10)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[10]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[10]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(10),
	combout => \Z_OUT[10]$latch~combout\);

-- Location: LCCOMB_X18_Y17_N4
\Z_OUT[11]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[11]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(11)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[11]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[11]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(11),
	combout => \Z_OUT[11]$latch~combout\);

-- Location: LCCOMB_X16_Y17_N18
\Selector47~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector47~0_combout\ = (Z(11) & \current_state.exec_state~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Z(11),
	datad => \current_state.exec_state~regout\,
	combout => \Selector47~0_combout\);

-- Location: LCCOMB_X18_Y17_N0
\Zin[12]\ : cycloneii_lcell_comb
-- Equation(s):
-- Zin(12) = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & (Zin(12))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((\Selector47~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Zin(12),
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => \Selector47~0_combout\,
	combout => Zin(12));

-- Location: LCFF_X18_Y17_N1
\Z[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => Zin(12),
	ena => \ALT_INV_RST~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Z(12));

-- Location: LCCOMB_X18_Y17_N18
\Z_OUT[12]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[12]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(12)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[12]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[12]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(12),
	combout => \Z_OUT[12]$latch~combout\);

-- Location: LCCOMB_X18_Y17_N16
\Z_OUT[13]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[13]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(13)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[13]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[13]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(13),
	combout => \Z_OUT[13]$latch~combout\);

-- Location: LCCOMB_X18_Y17_N14
\Z_OUT[14]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[14]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(14)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[14]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[14]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(14),
	combout => \Z_OUT[14]$latch~combout\);

-- Location: LCCOMB_X18_Y16_N14
\Z_OUT[15]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[15]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(15)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[15]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[15]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(15),
	combout => \Z_OUT[15]$latch~combout\);

-- Location: LCCOMB_X18_Y16_N20
\Z_OUT[16]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[16]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(16)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[16]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[16]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(16),
	combout => \Z_OUT[16]$latch~combout\);

-- Location: LCCOMB_X18_Y16_N2
\Z_OUT[17]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[17]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(17)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[17]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[17]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(17),
	combout => \Z_OUT[17]$latch~combout\);

-- Location: LCCOMB_X18_Y16_N24
\Z_OUT[18]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[18]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(18)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[18]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[18]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(18),
	combout => \Z_OUT[18]$latch~combout\);

-- Location: LCCOMB_X18_Y16_N22
\Z_OUT[19]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[19]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(19)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[19]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[19]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(19),
	combout => \Z_OUT[19]$latch~combout\);

-- Location: LCCOMB_X18_Y16_N8
\Z_OUT[20]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[20]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(20)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[20]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[20]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(20),
	combout => \Z_OUT[20]$latch~combout\);

-- Location: LCCOMB_X19_Y13_N4
\Z_OUT[21]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[21]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(21)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[21]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[21]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(21),
	combout => \Z_OUT[21]$latch~combout\);

-- Location: LCCOMB_X19_Y13_N14
\Z_OUT[22]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[22]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(22)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[22]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[22]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(22),
	combout => \Z_OUT[22]$latch~combout\);

-- Location: LCCOMB_X19_Y13_N24
\Z_OUT[23]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[23]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(23)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[23]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[23]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(23),
	combout => \Z_OUT[23]$latch~combout\);

-- Location: LCCOMB_X19_Y13_N26
\Z_OUT[24]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[24]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(24)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[24]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[24]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(24),
	combout => \Z_OUT[24]$latch~combout\);

-- Location: LCCOMB_X19_Y13_N20
\Z_OUT[25]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[25]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(25)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[25]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[25]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(25),
	combout => \Z_OUT[25]$latch~combout\);

-- Location: LCCOMB_X21_Y13_N0
\Z_OUT[26]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[26]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(26)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[26]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[26]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(26),
	combout => \Z_OUT[26]$latch~combout\);

-- Location: LCCOMB_X20_Y13_N8
\Z_OUT[27]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[27]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(27)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[27]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[27]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(27),
	combout => \Z_OUT[27]$latch~combout\);

-- Location: LCCOMB_X21_Y13_N18
\Z_OUT[28]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[28]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(28)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[28]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[28]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(28),
	combout => \Z_OUT[28]$latch~combout\);

-- Location: LCCOMB_X20_Y13_N26
\Z_OUT[29]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[29]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(29)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[29]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_OUT[29]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(29),
	combout => \Z_OUT[29]$latch~combout\);

-- Location: LCCOMB_X18_Y13_N20
\Z_OUT[30]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[30]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(30)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[30]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[30]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(30),
	combout => \Z_OUT[30]$latch~combout\);

-- Location: LCCOMB_X22_Y13_N20
\Z_OUT[31]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_OUT[31]$latch~combout\ = (GLOBAL(\current_state.end_state~clkctrl_outclk\) & ((Z(31)))) # (!GLOBAL(\current_state.end_state~clkctrl_outclk\) & (\Z_OUT[31]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_OUT[31]$latch~combout\,
	datac => \current_state.end_state~clkctrl_outclk\,
	datad => Z(31),
	combout => \Z_OUT[31]$latch~combout\);

-- Location: LCCOMB_X18_Y15_N10
\DONE$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \DONE$latch~combout\ = (\current_state.exec_state~regout\ & ((\DONE$latch~combout\))) # (!\current_state.exec_state~regout\ & (\current_state.end_state~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.end_state~regout\,
	datac => \current_state.exec_state~regout\,
	datad => \DONE$latch~combout\,
	combout => \DONE$latch~combout\);

-- Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[0]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(0));

-- Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[1]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(1));

-- Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[2]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(2));

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[3]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(3));

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[4]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(4));

-- Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[5]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(5));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[6]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(6));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[7]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(7));

-- Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[8]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(8));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[9]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(9));

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[10]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(10));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[11]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(11));

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[12]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(12));

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[13]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(13));

-- Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[14]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(14));

-- Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[15]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(15));

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[16]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(16));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[17]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(17));

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[18]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(18));

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[19]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(19));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[20]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(20));

-- Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[21]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(21));

-- Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[22]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(22));

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[23]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(23));

-- Location: PIN_K15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[24]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(24));

-- Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[25]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(25));

-- Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[26]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(26));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[27]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(27));

-- Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[28]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(28));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[29]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(29));

-- Location: PIN_L16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[30]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(30));

-- Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_OUT[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_OUT[31]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_OUT(31));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\DONE~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \DONE$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_DONE);
END structure;


