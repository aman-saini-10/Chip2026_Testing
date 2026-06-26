// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jun 24 10:52:25 2026
// Host        : aman-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Chip2026_Testing/CHIP2026_TestingSetup/CHIP2026_TestingSetup.srcs/sources_1/bd/design_1/ip/design_1_TO_FMC_0_0/design_1_TO_FMC_0_0_stub.v
// Design      : design_1_TO_FMC_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "TO_FMC,Vivado 2018.3" *)
module design_1_TO_FMC_0_0(BANK_EN, WL_EN, SA_EN, BL_PCHG, CLK_SA, WRITE_EN, CS, 
  SCN_SEL, CLK_A, CLK_B, IN_EN, SCN_IN, InputEN_DAC, CALIB_EN, BANK_SEL, CHG_EN, RST_CAP_B, VDAC_CTRL, 
  VTC_EN, TDC_EN, TDC_RST, TDC_COMPUTE, DFF_RST, CTRL_EN, CTRL_VB, CTRL_VBP, CTRL_VBN, FMC_L21, 
  FMC_L22, FMC_R19, FMC_T19, FMC_K19, FMC_K20, FMC_D20, FMC_C20, FMC_E21, FMC_D21, FMC_N19, FMC_N20, 
  FMC_J18, FMC_K18, FMC_R20, FMC_R21, FMC_L17, FMC_M17, FMC_B19, FMC_B20, FMC_E15, FMC_D15, FMC_F18, 
  FMC_E18, FMC_M19, FMC_M20, FMC_N22, FMC_P22, FMC_J21, FMC_J22, FMC_G20, FMC_G21, FMC_G19, FMC_F19, 
  FMC_D22, FMC_C22, FMC_B16, FMC_B17, FMC_B21, FMC_B22, FMC_C17, FMC_C18, DIG_AXI_OUT_0, 
  DIG_DEBUG_AXI_OUT_0, DIG_DEBUG_AXI_OUT_1)
/* synthesis syn_black_box black_box_pad_pin="BANK_EN[3:0],WL_EN,SA_EN,BL_PCHG,CLK_SA,WRITE_EN,CS[1:0],SCN_SEL[3:0],CLK_A,CLK_B,IN_EN,SCN_IN,InputEN_DAC,CALIB_EN,BANK_SEL,CHG_EN,RST_CAP_B,VDAC_CTRL,VTC_EN,TDC_EN,TDC_RST,TDC_COMPUTE,DFF_RST,CTRL_EN,CTRL_VB,CTRL_VBP,CTRL_VBN,FMC_L21,FMC_L22,FMC_R19,FMC_T19,FMC_K19,FMC_K20,FMC_D20,FMC_C20,FMC_E21,FMC_D21,FMC_N19,FMC_N20,FMC_J18,FMC_K18,FMC_R20,FMC_R21,FMC_L17,FMC_M17,FMC_B19,FMC_B20,FMC_E15,FMC_D15,FMC_F18,FMC_E18,FMC_M19,FMC_M20,FMC_N22,FMC_P22,FMC_J21,FMC_J22,FMC_G20,FMC_G21,FMC_G19,FMC_F19,FMC_D22,FMC_C22,FMC_B16,FMC_B17,FMC_B21,FMC_B22,FMC_C17,FMC_C18,DIG_AXI_OUT_0[1:0],DIG_DEBUG_AXI_OUT_0[31:0],DIG_DEBUG_AXI_OUT_1[1:0]" */;
  input [3:0]BANK_EN;
  input WL_EN;
  input SA_EN;
  input BL_PCHG;
  input CLK_SA;
  input WRITE_EN;
  input [1:0]CS;
  input [3:0]SCN_SEL;
  input CLK_A;
  input CLK_B;
  input IN_EN;
  input SCN_IN;
  input InputEN_DAC;
  input CALIB_EN;
  input BANK_SEL;
  input CHG_EN;
  input RST_CAP_B;
  input VDAC_CTRL;
  input VTC_EN;
  input TDC_EN;
  input TDC_RST;
  input TDC_COMPUTE;
  input DFF_RST;
  input CTRL_EN;
  input CTRL_VB;
  input CTRL_VBP;
  input CTRL_VBN;
  output FMC_L21;
  output FMC_L22;
  output FMC_R19;
  output FMC_T19;
  output FMC_K19;
  output FMC_K20;
  output FMC_D20;
  output FMC_C20;
  output FMC_E21;
  output FMC_D21;
  output FMC_N19;
  output FMC_N20;
  output FMC_J18;
  output FMC_K18;
  output FMC_R20;
  output FMC_R21;
  output FMC_L17;
  output FMC_M17;
  output FMC_B19;
  output FMC_B20;
  output FMC_E15;
  output FMC_D15;
  output FMC_F18;
  output FMC_E18;
  output FMC_M19;
  output FMC_M20;
  output FMC_N22;
  output FMC_P22;
  output FMC_J21;
  output FMC_J22;
  output FMC_G20;
  output FMC_G21;
  output FMC_G19;
  output FMC_F19;
  output FMC_D22;
  output FMC_C22;
  output FMC_B16;
  output FMC_B17;
  output FMC_B21;
  output FMC_B22;
  input FMC_C17;
  input FMC_C18;
  output [1:0]DIG_AXI_OUT_0;
  output [31:0]DIG_DEBUG_AXI_OUT_0;
  output [1:0]DIG_DEBUG_AXI_OUT_1;
endmodule
