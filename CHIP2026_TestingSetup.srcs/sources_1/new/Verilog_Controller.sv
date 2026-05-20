`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Indian Institute of Technology, Madras
// Engineer: ESB 118
// 
// Create Date: 20.05.2026 19:38:14
// Design Name: Verilog_Controller_v1
// Module Name: Verilog_Controller
// Project Name: CHIP 2026
// Target Devices: Zynq 7000
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Verilog_Controller(
    ////////////////////////////////////////////////////////
    // Bank-Enable Signals
    input [0:3] BANK_EN_C,
    
    // Read-Write Signals
    input WL_EN_C,
    input SA_EN_C,
    input BL_PCHG_C,
    input CLK_SA_C,
    input WRITE_EN_C,
    input [0:1] CS_C,       // Column-Select

    // Scan-Chain Signals
    input [0:3] SCN_SEL_C,   // Scan-Select
    input CLK_A_C, CLK_B_C, IN_EN_C, SCN_IN_C,
    
    // Compute Control Signals
    input InputEN_DAC_C,
    input CALIB_EN_C,
    input BANK_SEL_C,
    input CHG_EN_C,
    input RST_CAP_B_C,      // active-low reset
    input VDAC_CTRL_C,
    input VTC_EN_C,
    input TDC_EN_C,
    input TDC_RST_C,
    input TDC_COMPUTE_C,
    input DFF_RST_C,        // Control Logic Reset
    input CTRL_EN_C,        // Control Logic Enable
    
    // PCB TMUX control signals
    input CTRL_VB_C,        // VTC bias voltages
    input CTRL_VBP_C,       // Oscillator PMOS bias voltages
    input CTRL_VBN_C,       // Oscillator NMOS bias voltages
    ////////////////////////////////////////////////////////
    output [0:3] BANK_EN,
    
    output WL_EN,
    output SA_EN,
    output BL_PCHG,
    output CLK_SA,
    output WRITE_EN,
    output [0:1] CS,
    
    output [0:3] SCN_SEL,
    output CLK_A, CLK_B, IN_EN, SCN_IN,
    
    output InputEN_DAC,
    output CALIB_EN,
    output BANK_SEL,
    output CHG_EN,
    output RST_CAP_B,
    output VDAC_CTRL,
    output VTC_EN,
    output TDC_EN,
    output TDC_RST,
    output TDC_COMPUTE,
    output DFF_RST,
    output CTRL_EN,
    
    // PCB TMUX control signals
    output CTRL_VB,
    output CTRL_VBP,
    output CTRL_VBN,

    input [31:0] SCAN_MODE_SETTING_AXI_IN,
    input[1:0] DIG_AXI_OUT,
    //DMA STUFF
    input wire clk,
    input wire s_axis_tvalid,
    input wire s_axis_tlast,
    input wire [31:0] s_axis_tdata,
    output wire s_axis_tready,
    input wire m_axis_tready,
    output wire m_axis_tvalid,
    output wire m_axis_tlast,
    output wire [31:0] m_axis_tdata,
    //Scan Data Flags
    output wire [3:0] SCAN_DONE_FLAGS
    );
endmodule
