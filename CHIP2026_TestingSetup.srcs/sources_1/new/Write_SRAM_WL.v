module Write_SRAM_WL(
    input  wire        CLK,               // Global Clock 
    input  wire        EN,                // start trigger
    output reg         done,              // FSM complete
    
    // Write PADS required
    output reg         WRITE_EN,
    output reg         WL_EN
);

    
    parameter N_CYCLES        = 8'd1;
    // FSM states
    parameter IDLE            = 3'd0;
    parameter WRITE_EN_ON     = 3'd1;
    parameter WL_EN_ON        = 3'd2;
    parameter WL_EN_OFF       = 3'd3;
    parameter WRITE_EN_OFF    = 3'd4;
    parameter FINISH          = 3'd5;

    reg [2:0] state;
    reg [7:0] delay_cnt;

    // FSM sequential logic
    always @(posedge CLK) begin
        if(!EN)begin
            // Defaults
            WRITE_EN  <= 0;
            WL_EN     <= 0;
            done      <= 0;
            delay_cnt <= 0;
            state <= IDLE;
        end
        else begin
            //Delay Handler
            delay_cnt <= delay_cnt + 1;
            case (state)
                IDLE: begin
                    state <= WRITE_EN_ON; // No waiting
                    delay_cnt <= 0;
                end

                WRITE_EN_ON: begin
                    WRITE_EN <= 1;
                    if (delay_cnt == N_CYCLES) begin
                        state     <= WL_EN_ON;
                        delay_cnt <= 0;
                    end
                end
    
                WL_EN_ON: begin
                    WRITE_EN <= 1;
                    WL_EN    <= 1;
                    if (delay_cnt == N_CYCLES) begin
                        state     <= WL_EN_OFF;
                        delay_cnt <= 0;
                    end
                end
    
                WL_EN_OFF: begin
                    WRITE_EN <= 1;
                    WL_EN    <= 0;
                    if (delay_cnt == N_CYCLES) begin
                        state     <= WRITE_EN_OFF;
                        delay_cnt <= 0;
                    end
                end
    
                WRITE_EN_OFF: begin
                    WRITE_EN <= 0;
                    WL_EN    <= 0;
                    if (delay_cnt == N_CYCLES) begin
                        state     <= FINISH;
                        delay_cnt <= 0;
                    end
                end
    
                FINISH: begin
                    done <= 1;
                    WRITE_EN  <= 0;
                    WL_EN     <= 0;
                    delay_cnt <= 0;
                end
                default: state <= IDLE;
            endcase
        end
    end
endmodule
