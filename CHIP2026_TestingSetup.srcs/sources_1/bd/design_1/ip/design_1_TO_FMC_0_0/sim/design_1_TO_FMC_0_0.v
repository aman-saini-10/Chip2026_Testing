// (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:TO_FMC:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_TO_FMC_0_0 (
  BANK_EN,
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
  DIG_DEBUG_AXI_OUT_1
);

input wire [3 : 0] BANK_EN;
input wire WL_EN;
input wire SA_EN;
input wire BL_PCHG;
input wire CLK_SA;
input wire WRITE_EN;
input wire [1 : 0] CS;
input wire [3 : 0] SCN_SEL;
input wire CLK_A;
input wire CLK_B;
input wire IN_EN;
input wire SCN_IN;
input wire InputEN_DAC;
input wire CALIB_EN;
input wire BANK_SEL;
input wire CHG_EN;
input wire RST_CAP_B;
input wire VDAC_CTRL;
input wire VTC_EN;
input wire TDC_EN;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TDC_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 TDC_RST RST" *)
input wire TDC_RST;
input wire TDC_COMPUTE;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DFF_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 DFF_RST RST" *)
input wire DFF_RST;
input wire CTRL_EN;
input wire CTRL_VB;
input wire CTRL_VBP;
input wire CTRL_VBN;
output wire FMC_L21;
output wire FMC_L22;
output wire FMC_R19;
output wire FMC_T19;
output wire FMC_K19;
output wire FMC_K20;
output wire FMC_D20;
output wire FMC_C20;
output wire FMC_E21;
output wire FMC_D21;
output wire FMC_N19;
output wire FMC_N20;
output wire FMC_J18;
output wire FMC_K18;
output wire FMC_R20;
output wire FMC_R21;
output wire FMC_L17;
output wire FMC_M17;
output wire FMC_B19;
output wire FMC_B20;
output wire FMC_E15;
output wire FMC_D15;
output wire FMC_F18;
output wire FMC_E18;
output wire FMC_M19;
output wire FMC_M20;
output wire FMC_N22;
output wire FMC_P22;
output wire FMC_J21;
output wire FMC_J22;
output wire FMC_G20;
output wire FMC_G21;
output wire FMC_G19;
output wire FMC_F19;
output wire FMC_D22;
output wire FMC_C22;
output wire FMC_B16;
output wire FMC_B17;
output wire FMC_B21;
output wire FMC_B22;
input wire FMC_C17;
input wire FMC_C18;
output wire [1 : 0] DIG_AXI_OUT_0;
output wire [31 : 0] DIG_DEBUG_AXI_OUT_0;
output wire [1 : 0] DIG_DEBUG_AXI_OUT_1;

  TO_FMC inst (
    .BANK_EN(BANK_EN),
    .WL_EN(WL_EN),
    .SA_EN(SA_EN),
    .BL_PCHG(BL_PCHG),
    .CLK_SA(CLK_SA),
    .WRITE_EN(WRITE_EN),
    .CS(CS),
    .SCN_SEL(SCN_SEL),
    .CLK_A(CLK_A),
    .CLK_B(CLK_B),
    .IN_EN(IN_EN),
    .SCN_IN(SCN_IN),
    .InputEN_DAC(InputEN_DAC),
    .CALIB_EN(CALIB_EN),
    .BANK_SEL(BANK_SEL),
    .CHG_EN(CHG_EN),
    .RST_CAP_B(RST_CAP_B),
    .VDAC_CTRL(VDAC_CTRL),
    .VTC_EN(VTC_EN),
    .TDC_EN(TDC_EN),
    .TDC_RST(TDC_RST),
    .TDC_COMPUTE(TDC_COMPUTE),
    .DFF_RST(DFF_RST),
    .CTRL_EN(CTRL_EN),
    .CTRL_VB(CTRL_VB),
    .CTRL_VBP(CTRL_VBP),
    .CTRL_VBN(CTRL_VBN),
    .FMC_L21(FMC_L21),
    .FMC_L22(FMC_L22),
    .FMC_R19(FMC_R19),
    .FMC_T19(FMC_T19),
    .FMC_K19(FMC_K19),
    .FMC_K20(FMC_K20),
    .FMC_D20(FMC_D20),
    .FMC_C20(FMC_C20),
    .FMC_E21(FMC_E21),
    .FMC_D21(FMC_D21),
    .FMC_N19(FMC_N19),
    .FMC_N20(FMC_N20),
    .FMC_J18(FMC_J18),
    .FMC_K18(FMC_K18),
    .FMC_R20(FMC_R20),
    .FMC_R21(FMC_R21),
    .FMC_L17(FMC_L17),
    .FMC_M17(FMC_M17),
    .FMC_B19(FMC_B19),
    .FMC_B20(FMC_B20),
    .FMC_E15(FMC_E15),
    .FMC_D15(FMC_D15),
    .FMC_F18(FMC_F18),
    .FMC_E18(FMC_E18),
    .FMC_M19(FMC_M19),
    .FMC_M20(FMC_M20),
    .FMC_N22(FMC_N22),
    .FMC_P22(FMC_P22),
    .FMC_J21(FMC_J21),
    .FMC_J22(FMC_J22),
    .FMC_G20(FMC_G20),
    .FMC_G21(FMC_G21),
    .FMC_G19(FMC_G19),
    .FMC_F19(FMC_F19),
    .FMC_D22(FMC_D22),
    .FMC_C22(FMC_C22),
    .FMC_B16(FMC_B16),
    .FMC_B17(FMC_B17),
    .FMC_B21(FMC_B21),
    .FMC_B22(FMC_B22),
    .FMC_C17(FMC_C17),
    .FMC_C18(FMC_C18),
    .DIG_AXI_OUT_0(DIG_AXI_OUT_0),
    .DIG_DEBUG_AXI_OUT_0(DIG_DEBUG_AXI_OUT_0),
    .DIG_DEBUG_AXI_OUT_1(DIG_DEBUG_AXI_OUT_1)
  );
endmodule
