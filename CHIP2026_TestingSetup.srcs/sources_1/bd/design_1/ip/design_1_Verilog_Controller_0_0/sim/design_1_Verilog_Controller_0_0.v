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


// IP VLNV: xilinx.com:module_ref:Verilog_Controller:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_Verilog_Controller_0_0 (
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
  CTRL_VBN_C,
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
  scan_mode_setting_in,
  dig_out,
  clk,
  in_tvalid,
  in_tlast,
  in_tdata,
  in_tready,
  out_tready,
  out_tvalid,
  out_tlast,
  out_tdata,
  SCAN_DONE_FLAGS
);

input wire [3 : 0] BANK_EN_C;
input wire WL_EN_C;
input wire SA_EN_C;
input wire BL_PCHG_C;
input wire CLK_SA_C;
input wire WRITE_EN_C;
input wire [1 : 0] CS_C;
input wire [3 : 0] SCN_SEL_C;
input wire CLK_A_C;
input wire CLK_B_C;
input wire IN_EN_C;
input wire SCN_IN_C;
input wire InputEN_DAC_C;
input wire CALIB_EN_C;
input wire BANK_SEL_C;
input wire CHG_EN_C;
input wire RST_CAP_B_C;
input wire VDAC_CTRL_C;
input wire VTC_EN_C;
input wire TDC_EN_C;
input wire TDC_RST_C;
input wire TDC_COMPUTE_C;
input wire DFF_RST_C;
input wire CTRL_EN_C;
input wire CTRL_VB_C;
input wire CTRL_VBP_C;
input wire CTRL_VBN_C;
output wire [3 : 0] BANK_EN;
output wire WL_EN;
output wire SA_EN;
output wire BL_PCHG;
output wire CLK_SA;
output wire WRITE_EN;
output wire [1 : 0] CS;
output wire [3 : 0] SCN_SEL;
output wire CLK_A;
output wire CLK_B;
output wire IN_EN;
output wire SCN_IN;
output wire InputEN_DAC;
output wire CALIB_EN;
output wire BANK_SEL;
output wire CHG_EN;
output wire RST_CAP_B;
output wire VDAC_CTRL;
output wire VTC_EN;
output wire TDC_EN;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TDC_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 TDC_RST RST" *)
output wire TDC_RST;
output wire TDC_COMPUTE;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DFF_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 DFF_RST RST" *)
output wire DFF_RST;
output wire CTRL_EN;
output wire CTRL_VB;
output wire CTRL_VBP;
output wire CTRL_VBN;
input wire [31 : 0] scan_mode_setting_in;
input wire [1 : 0] dig_out;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF in:out, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in TVALID" *)
input wire in_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in TLAST" *)
input wire in_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in TDATA" *)
input wire [31 : 0] in_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in TREADY" *)
output wire in_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out TREADY" *)
input wire out_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out TVALID" *)
output wire out_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out TLAST" *)
output wire out_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out TDATA" *)
output wire [31 : 0] out_tdata;
output wire [3 : 0] SCAN_DONE_FLAGS;

  Verilog_Controller inst (
    .BANK_EN_C(BANK_EN_C),
    .WL_EN_C(WL_EN_C),
    .SA_EN_C(SA_EN_C),
    .BL_PCHG_C(BL_PCHG_C),
    .CLK_SA_C(CLK_SA_C),
    .WRITE_EN_C(WRITE_EN_C),
    .CS_C(CS_C),
    .SCN_SEL_C(SCN_SEL_C),
    .CLK_A_C(CLK_A_C),
    .CLK_B_C(CLK_B_C),
    .IN_EN_C(IN_EN_C),
    .SCN_IN_C(SCN_IN_C),
    .InputEN_DAC_C(InputEN_DAC_C),
    .CALIB_EN_C(CALIB_EN_C),
    .BANK_SEL_C(BANK_SEL_C),
    .CHG_EN_C(CHG_EN_C),
    .RST_CAP_B_C(RST_CAP_B_C),
    .VDAC_CTRL_C(VDAC_CTRL_C),
    .VTC_EN_C(VTC_EN_C),
    .TDC_EN_C(TDC_EN_C),
    .TDC_RST_C(TDC_RST_C),
    .TDC_COMPUTE_C(TDC_COMPUTE_C),
    .DFF_RST_C(DFF_RST_C),
    .CTRL_EN_C(CTRL_EN_C),
    .CTRL_VB_C(CTRL_VB_C),
    .CTRL_VBP_C(CTRL_VBP_C),
    .CTRL_VBN_C(CTRL_VBN_C),
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
    .scan_mode_setting_in(scan_mode_setting_in),
    .dig_out(dig_out),
    .clk(clk),
    .in_tvalid(in_tvalid),
    .in_tlast(in_tlast),
    .in_tdata(in_tdata),
    .in_tready(in_tready),
    .out_tready(out_tready),
    .out_tvalid(out_tvalid),
    .out_tlast(out_tlast),
    .out_tdata(out_tdata),
    .SCAN_DONE_FLAGS(SCAN_DONE_FLAGS)
  );
endmodule
