-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Thu Nov 21 13:44:23 2024
-- Host        : vivado-aarch64 running 64-bit Ubuntu 24.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_clk_wiz_0_1/Ece253_BlockDesign_clk_wiz_0_1_stub.vhdl
-- Design      : Ece253_BlockDesign_clk_wiz_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ece253_BlockDesign_clk_wiz_0_1 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end Ece253_BlockDesign_clk_wiz_0_1;

architecture stub of Ece253_BlockDesign_clk_wiz_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_in1";
begin
end;
