// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jun 17 17:57:23 2026
// Host        : aman-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Chip2026_Testing/CHIP2026_TestingSetup/CHIP2026_TestingSetup.srcs/sources_1/bd/design_1/ip/design_1_TO_FMC_0_0/design_1_TO_FMC_0_0_sim_netlist.v
// Design      : design_1_TO_FMC_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_TO_FMC_0_0,TO_FMC,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "TO_FMC,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module design_1_TO_FMC_0_0
   (BANK_EN,
    WL_EN,
    SA_EN,
    BL_PCHG,
    CLK_SA,
    WRITE_EN,
    CS,
    SCN_SEL,
    CLK_A,
    CLK_B,
    IN_EN,
    SCN_IN,
    InputEN_DAC,
    CALIB_EN,
    BANK_SEL,
    CHG_EN,
    RST_CAP_B,
    VDAC_CTRL,
    VTC_EN,
    TDC_EN,
    TDC_RST,
    TDC_COMPUTE,
    DFF_RST,
    CTRL_EN,
    CTRL_VB,
    CTRL_VBP,
    CTRL_VBN,
    FMC_L21,
    FMC_L22,
    FMC_R19,
    FMC_T19,
    FMC_K19,
    FMC_K20,
    FMC_D20,
    FMC_C20,
    FMC_E21,
    FMC_D21,
    FMC_N19,
    FMC_N20,
    FMC_J18,
    FMC_K18,
    FMC_R20,
    FMC_R21,
    FMC_L17,
    FMC_M17,
    FMC_B19,
    FMC_B20,
    FMC_E15,
    FMC_D15,
    FMC_F18,
    FMC_E18,
    FMC_M19,
    FMC_M20,
    FMC_N22,
    FMC_P22,
    FMC_J21,
    FMC_J22,
    FMC_G20,
    FMC_G21,
    FMC_G19,
    FMC_F19,
    FMC_D22,
    FMC_C22,
    FMC_B16,
    FMC_B17,
    FMC_B21,
    FMC_B22,
    FMC_C17,
    FMC_C18,
    DIG_AXI_OUT_0,
    DIG_DEBUG_AXI_OUT_0,
    DIG_DEBUG_AXI_OUT_1);
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 TDC_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TDC_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input TDC_RST;
  input TDC_COMPUTE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 DFF_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DFF_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input DFF_RST;
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

  wire [3:0]BANK_EN;
  wire BANK_SEL;
  wire BL_PCHG;
  wire CALIB_EN;
  wire CHG_EN;
  wire CLK_A;
  wire CLK_B;
  wire CLK_SA;
  wire [1:0]CS;
  wire CTRL_EN;
  wire CTRL_VB;
  wire CTRL_VBN;
  wire CTRL_VBP;
  wire DFF_RST;
  wire FMC_C17;
  wire FMC_C18;
  wire IN_EN;
  wire InputEN_DAC;
  wire RST_CAP_B;
  wire SA_EN;
  wire SCN_IN;
  wire [3:0]SCN_SEL;
  wire TDC_COMPUTE;
  wire TDC_EN;
  wire TDC_RST;
  wire VDAC_CTRL;
  wire VTC_EN;
  wire WL_EN;
  wire WRITE_EN;

  assign DIG_AXI_OUT_0[1] = FMC_C17;
  assign DIG_AXI_OUT_0[0] = FMC_C18;
  assign DIG_DEBUG_AXI_OUT_0[31] = CTRL_VB;
  assign DIG_DEBUG_AXI_OUT_0[30] = SCN_IN;
  assign DIG_DEBUG_AXI_OUT_0[29] = IN_EN;
  assign DIG_DEBUG_AXI_OUT_0[28] = CLK_B;
  assign DIG_DEBUG_AXI_OUT_0[27] = CLK_A;
  assign DIG_DEBUG_AXI_OUT_0[26] = CTRL_EN;
  assign DIG_DEBUG_AXI_OUT_0[25] = DFF_RST;
  assign DIG_DEBUG_AXI_OUT_0[24] = TDC_COMPUTE;
  assign DIG_DEBUG_AXI_OUT_0[23] = TDC_RST;
  assign DIG_DEBUG_AXI_OUT_0[22] = TDC_EN;
  assign DIG_DEBUG_AXI_OUT_0[21] = VTC_EN;
  assign DIG_DEBUG_AXI_OUT_0[20] = VDAC_CTRL;
  assign DIG_DEBUG_AXI_OUT_0[19] = RST_CAP_B;
  assign DIG_DEBUG_AXI_OUT_0[18] = CHG_EN;
  assign DIG_DEBUG_AXI_OUT_0[17] = BANK_SEL;
  assign DIG_DEBUG_AXI_OUT_0[16] = CALIB_EN;
  assign DIG_DEBUG_AXI_OUT_0[15] = InputEN_DAC;
  assign DIG_DEBUG_AXI_OUT_0[14:11] = SCN_SEL;
  assign DIG_DEBUG_AXI_OUT_0[10:9] = CS;
  assign DIG_DEBUG_AXI_OUT_0[8] = WRITE_EN;
  assign DIG_DEBUG_AXI_OUT_0[7] = CLK_SA;
  assign DIG_DEBUG_AXI_OUT_0[6] = BL_PCHG;
  assign DIG_DEBUG_AXI_OUT_0[5] = SA_EN;
  assign DIG_DEBUG_AXI_OUT_0[4] = WL_EN;
  assign DIG_DEBUG_AXI_OUT_0[3:0] = BANK_EN;
  assign DIG_DEBUG_AXI_OUT_1[1] = CTRL_VBP;
  assign DIG_DEBUG_AXI_OUT_1[0] = CTRL_VBN;
  assign FMC_B16 = CTRL_VB;
  assign FMC_B17 = CTRL_VBP;
  assign FMC_B19 = RST_CAP_B;
  assign FMC_B20 = CHG_EN;
  assign FMC_B21 = CTRL_VBN;
  assign FMC_C20 = CLK_SA;
  assign FMC_C22 = SCN_IN;
  assign FMC_D20 = BL_PCHG;
  assign FMC_D21 = SA_EN;
  assign FMC_D22 = IN_EN;
  assign FMC_E21 = WRITE_EN;
  assign FMC_F19 = CLK_B;
  assign FMC_G19 = CLK_A;
  assign FMC_G21 = CTRL_EN;
  assign FMC_J18 = SCN_SEL[2];
  assign FMC_J21 = DFF_RST;
  assign FMC_J22 = TDC_COMPUTE;
  assign FMC_K18 = SCN_SEL[3];
  assign FMC_K19 = BANK_EN[2];
  assign FMC_K20 = InputEN_DAC;
  assign FMC_L17 = CALIB_EN;
  assign FMC_L21 = WL_EN;
  assign FMC_L22 = BANK_EN[0];
  assign FMC_M17 = BANK_SEL;
  assign FMC_M19 = VDAC_CTRL;
  assign FMC_M20 = VTC_EN;
  assign FMC_N19 = SCN_SEL[0];
  assign FMC_N20 = SCN_SEL[1];
  assign FMC_N22 = TDC_EN;
  assign FMC_P22 = TDC_RST;
  assign FMC_R19 = BANK_EN[1];
  assign FMC_R20 = CS[0];
  assign FMC_R21 = CS[1];
  assign FMC_T19 = BANK_EN[3];
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
