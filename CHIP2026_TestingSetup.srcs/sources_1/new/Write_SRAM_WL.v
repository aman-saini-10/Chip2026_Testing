/*
 * SRAM Write Sequence Controller
 *
 * Generates the following write timing:
 *
 * WRITE_EN  ____|^^^^^^^^^^^^^^^|_____
 *
 * WL_EN     ________|^^^^^^^|_________
 *
 * Sequence:
 *   IDLE
 *     -> WRITE_EN_ON
 *     -> WL_EN_ON
 *     -> WL_EN_OFF
 *     -> WRITE_EN_OFF
 *     -> FINISH (done pulse)
 *
 * Each state is held for N_CYCLES clock cycles.
 * FSM resets whenever EN = 0.
 */

module Write_SRAM_WL (
    input  wire CLK,
    input  wire EN,

    output reg  done,
    output reg  WRITE_EN,
    output reg  WL_EN
);

    parameter N_CYCLES = 8'd1;

    localparam IDLE         = 3'd0,
               WRITE_EN_ON  = 3'd1,
               WL_EN_ON     = 3'd2,
               WL_EN_OFF    = 3'd3,
               WRITE_EN_OFF = 3'd4,
               FINISH       = 3'd5;

    reg [2:0] state;
    reg [7:0] delay_cnt;

    always @(posedge CLK) begin
        if (!EN) begin
            state      <= IDLE;
            delay_cnt  <= 0;
            WRITE_EN   <= 0;
            WL_EN      <= 0;
            done       <= 0;
        end
        else begin
            done <= 0;

            case (state)

                IDLE: begin
                    delay_cnt <= 0;
                    state <= WRITE_EN_ON;
                end

                WRITE_EN_ON: begin
                    WRITE_EN <= 1;
                    WL_EN    <= 0;

                    if (delay_cnt == N_CYCLES-1) begin
                        delay_cnt <= 0;
                        state <= WL_EN_ON;
                    end else
                        delay_cnt <= delay_cnt + 1;
                end

                WL_EN_ON: begin
                    WRITE_EN <= 1;
                    WL_EN    <= 1;

                    if (delay_cnt == N_CYCLES-1) begin
                        delay_cnt <= 0;
                        state <= WL_EN_OFF;
                    end else
                        delay_cnt <= delay_cnt + 1;
                end

                WL_EN_OFF: begin
                    WRITE_EN <= 1;
                    WL_EN    <= 0;

                    if (delay_cnt == N_CYCLES-1) begin
                        delay_cnt <= 0;
                        state <= WRITE_EN_OFF;
                    end else
                        delay_cnt <= delay_cnt + 1;
                end

                WRITE_EN_OFF: begin
                    WRITE_EN <= 0;
                    WL_EN    <= 0;

                    if (delay_cnt == N_CYCLES-1) begin
                        delay_cnt <= 0;
                        state <= FINISH;
                    end else
                        delay_cnt <= delay_cnt + 1;
                end

                FINISH: begin
                    done  <= 1;
                    state <= IDLE;
                end

                default: state <= IDLE;

            endcase
        end
    end

endmodule