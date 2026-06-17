`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 16:56:00
// Design Name: 
// Module Name: IMC_ScanOut
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


module IMC_ScanOut(
    input  wire             CLK,
    input  wire             EN,          // enable/start
    input  wire             SCAN_OUT,    // input from chip
    input  wire             IMC_DONE,    // IMC_DONE from chip
    output reg              SCAN_IN,
    output reg              IN_EN,
    output wire             CLK_A,
    output wire             CLK_B,
    output reg              BANK_SEL,    // 1-bit bank select
    output reg [3:0]        BANK_EN,
    output reg              DFF_RST,
    output wire [3:0]       SCAN_SEL,
    output reg              DONE,
    output wire [3599:0]    OUT
    );
    
    ////////////// CONSTANTS //////////////
    localparam N_bits    = 900;
    localparam Ncycles   = 1;
    
    reg [3:0] FSM_state; // state machine counter
    reg [900*4-1:0] out_buf;
    assign OUT = out_buf;
    
    ////////////// State Encodings //////////////
    localparam ST_IDLE          = 4'd0;
    localparam ST_SET_SCNID     = 4'd1;
    localparam ST_SET_BANK      = 4'd2;
    localparam ST_BANK_EN       = 4'd3;
    localparam ST_IMC_START     = 4'd4;
    localparam ST_IMC_WAIT      = 4'd5;
    localparam ST_IN_EN_ON      = 4'd6;
    localparam ST_CLK_A_HI      = 4'd7;
    localparam ST_CLK_A_LO      = 4'd8;
    localparam ST_IN_EN_OFF     = 4'd9;
    localparam ST_SCAN_OUT      = 4'd10;
    localparam ST_NEXT          = 4'd11;
    localparam ST_DONE          = 4'd12;
    
    
    ////////////// SCAN_OUT_MODULE //////////////
    wire submodule_scan_done, CLK_A_scnout;
    wire [32*37-1:0] scanned_bits;
    scan_out_verilog u_imc_scanout (
        .EN(FSM_state == ST_SCAN_OUT),
        .CLK(CLK),
        .N_CYCLES(Ncycles),
        .SCAN_OUT(SCAN_OUT),
        .scan_len_bits(N_bits),
        .CLK_A(CLK_A_scnout),
        .CLK_B(CLK_B),
        .SCAN_DONE(submodule_scan_done),
        .SCAN_OUT_BUFF(scanned_bits)
    );
    reg CLK_A_load;
    assign CLK_A = CLK_A_scnout | CLK_A_load;
    
    reg [7:0] delay_cnt;
    reg scan_id_cnt, bank_cnt;
    reg [3:0] scan_idx;
    ////////////// SCAN_SELECT //////////////
    
    assign SCAN_SEL = {3'b000, scan_id_cnt};
    
    
    ////////////// FSM LOGIC //////////////
    always @(posedge CLK) begin
        if(!EN) begin
            FSM_state <= ST_IDLE;
            IN_EN <= 0; CLK_A_load <= 0;
            BANK_SEL <= 0; BANK_EN <= 4'b0000; 
            DFF_RST <= 0; DONE <= 0;
            
            delay_cnt <= 0; bank_cnt <= 0;
            scan_id_cnt <= 0; scan_idx <= 0;
            
        end
        else begin
            delay_cnt = delay_cnt + 1;
            case(FSM_state)
                ST_IDLE: begin
                    FSM_state <= ST_SET_SCNID;
                end
                ST_SET_SCNID: begin
                    FSM_state <= ST_SET_BANK;
                end
                ST_SET_BANK: begin
                    BANK_SEL  <= bank_cnt;
                    delay_cnt <= 0;
                    FSM_state <= ST_BANK_EN;
                end
                ST_BANK_EN: begin
                    if(scan_id_cnt == 0 && bank_cnt == 0) begin
                        BANK_EN <= 4'b0001;
                    end
                    if(scan_id_cnt == 0 && bank_cnt == 1) begin
                        BANK_EN <= 4'b0010;
                    end
                    if(scan_id_cnt == 1 && bank_cnt == 0) begin
                        BANK_EN <= 4'b0100;
                    end
                    if(scan_id_cnt == 1 && bank_cnt == 1) begin
                        BANK_EN <= 4'b1000;
                    end
                    if(delay_cnt == Ncycles) begin
                        FSM_state <= ST_IMC_START;
                        delay_cnt <= 0;
                    end
                end
                ST_IMC_START: begin
                    DFF_RST <= 1;
                    FSM_state <= ST_IMC_WAIT;
                end
                ST_IMC_WAIT: begin
                    if(IMC_DONE)begin
                        FSM_state <= ST_IN_EN_ON;
                    end
                end
                ST_IN_EN_ON: begin
                    IN_EN <= 1;
                    SCAN_IN <= 0;
                    if (delay_cnt == Ncycles) begin
                        delay_cnt <= 0;
                        FSM_state <= ST_CLK_A_HI;
                    end
                end
                ST_CLK_A_HI: begin
                    CLK_A_load <= 1;
                    if (delay_cnt == Ncycles) begin
                        delay_cnt <= 0;
                        FSM_state <= ST_CLK_A_LO;
                    end
                end
                ST_CLK_A_LO: begin
                    CLK_A_load <= 0;
                    if (delay_cnt == Ncycles) begin
                        delay_cnt <= 0;
                        FSM_state <= ST_IN_EN_OFF;
                    end
                end
                ST_IN_EN_OFF: begin
                    IN_EN <= 0;
                    if (delay_cnt == Ncycles) begin
                        delay_cnt <= 0;
                        FSM_state <= ST_SCAN_OUT;
                    end
                end
                ST_SCAN_OUT: begin
                    if(submodule_scan_done) begin
                        out_buf[scan_idx*N_bits +: N_bits] <= scanned_bits[N_bits-1:0];
                        scan_idx <= scan_idx + 1;
                        FSM_state <= ST_NEXT;
                    end
                end
                ST_NEXT: begin
                    if(bank_cnt == 0) begin
                        bank_cnt = bank_cnt + 1;
                        FSM_state <= ST_SET_BANK;
                    end else begin
                        bank_cnt <= 0;
                        if(scan_id_cnt == 0) begin
                            scan_id_cnt <= 1;
                            FSM_state <= ST_SET_SCNID;
                        end else begin
                            FSM_state <= ST_DONE;
                        end
                    end
                end
                ST_DONE: begin
                    DONE <= 1; IN_EN <= 0;
                    CLK_A_load <= 0; BANK_SEL <= 0;
                    BANK_EN <= 4'b0000; DFF_RST <= 0;
                    delay_cnt <= 0;
                end
                default: FSM_state <= ST_IDLE;
            endcase
        end
    end
endmodule
