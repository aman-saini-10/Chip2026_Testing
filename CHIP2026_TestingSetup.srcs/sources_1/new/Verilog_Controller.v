`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2026 23:13:12
// Design Name: 
// Module Name: Verilog_Controller
// Project Name: 
// Target Devices: 
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
    input  [3:0] BANK_EN_C,

    // Read-Write Signals
    input        WL_EN_C,
    input        SA_EN_C,
    input        BL_PCHG_C,
    input        CLK_SA_C,
    input        WRITE_EN_C,
    input  [1:0] CS_C,

    // Scan-Chain Signals
    input  [3:0] SCN_SEL_C,
    input        CLK_A_C,
    input        CLK_B_C,
    input        IN_EN_C,
    input        SCN_IN_C,

    // Compute Control Signals
    input        InputEN_DAC_C,
    input        CALIB_EN_C,
    input        BANK_SEL_C,
    input        CHG_EN_C,
    input        RST_CAP_B_C,
    input        VDAC_CTRL_C,
    input        VTC_EN_C,
    input        TDC_EN_C,
    input        TDC_RST_C,
    input        TDC_COMPUTE_C,
    input        DFF_RST_C,
    input        CTRL_EN_C,

    // PCB TMUX control signals
    input        CTRL_VB_C,
    input        CTRL_VBP_C,
    input        CTRL_VBN_C,

    ////////////////////////////////////////////////////////

    output [3:0] BANK_EN,

    output       WL_EN,
    output       SA_EN,
    output       BL_PCHG,
    output       CLK_SA,
    output       WRITE_EN,
    output [1:0] CS,

    output [3:0] SCN_SEL,
    output       CLK_A,
    output       CLK_B,
    output       IN_EN,
    output       SCN_IN,

    output       InputEN_DAC,
    output       CALIB_EN,
    output       BANK_SEL,
    output       CHG_EN,
    output       RST_CAP_B,
    output       VDAC_CTRL,
    output       VTC_EN,
    output       TDC_EN,
    output       TDC_RST,
    output       TDC_COMPUTE,
    output       DFF_RST,
    output       CTRL_EN,

    // PCB TMUX control signals
    output       CTRL_VB,
    output       CTRL_VBP,
    output       CTRL_VBN,

    // Renamed to avoid AXI inference issues
    input  [31:0] scan_mode_setting_in,
    input  [1:0]  dig_out,

    ////////////////////////////////////////////////////////
    // DMA / Stream Signals
    ////////////////////////////////////////////////////////

    input         clk,

    input         in_tvalid,
    input         in_tlast,
    input  [31:0] in_tdata,
    output        in_tready,

    input         out_tready,
    output        out_tvalid,
    output        out_tlast,
    output [31:0] out_tdata,

    ////////////////////////////////////////////////////////
    // Scan Data Flags
    ////////////////////////////////////////////////////////

    output [3:0] SCAN_DONE_FLAGS

);


endmodule