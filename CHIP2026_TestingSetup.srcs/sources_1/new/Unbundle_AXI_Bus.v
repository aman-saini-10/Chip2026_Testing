`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2026 23:14:53
// Design Name: 
// Module Name: Unbundle_AXI_Bus
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


module Unbundle_AXI_Bus(

    // AXI Bus input
    input  [31:0] DIG_AXI_IN_0,
    input  [1:0]  DIG_AXI_IN_1,

    ////////////////////////////////////////////////////////
    // Bank Enable, and R/W signals
    ////////////////////////////////////////////////////////

    output [3:0]  BANK_EN_C,
    output        WL_EN_C,
    output        SA_EN_C,
    output        BL_PCHG_C,
    output        CLK_SA_C,
    output        WRITE_EN_C,
    output [1:0]  CS_C,

    ////////////////////////////////////////////////////////
    // Scan Chain Signals
    ////////////////////////////////////////////////////////

    output [3:0]  SCN_SEL_C,
    output        CLK_A_C,
    output        CLK_B_C,
    output        IN_EN_C,
    output        SCN_IN_C,

    ////////////////////////////////////////////////////////
    // Compute Control Signals
    ////////////////////////////////////////////////////////

    output        InputEN_DAC_C,
    output        CALIB_EN_C,
    output        BANK_SEL_C,
    output        CHG_EN_C,
    output        RST_CAP_B_C,
    output        VDAC_CTRL_C,
    output        VTC_EN_C,
    output        TDC_EN_C,
    output        TDC_RST_C,
    output        TDC_COMPUTE_C,
    output        DFF_RST_C,
    output        CTRL_EN_C,

    ////////////////////////////////////////////////////////
    // TMUX Control Signals
    ////////////////////////////////////////////////////////

    output        CTRL_VB_C,
    output        CTRL_VBP_C,
    output        CTRL_VBN_C

);

    ////////////////////////////////////////////////////////
    // Direct Bit Mapping
    ////////////////////////////////////////////////////////

    assign BANK_EN_C[0] = DIG_AXI_IN_0[0];
    assign BANK_EN_C[1] = DIG_AXI_IN_0[1];
    assign BANK_EN_C[2] = DIG_AXI_IN_0[2];
    assign BANK_EN_C[3] = DIG_AXI_IN_0[3];

    assign WL_EN_C       = DIG_AXI_IN_0[4];
    assign SA_EN_C       = DIG_AXI_IN_0[5];
    assign BL_PCHG_C     = DIG_AXI_IN_0[6];
    assign CLK_SA_C      = DIG_AXI_IN_0[7];
    assign WRITE_EN_C    = DIG_AXI_IN_0[8];

    assign CS_C[0]       = DIG_AXI_IN_0[9];
    assign CS_C[1]       = DIG_AXI_IN_0[10];

    assign SCN_SEL_C[0]  = DIG_AXI_IN_0[11];
    assign SCN_SEL_C[1]  = DIG_AXI_IN_0[12];
    assign SCN_SEL_C[2]  = DIG_AXI_IN_0[13];
    assign SCN_SEL_C[3]  = DIG_AXI_IN_0[14];

    assign InputEN_DAC_C = DIG_AXI_IN_0[15];
    assign CALIB_EN_C    = DIG_AXI_IN_0[16];
    assign BANK_SEL_C    = DIG_AXI_IN_0[17];
    assign CHG_EN_C      = DIG_AXI_IN_0[18];
    assign RST_CAP_B_C   = DIG_AXI_IN_0[19];
    assign VDAC_CTRL_C   = DIG_AXI_IN_0[20];
    assign VTC_EN_C      = DIG_AXI_IN_0[21];
    assign TDC_EN_C      = DIG_AXI_IN_0[22];
    assign TDC_RST_C     = DIG_AXI_IN_0[23];
    assign TDC_COMPUTE_C = DIG_AXI_IN_0[24];
    assign DFF_RST_C     = DIG_AXI_IN_0[25];
    assign CTRL_EN_C     = DIG_AXI_IN_0[26];

    assign CLK_A_C       = DIG_AXI_IN_0[27];
    assign CLK_B_C       = DIG_AXI_IN_0[28];
    assign IN_EN_C       = DIG_AXI_IN_0[29];
    assign SCN_IN_C      = DIG_AXI_IN_0[30];
    assign CTRL_VB_C     = DIG_AXI_IN_0[31];

    assign CTRL_VBP_C    = DIG_AXI_IN_1[0];
    assign CTRL_VBN_C    = DIG_AXI_IN_1[1];

endmodule
