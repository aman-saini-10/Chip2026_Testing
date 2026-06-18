// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jun 17 18:26:00 2026
// Host        : aman-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_Verilog_Controller_0_0_stub.v
// Design      : design_1_Verilog_Controller_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Verilog_Controller,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(BANK_EN_C, WL_EN_C, SA_EN_C, BL_PCHG_C, CLK_SA_C, 
  WRITE_EN_C, CS_C, SCN_SEL_C, CLK_A_C, CLK_B_C, IN_EN_C, SCN_IN_C, InputEN_DAC_C, CALIB_EN_C, 
  BANK_SEL_C, CHG_EN_C, RST_CAP_B_C, VDAC_CTRL_C, VTC_EN_C, TDC_EN_C, TDC_RST_C, TDC_COMPUTE_C, 
  DFF_RST_C, CTRL_EN_C, CTRL_VB_C, CTRL_VBP_C, CTRL_VBN_C, BANK_EN, WL_EN, SA_EN, BL_PCHG, CLK_SA, 
  WRITE_EN, CS, SCN_SEL, CLK_A, CLK_B, IN_EN, SCN_IN, InputEN_DAC, CALIB_EN, BANK_SEL, CHG_EN, RST_CAP_B, 
  VDAC_CTRL, VTC_EN, TDC_EN, TDC_RST, TDC_COMPUTE, DFF_RST, CTRL_EN, CTRL_VB, CTRL_VBP, CTRL_VBN, 
  scan_mode_setting_in, dig_out, clk, in_tvalid, in_tlast, in_tdata, in_tready, out_tready, 
  out_tvalid, out_tlast, out_tdata, SCAN_DONE_FLAGS)
/* synthesis syn_black_box black_box_pad_pin="BANK_EN_C[3:0],WL_EN_C,SA_EN_C,BL_PCHG_C,CLK_SA_C,WRITE_EN_C,CS_C[1:0],SCN_SEL_C[3:0],CLK_A_C,CLK_B_C,IN_EN_C,SCN_IN_C,InputEN_DAC_C,CALIB_EN_C,BANK_SEL_C,CHG_EN_C,RST_CAP_B_C,VDAC_CTRL_C,VTC_EN_C,TDC_EN_C,TDC_RST_C,TDC_COMPUTE_C,DFF_RST_C,CTRL_EN_C,CTRL_VB_C,CTRL_VBP_C,CTRL_VBN_C,BANK_EN[3:0],WL_EN,SA_EN,BL_PCHG,CLK_SA,WRITE_EN,CS[1:0],SCN_SEL[3:0],CLK_A,CLK_B,IN_EN,SCN_IN,InputEN_DAC,CALIB_EN,BANK_SEL,CHG_EN,RST_CAP_B,VDAC_CTRL,VTC_EN,TDC_EN,TDC_RST,TDC_COMPUTE,DFF_RST,CTRL_EN,CTRL_VB,CTRL_VBP,CTRL_VBN,scan_mode_setting_in[31:0],dig_out[1:0],clk,in_tvalid,in_tlast,in_tdata[31:0],in_tready,out_tready,out_tvalid,out_tlast,out_tdata[31:0],SCAN_DONE_FLAGS[3:0]" */;
  input [3:0]BANK_EN_C;
  input WL_EN_C;
  input SA_EN_C;
  input BL_PCHG_C;
  input CLK_SA_C;
  input WRITE_EN_C;
  input [1:0]CS_C;
  input [3:0]SCN_SEL_C;
  input CLK_A_C;
  input CLK_B_C;
  input IN_EN_C;
  input SCN_IN_C;
  input InputEN_DAC_C;
  input CALIB_EN_C;
  input BANK_SEL_C;
  input CHG_EN_C;
  input RST_CAP_B_C;
  input VDAC_CTRL_C;
  input VTC_EN_C;
  input TDC_EN_C;
  input TDC_RST_C;
  input TDC_COMPUTE_C;
  input DFF_RST_C;
  input CTRL_EN_C;
  input CTRL_VB_C;
  input CTRL_VBP_C;
  input CTRL_VBN_C;
  output [3:0]BANK_EN;
  output WL_EN;
  output SA_EN;
  output BL_PCHG;
  output CLK_SA;
  output WRITE_EN;
  output [1:0]CS;
  output [3:0]SCN_SEL;
  output CLK_A;
  output CLK_B;
  output IN_EN;
  output SCN_IN;
  output InputEN_DAC;
  output CALIB_EN;
  output BANK_SEL;
  output CHG_EN;
  output RST_CAP_B;
  output VDAC_CTRL;
  output VTC_EN;
  output TDC_EN;
  output TDC_RST;
  output TDC_COMPUTE;
  output DFF_RST;
  output CTRL_EN;
  output CTRL_VB;
  output CTRL_VBP;
  output CTRL_VBN;
  input [31:0]scan_mode_setting_in;
  input [1:0]dig_out;
  input clk;
  input in_tvalid;
  input in_tlast;
  input [31:0]in_tdata;
  output in_tready;
  input out_tready;
  output out_tvalid;
  output out_tlast;
  output [31:0]out_tdata;
  output [3:0]SCAN_DONE_FLAGS;
endmodule
