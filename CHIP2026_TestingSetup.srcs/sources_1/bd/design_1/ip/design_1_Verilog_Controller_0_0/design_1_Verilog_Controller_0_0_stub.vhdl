-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Jun 17 18:26:10 2026
-- Host        : aman-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Chip2026_Testing/CHIP2026_TestingSetup/CHIP2026_TestingSetup.srcs/sources_1/bd/design_1/ip/design_1_Verilog_Controller_0_0/design_1_Verilog_Controller_0_0_stub.vhdl
-- Design      : design_1_Verilog_Controller_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_Verilog_Controller_0_0 is
  Port ( 
    BANK_EN_C : in STD_LOGIC_VECTOR ( 3 downto 0 );
    WL_EN_C : in STD_LOGIC;
    SA_EN_C : in STD_LOGIC;
    BL_PCHG_C : in STD_LOGIC;
    CLK_SA_C : in STD_LOGIC;
    WRITE_EN_C : in STD_LOGIC;
    CS_C : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SCN_SEL_C : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK_A_C : in STD_LOGIC;
    CLK_B_C : in STD_LOGIC;
    IN_EN_C : in STD_LOGIC;
    SCN_IN_C : in STD_LOGIC;
    InputEN_DAC_C : in STD_LOGIC;
    CALIB_EN_C : in STD_LOGIC;
    BANK_SEL_C : in STD_LOGIC;
    CHG_EN_C : in STD_LOGIC;
    RST_CAP_B_C : in STD_LOGIC;
    VDAC_CTRL_C : in STD_LOGIC;
    VTC_EN_C : in STD_LOGIC;
    TDC_EN_C : in STD_LOGIC;
    TDC_RST_C : in STD_LOGIC;
    TDC_COMPUTE_C : in STD_LOGIC;
    DFF_RST_C : in STD_LOGIC;
    CTRL_EN_C : in STD_LOGIC;
    CTRL_VB_C : in STD_LOGIC;
    CTRL_VBP_C : in STD_LOGIC;
    CTRL_VBN_C : in STD_LOGIC;
    BANK_EN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    WL_EN : out STD_LOGIC;
    SA_EN : out STD_LOGIC;
    BL_PCHG : out STD_LOGIC;
    CLK_SA : out STD_LOGIC;
    WRITE_EN : out STD_LOGIC;
    CS : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SCN_SEL : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK_A : out STD_LOGIC;
    CLK_B : out STD_LOGIC;
    IN_EN : out STD_LOGIC;
    SCN_IN : out STD_LOGIC;
    InputEN_DAC : out STD_LOGIC;
    CALIB_EN : out STD_LOGIC;
    BANK_SEL : out STD_LOGIC;
    CHG_EN : out STD_LOGIC;
    RST_CAP_B : out STD_LOGIC;
    VDAC_CTRL : out STD_LOGIC;
    VTC_EN : out STD_LOGIC;
    TDC_EN : out STD_LOGIC;
    TDC_RST : out STD_LOGIC;
    TDC_COMPUTE : out STD_LOGIC;
    DFF_RST : out STD_LOGIC;
    CTRL_EN : out STD_LOGIC;
    CTRL_VB : out STD_LOGIC;
    CTRL_VBP : out STD_LOGIC;
    CTRL_VBN : out STD_LOGIC;
    scan_mode_setting_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dig_out : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    in_tvalid : in STD_LOGIC;
    in_tlast : in STD_LOGIC;
    in_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_tready : out STD_LOGIC;
    out_tready : in STD_LOGIC;
    out_tvalid : out STD_LOGIC;
    out_tlast : out STD_LOGIC;
    out_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SCAN_DONE_FLAGS : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end design_1_Verilog_Controller_0_0;

architecture stub of design_1_Verilog_Controller_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "BANK_EN_C[3:0],WL_EN_C,SA_EN_C,BL_PCHG_C,CLK_SA_C,WRITE_EN_C,CS_C[1:0],SCN_SEL_C[3:0],CLK_A_C,CLK_B_C,IN_EN_C,SCN_IN_C,InputEN_DAC_C,CALIB_EN_C,BANK_SEL_C,CHG_EN_C,RST_CAP_B_C,VDAC_CTRL_C,VTC_EN_C,TDC_EN_C,TDC_RST_C,TDC_COMPUTE_C,DFF_RST_C,CTRL_EN_C,CTRL_VB_C,CTRL_VBP_C,CTRL_VBN_C,BANK_EN[3:0],WL_EN,SA_EN,BL_PCHG,CLK_SA,WRITE_EN,CS[1:0],SCN_SEL[3:0],CLK_A,CLK_B,IN_EN,SCN_IN,InputEN_DAC,CALIB_EN,BANK_SEL,CHG_EN,RST_CAP_B,VDAC_CTRL,VTC_EN,TDC_EN,TDC_RST,TDC_COMPUTE,DFF_RST,CTRL_EN,CTRL_VB,CTRL_VBP,CTRL_VBN,scan_mode_setting_in[31:0],dig_out[1:0],clk,in_tvalid,in_tlast,in_tdata[31:0],in_tready,out_tready,out_tvalid,out_tlast,out_tdata[31:0],SCAN_DONE_FLAGS[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Verilog_Controller,Vivado 2018.3";
begin
end;
