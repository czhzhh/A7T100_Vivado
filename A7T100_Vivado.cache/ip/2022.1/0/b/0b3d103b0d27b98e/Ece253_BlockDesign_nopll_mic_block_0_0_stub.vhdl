-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Thu Nov 21 17:48:32 2024
-- Host        : vivado-aarch64 running 64-bit Ubuntu 24.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Ece253_BlockDesign_nopll_mic_block_0_0_stub.vhdl
-- Design      : Ece253_BlockDesign_nopll_mic_block_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    sys_clk : in STD_LOGIC;
    sys_rst : in STD_LOGIC;
    mic_clk : out STD_LOGIC;
    mic_lr_sel : out STD_LOGIC;
    mic_data_in : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sys_clk,sys_rst,mic_clk,mic_lr_sel,mic_data_in,m_axis_tdata[31:0],m_axis_tvalid,m_axis_tready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "nopll_mic_block,Vivado 2022.1";
begin
end;
