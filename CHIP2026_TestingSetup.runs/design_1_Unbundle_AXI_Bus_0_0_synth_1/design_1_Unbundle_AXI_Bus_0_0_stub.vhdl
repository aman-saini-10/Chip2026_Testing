-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Jun 17 17:56:34 2026
-- Host        : aman-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_Unbundle_AXI_Bus_0_0_stub.vhdl
-- Design      : design_1_Unbundle_AXI_Bus_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    DIG_AXI_IN_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DIG_AXI_IN_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    BANK_EN_C : out STD_LOGIC_VECTOR ( 3 downto 0 );
    WL_EN_C : out STD_LOGIC;
    SA_EN_C : out STD_LOGIC;
    BL_PCHG_C : out STD_LOGIC;
    CLK_SA_C : out STD_LOGIC;
    WRITE_EN_C : out STD_LOGIC;
    CS_C : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SCN_SEL_C : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK_A_C : out STD_LOGIC;
    CLK_B_C : out STD_LOGIC;
    IN_EN_C : out STD_LOGIC;
    SCN_IN_C : out STD_LOGIC;
    InputEN_DAC_C : out STD_LOGIC;
    CALIB_EN_C : out STD_LOGIC;
    BANK_SEL_C : out STD_LOGIC;
    CHG_EN_C : out STD_LOGIC;
    RST_CAP_B_C : out STD_LOGIC;
    VDAC_CTRL_C : out STD_LOGIC;
    VTC_EN_C : out STD_LOGIC;
    TDC_EN_C : out STD_LOGIC;
    TDC_RST_C : out STD_LOGIC;
    TDC_COMPUTE_C : out STD_LOGIC;
    DFF_RST_C : out STD_LOGIC;
    CTRL_EN_C : out STD_LOGIC;
    CTRL_VB_C : out STD_LOGIC;
    CTRL_VBP_C : out STD_LOGIC;
    CTRL_VBN_C : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "DIG_AXI_IN_0[31:0],DIG_AXI_IN_1[1:0],BANK_EN_C[3:0],WL_EN_C,SA_EN_C,BL_PCHG_C,CLK_SA_C,WRITE_EN_C,CS_C[1:0],SCN_SEL_C[3:0],CLK_A_C,CLK_B_C,IN_EN_C,SCN_IN_C,InputEN_DAC_C,CALIB_EN_C,BANK_SEL_C,CHG_EN_C,RST_CAP_B_C,VDAC_CTRL_C,VTC_EN_C,TDC_EN_C,TDC_RST_C,TDC_COMPUTE_C,DFF_RST_C,CTRL_EN_C,CTRL_VB_C,CTRL_VBP_C,CTRL_VBN_C";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Unbundle_AXI_Bus,Vivado 2018.3";
begin
end;
