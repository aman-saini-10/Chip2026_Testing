module scan_out_verilog (
    input  wire        EN,
    input  wire        CLK,
    input  wire [7:0]  N_CYCLES,
    input  wire        SCAN_OUT,
    input  wire [10:0]  scan_len_bits,

    output reg         CLK_A,
    output reg         CLK_B,
    output reg         SCAN_DONE,
    output reg [32*37-1:0] SCAN_OUT_BUFF
);

    reg [10:0] i = 0;
    reg [7:0] cycle_count = 0;
    reg [1:0] phase = 0;

    always @(posedge CLK) begin
        if (!EN) begin
            i <= 0;
            cycle_count <= 0;
            phase <= 0;
            CLK_A <= 0;
            CLK_B <= 0;
            SCAN_DONE <= 0;
            //SCAN_OUT_BUFF <= 0;
        end else if (!SCAN_DONE) begin
            cycle_count <= cycle_count + 1;

            case (phase)
                0: begin // CLK_B high
                    CLK_B <= 1;
                    CLK_A <= 0;
                    if (cycle_count == N_CYCLES) begin
                        cycle_count <= 0;
                        phase <= 1;
                    end
                end

                1: begin // CLK_B low
                    CLK_B <= 0;
                    if (cycle_count == N_CYCLES) begin
                        cycle_count <= 0;
                        phase <= 2;
                    end
                end

                2: begin // CLK_A high, sample SCAN_OUT
                    CLK_A <= 1;
                    SCAN_OUT_BUFF[i] <= SCAN_OUT;  // <== direct write
                    if (cycle_count == N_CYCLES) begin
                        cycle_count <= 0;
                        phase <= 3;
                    end
                end

                3: begin // CLK_A low
                    CLK_A <= 0;
                    if (cycle_count == N_CYCLES) begin
                        cycle_count <= 0;
                        if (i >= scan_len_bits - 1) begin
                            SCAN_DONE <= 1;
                        end else begin
                            i <= i + 1;
                            phase <= 0;
                        end
                    end
                end
            endcase
        end
    end

endmodule
