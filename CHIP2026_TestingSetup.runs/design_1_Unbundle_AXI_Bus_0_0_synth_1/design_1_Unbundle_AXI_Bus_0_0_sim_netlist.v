// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jun 17 17:56:34 2026
// Host        : aman-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_Unbundle_AXI_Bus_0_0_sim_netlist.v
// Design      : design_1_Unbundle_AXI_Bus_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_Unbundle_AXI_Bus_0_0,Unbundle_AXI_Bus,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "Unbundle_AXI_Bus,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (DIG_AXI_IN_0,
    DIG_AXI_IN_1,
    BANK_EN_C,
    WL_EN_C,
    SA_EN_C,
    BL_PCHG_C,
    CLK_SA_C,
    WRITE_EN_C,
    CS_C,
    SCN_SEL_C,
    CLK_A_C,
    CLK_B_C,
    IN_EN_C,
    SCN_IN_C,
    InputEN_DAC_C,
    CALIB_EN_C,
    BANK_SEL_C,
    CHG_EN_C,
    RST_CAP_B_C,
    VDAC_CTRL_C,
    VTC_EN_C,
    TDC_EN_C,
    TDC_RST_C,
    TDC_COMPUTE_C,
    DFF_RST_C,
    CTRL_EN_C,
    CTRL_VB_C,
    CTRL_VBP_C,
    CTRL_VBN_C);
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

  wire [31:0]DIG_AXI_IN_0;
  wire [1:0]DIG_AXI_IN_1;

  assign BANK_EN_C[3:0] = DIG_AXI_IN_0[3:0];
  assign BANK_SEL_C = DIG_AXI_IN_0[17];
  assign BL_PCHG_C = DIG_AXI_IN_0[6];
  assign CALIB_EN_C = DIG_AXI_IN_0[16];
  assign CHG_EN_C = DIG_AXI_IN_0[18];
  assign CLK_A_C = DIG_AXI_IN_0[27];
  assign CLK_B_C = DIG_AXI_IN_0[28];
  assign CLK_SA_C = DIG_AXI_IN_0[7];
  assign CS_C[1:0] = DIG_AXI_IN_0[10:9];
  assign CTRL_EN_C = DIG_AXI_IN_0[26];
  assign CTRL_VBN_C = DIG_AXI_IN_1[1];
  assign CTRL_VBP_C = DIG_AXI_IN_1[0];
  assign CTRL_VB_C = DIG_AXI_IN_0[31];
  assign DFF_RST_C = DIG_AXI_IN_0[25];
  assign IN_EN_C = DIG_AXI_IN_0[29];
  assign InputEN_DAC_C = DIG_AXI_IN_0[15];
  assign RST_CAP_B_C = DIG_AXI_IN_0[19];
  assign SA_EN_C = DIG_AXI_IN_0[5];
  assign SCN_IN_C = DIG_AXI_IN_0[30];
  assign SCN_SEL_C[3:0] = DIG_AXI_IN_0[14:11];
  assign TDC_COMPUTE_C = DIG_AXI_IN_0[24];
  assign TDC_EN_C = DIG_AXI_IN_0[22];
  assign TDC_RST_C = DIG_AXI_IN_0[23];
  assign VDAC_CTRL_C = DIG_AXI_IN_0[20];
  assign VTC_EN_C = DIG_AXI_IN_0[21];
  assign WL_EN_C = DIG_AXI_IN_0[4];
  assign WRITE_EN_C = DIG_AXI_IN_0[8];
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
