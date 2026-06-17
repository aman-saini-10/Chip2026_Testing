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


// IP VLNV: xilinx.com:module_ref:Unbundle_AXI_Bus:1.0
// IP Revision: 1

(* X_CORE_INFO = "Unbundle_AXI_Bus,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "design_1_Unbundle_AXI_Bus_0_0,Unbundle_AXI_Bus,{}" *)
(* CORE_GENERATION_INFO = "design_1_Unbundle_AXI_Bus_0_0,Unbundle_AXI_Bus,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=Unbundle_AXI_Bus,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_Unbundle_AXI_Bus_0_0 (
  DIG_AXI_IN_0,
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
  CTRL_VBN_C
);

input wire [31 : 0] DIG_AXI_IN_0;
input wire [1 : 0] DIG_AXI_IN_1;
output wire [3 : 0] BANK_EN_C;
output wire WL_EN_C;
output wire SA_EN_C;
output wire BL_PCHG_C;
output wire CLK_SA_C;
output wire WRITE_EN_C;
output wire [1 : 0] CS_C;
output wire [3 : 0] SCN_SEL_C;
output wire CLK_A_C;
output wire CLK_B_C;
output wire IN_EN_C;
output wire SCN_IN_C;
output wire InputEN_DAC_C;
output wire CALIB_EN_C;
output wire BANK_SEL_C;
output wire CHG_EN_C;
output wire RST_CAP_B_C;
output wire VDAC_CTRL_C;
output wire VTC_EN_C;
output wire TDC_EN_C;
output wire TDC_RST_C;
output wire TDC_COMPUTE_C;
output wire DFF_RST_C;
output wire CTRL_EN_C;
output wire CTRL_VB_C;
output wire CTRL_VBP_C;
output wire CTRL_VBN_C;

  Unbundle_AXI_Bus inst (
    .DIG_AXI_IN_0(DIG_AXI_IN_0),
    .DIG_AXI_IN_1(DIG_AXI_IN_1),
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
    .CTRL_VBN_C(CTRL_VBN_C)
  );
endmodule
