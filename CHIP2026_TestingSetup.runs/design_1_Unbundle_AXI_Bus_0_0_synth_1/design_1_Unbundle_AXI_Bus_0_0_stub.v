// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jun 24 10:52:25 2026
// Host        : aman-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_Unbundle_AXI_Bus_0_0_stub.v
// Design      : design_1_Unbundle_AXI_Bus_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Unbundle_AXI_Bus,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(DIG_AXI_IN_0, DIG_AXI_IN_1, BANK_EN_C, WL_EN_C, 
  SA_EN_C, BL_PCHG_C, CLK_SA_C, WRITE_EN_C, CS_C, SCN_SEL_C, CLK_A_C, CLK_B_C, IN_EN_C, SCN_IN_C, 
  InputEN_DAC_C, CALIB_EN_C, BANK_SEL_C, CHG_EN_C, RST_CAP_B_C, VDAC_CTRL_C, VTC_EN_C, TDC_EN_C, 
  TDC_RST_C, TDC_COMPUTE_C, DFF_RST_C, CTRL_EN_C, CTRL_VB_C, CTRL_VBP_C, CTRL_VBN_C)
/* synthesis syn_black_box black_box_pad_pin="DIG_AXI_IN_0[31:0],DIG_AXI_IN_1[1:0],BANK_EN_C[3:0],WL_EN_C,SA_EN_C,BL_PCHG_C,CLK_SA_C,WRITE_EN_C,CS_C[1:0],SCN_SEL_C[3:0],CLK_A_C,CLK_B_C,IN_EN_C,SCN_IN_C,InputEN_DAC_C,CALIB_EN_C,BANK_SEL_C,CHG_EN_C,RST_CAP_B_C,VDAC_CTRL_C,VTC_EN_C,TDC_EN_C,TDC_RST_C,TDC_COMPUTE_C,DFF_RST_C,CTRL_EN_C,CTRL_VB_C,CTRL_VBP_C,CTRL_VBN_C" */;
  input [31:0]DIG_AXI_IN_0;
  input [1:0]DIG_AXI_IN_1;
  output [3:0]BANK_EN_C;
  output WL_EN_C;
  output SA_EN_C;
  output BL_PCHG_C;
  output CLK_SA_C;
  output WRITE_EN_C;
  output [1:0]CS_C;
  output [3:0]SCN_SEL_C;
  output CLK_A_C;
  output CLK_B_C;
  output IN_EN_C;
  output SCN_IN_C;
  output InputEN_DAC_C;
  output CALIB_EN_C;
  output BANK_SEL_C;
  output CHG_EN_C;
  output RST_CAP_B_C;
  output VDAC_CTRL_C;
  output VTC_EN_C;
  output TDC_EN_C;
  output TDC_RST_C;
  output TDC_COMPUTE_C;
  output DFF_RST_C;
  output CTRL_EN_C;
  output CTRL_VB_C;
  output CTRL_VBP_C;
  output CTRL_VBN_C;
endmodule
