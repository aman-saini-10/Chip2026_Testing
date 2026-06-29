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
    // Memory mapped to stream MM2S
    input         in_tvalid,
    input         in_tlast,
    input  [31:0] in_tdata,
    output        in_tready,
    // Stream to Memory mapped S2MM
    input         out_tready,
    output        out_tvalid,
    output        out_tlast,
    output [31:0] out_tdata,

    ////////////////////////////////////////////////////////
    // Scan Data Flags
    ////////////////////////////////////////////////////////

    output [3:0] SCAN_DONE_FLAGS

);

    ////////////////////////////////////////////////////////
    // DEFINE THE MODE SETTINGS IN THE FOLLOWING BLOCK
    ////////////////////////////////////////////////////////
    wire SCAN_OUT = dig_out[0];
    wire IMC_DONE = dig_out[1];
    
    wire VERILOG_C_SCN      = scan_mode_setting_in[0];
    wire [3:0] SCN_ID       = scan_mode_setting_in[4:1];
    wire RECV_SCN_IN_DATA   = scan_mode_setting_in[5];
    wire SEND_SCN_OUT_DATA  = scan_mode_setting_in[6];
    wire SCAN_IN_EN         = scan_mode_setting_in[7];
    wire SCAN_OUT_EN        = scan_mode_setting_in[8];
    wire TEST_DMA           = scan_mode_setting_in[9];
    wire [7:0] N_CYCLES     = scan_mode_setting_in[17:10];
    wire TOPS_EN            = scan_mode_setting_in[18];
    wire TOPS_STOP          = scan_mode_setting_in[19];
    // FAST IMC SIGNALS (will be used later)
    wire WRITE_SRAM_EN      = scan_mode_setting_in[20];
    wire FAST_IMC_EN        = scan_mode_setting_in[21];
    wire SEND_IMC_DATA      = scan_mode_setting_in[22];

    ////////////////////////////////////////////////////////
    // AXI-Stream DMA Stuff (m-axis needs to be muxed b/w IMC and SCN_CHN)
    ////////////////////////////////////////////////////////
    // SCAN
    wire m_axis_tvalid_scan, m_axis_tlast_scan, m_axis_tready_scan;
    wire [31:0] m_axis_tdata_scan;
    // IMC
    wire m_axis_tvalid_imc, m_axis_tlast_imc, m_axis_tready_imc;
    wire [31:0] m_axis_tdata_imc;
    // (MASTER AXIS BUS)
    assign out_tvalid = (SEND_SCN_OUT_DATA == 1) ? m_axis_tvalid_scan : m_axis_tvalid_imc;
    assign out_tlast  = (SEND_SCN_OUT_DATA == 1) ? m_axis_tlast_scan  : m_axis_tlast_imc;
    assign out_tdata  = (SEND_SCN_OUT_DATA == 1) ? m_axis_tdata_scan  : m_axis_tdata_imc;
    assign m_axis_tready_scan = (SEND_SCN_OUT_DATA == 1) ? out_tready: 1'b0;
    assign m_axis_tready_imc  = (SEND_IMC_DATA == 1) ? out_tready: 1'b0;
    
    ////////////////////////////////////////////////////////
    // DMA Modules (1 Module for S-AXIS, 2 for M-AXIS: SCN, IMC)
    ////////////////////////////////////////////////////////
    wire [32*37-1:0] SCAN_IN_BUFF;
    wire [32*37-1:0] SCAN_OUT_BUFF;
    wire [32*37-1:0] DMA_SEND_BUFF;
    assign DMA_SEND_BUFF = (TEST_DMA) ? SCAN_IN_BUFF : SCAN_OUT_BUFF;
    wire [7:0] SCAN_LEN_WORD;  // Number of 4B words to send
    wire [10:0] SCAN_LEN_BITS; // Number of bits to send
    
    assign SCAN_LEN_WORD =(SCN_ID == 9) ? 8'd36 :
                        (SCN_ID == 8) ? 8'd36 :
                        (SCN_ID == 7) ? 8'd4  :
                        (SCN_ID == 6) ? 8'd9  :
                        (SCN_ID == 5) ? 8'd9  :
                        (SCN_ID == 4) ? 8'd37 :
                        (SCN_ID == 3) ? 8'd3  :
                        (SCN_ID == 2) ? 8'd3  :
                        (SCN_ID == 1) ? 8'd29 :
                                         8'd29;  //Default for 0
                                       
    assign SCAN_LEN_BITS =(SCN_ID == 9) ? 11'd1152 :
                        (SCN_ID == 8) ? 11'd1152 :
                        (SCN_ID == 7) ? 11'd105  :
                        (SCN_ID == 6) ? 11'd270  :
                        (SCN_ID == 5) ? 11'd270  :
                        (SCN_ID == 4) ? 11'd1164 :
                        (SCN_ID == 3) ? 11'd90   :
                        (SCN_ID == 2) ? 11'd90   :
                        (SCN_ID == 1) ? 11'd900  :
                                        11'd900;  //Default for 0


    // DMA Receive scan_in_data module definition 
    dma_recv_data u_recv (
        .clk(clk),
        .EN(RECV_SCN_IN_DATA),
        .s_axis_tvalid(in_tvalid),
        .s_axis_tlast(in_tlast),
        .s_axis_tdata(in_tdata),
        .s_axis_tready(in_tready),
        .buffer_flat(SCAN_IN_BUFF)
    );
    defparam u_recv.BUFF_SIZE = 32*37;
    defparam u_recv.MAX_ITER_BITS = 8;
    // DMA Send scanned_out_data module definition
    dma_send_data u_send_scn (
        .clk(clk),
        .EN(SEND_SCN_OUT_DATA),
        .send_len(SCAN_LEN_WORD),
        .buffer_flat(DMA_SEND_BUFF),
        .m_axis_tvalid(m_axis_tvalid_scan),
        .m_axis_tlast(m_axis_tlast_scan),
        .m_axis_tdata(m_axis_tdata_scan),
        .m_axis_tready(m_axis_tready_scan)
    );
    defparam u_send_scn.BUFF_SIZE = 32*37;
    defparam u_send_scn.MAX_ITER_BITS = 8;
    // DMA Send IMC_out_data module definition
    wire [4*900 - 1 : 0] IMC_OUT_BUFF;
    wire [7:0] IMC_OUT_LEN_WORD = 8'd113;
    dma_send_data u_send_imc (
        .clk(clk),
        .EN(SEND_IMC_DATA),
        .send_len(IMC_OUT_LEN_WORD),
        .buffer_flat(IMC_OUT_BUFF),
        .m_axis_tvalid(m_axis_tvalid_imc),
        .m_axis_tlast(m_axis_tlast_imc),
        .m_axis_tdata(m_axis_tdata_imc),
        .m_axis_tready(m_axis_tready_imc)
    );
    defparam u_send_imc.BUFF_SIZE = 900*4;
    defparam u_send_imc.MAX_ITER_BITS = 8;

    ////////////////////////////////////////////////////////
    // FAST SCAN MODULES
    ////////////////////////////////////////////////////////
    wire CLK_A_VER, CLK_A_SCNIN, CLK_A_SCNOUT;
    wire CLK_B_VER, CLK_B_SCNIN, CLK_B_SCNOUT;
    wire SCAN_IN_VER, SCAN_IN_DONE, SCAN_OUT_DONE;
    assign CLK_A_VER = (SCAN_IN_EN) ? CLK_A_SCNIN : CLK_A_SCNOUT;
    assign CLK_B_VER = (SCAN_IN_EN) ? CLK_B_SCNIN : CLK_B_SCNOUT;
    // Scan-In Module
    scan_in_verilog u_scn_in(
        .EN(SCAN_IN_EN),
        .CLK(clk),
        .N_CYCLES(N_CYCLES),
        .scan_in_buff(SCAN_IN_BUFF),
        .scan_len_bits(SCAN_LEN_BITS),
        .SCAN_IN(SCAN_IN_VER),
        .CLK_A(CLK_A_SCNIN),
        .CLK_B(CLK_B_SCNIN),
        .SCAN_DONE(SCAN_IN_DONE)
    );
    // Scan-Out Module
    scan_out_verilog u_scn_out(
        .EN(SCAN_OUT_EN),
        .CLK(clk),
        .N_CYCLES(N_CYCLES),
        .SCAN_OUT(SCAN_OUT),
        .scan_len_bits(SCAN_LEN_BITS),
        .CLK_A(CLK_A_SCNOUT), .CLK_B(CLK_B_SCNOUT),
        .SCAN_DONE(SCAN_OUT_DONE),
        .SCAN_OUT_BUFF(SCAN_OUT_BUFF)
    );
    ////////////////////////////////////////////////////////
    // TOPS BLOCK
    ////////////////////////////////////////////////////////
    wire DFF_RST_TOPS;
    TOPS_BLOCK u_tops_block(
        .CLK(clk),
        .EN(TOPS_EN),
        .stop(TOPS_STOP),
        .N_CYCLES(N_CYCLES),
        .DFF_RST(DFF_RST_TOPS)
    );
    ////////////////////////////////////////////////////////
    // WRITE_SRAM BLOCK
    ////////////////////////////////////////////////////////
    wire WRITE_SRAM_DONE, WEN_SRAM, WLEN_SRAM;
    Write_SRAM_WL u_write_sram(
        .CLK(clk),
        .EN(WRITE_SRAM_EN),
        .done(WRITE_SRAM_DONE),
        .WRITE_EN(WEN_SRAM),
        .WL_EN(WLEN_SRAM)
    );
    ////////////////////////////////////////////////////////
    // IMC OUT BLOCK (for fast IMC output reading)
    ////////////////////////////////////////////////////////
    wire SCAN_IN_IMC, IN_EN_IMC, CLK_A_IMC, CLK_B_IMC, BANK_SEL_IMC, DFF_RST_IMC, FAST_IMC_DONE;
    wire [3:0] BANK_EN_IMC, SCAN_SEL_IMC;
    IMC_ScanOut u_imc_scnout (
        .CLK(clk),
        .EN(FAST_IMC_EN),
        .SCAN_OUT(SCAN_OUT),
        .IMC_DONE(IMC_DONE),
        .SCAN_IN(SCAN_IN_IMC),
        .IN_EN(IN_EN_IMC),
        .CLK_A(CLK_A_IMC),
        .CLK_B(CLK_B_IMC),
        .BANK_SEL(BANK_SEL_IMC),
        .BANK_EN(BANK_EN_IMC),
        .DFF_RST(DFF_RST_IMC),
        .SCAN_SEL(SCAN_SEL_IMC),
        .DONE(FAST_IMC_DONE),
        .OUT(IMC_OUT_BUFF)
    );
    
    ////////////////////////////////////////////////////////
    // VERILOG CONTROLLER OUTPUT SIGNALS
    ////////////////////////////////////////////////////////
    assign SCAN_DONE_FLAGS = {FAST_IMC_DONE, WRITE_SRAM_DONE, SCAN_OUT_DONE, SCAN_IN_DONE};
    assign BANK_EN = (FAST_IMC_EN) ? BANK_EN_IMC : BANK_EN_C;
    
    // Read & Write Signals
    assign WL_EN = (WRITE_SRAM_EN) ? WLEN_SRAM : WL_EN_C;
    assign SA_EN = SA_EN_C;
    assign BL_PCHG = BL_PCHG_C;
    assign CLK_SA = CLK_SA_C;
    assign WRITE_EN = (WRITE_SRAM_EN == 1) ? WEN_SRAM : WRITE_EN_C;
    assign CS = CS_C;
    
    // Scan Chain Signals
    assign SCN_SEL = (FAST_IMC_EN == 1) ? SCAN_SEL_IMC : (VERILOG_C_SCN == 1) ? SCN_ID : SCN_SEL_C;
    assign CLK_A = (FAST_IMC_EN == 1) ? CLK_A_IMC : (VERILOG_C_SCN == 1) ? CLK_A_VER : CLK_A_C;
    assign CLK_B = (FAST_IMC_EN == 1) ? CLK_B_IMC : (VERILOG_C_SCN == 1) ? CLK_B_VER : CLK_B_C;
    assign IN_EN = (FAST_IMC_EN == 1) ? IN_EN_IMC : IN_EN_C;
    assign SCN_IN = (FAST_IMC_EN == 1) ? SCAN_IN_IMC : (VERILOG_C_SCN == 1) ? SCAN_IN_VER : SCN_IN_C;
    
    // Compute Signals
    assign InputEN_DAC = InputEN_DAC_C;
    assign CALIB_EN = CALIB_EN_C;
    assign BANK_SEL = (FAST_IMC_EN == 1) ? BANK_SEL_IMC : BANK_SEL_C;
    assign CHG_EN = CHG_EN_C;
    assign RST_CAP_B = RST_CAP_B_C;
    assign VDAC_CTRL = VDAC_CTRL_C;
    assign VTC_EN = VTC_EN_C;
    assign TDC_EN = TDC_EN_C;
    assign TDC_RST = TDC_RST_C;
    assign TDC_COMPUTE = TDC_COMPUTE_C;
    assign DFF_RST = DFF_RST_C;
    assign CTRL_EN = CTRL_EN_C;
    
    // TMUX SIGNALS
    assign CTRL_VB = CTRL_VB_C;
    assign CTRL_VBP = CTRL_VBP_C;
    assign CTRL_VBN = CTRL_VBN_C;
    
endmodule