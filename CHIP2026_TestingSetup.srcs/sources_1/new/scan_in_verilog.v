//Faster scan in using 100MHz clock. This assumes all the pre signals are set to proper state. 
module scan_in_verilog(
    input wire EN,
    input wire CLK,
    input wire [7:0] N_Cycles,              // Defines the switching resolution: Ncycles = 1 => 10ns
    input wire [32*37-1:0] scan_in_buff,
    input wire [10:0] scan_len_bits,        // This can be max 1152 bits so 11 bits are enough
    output reg SCAN_IN,
    output reg CLK_A,
    output reg CLK_B,
    output reg SCAN_DONE
);

    reg [10:0] i = 0; //This needs to be same as scan_len_bits
    reg [7:0] cycle_count = 0;
    reg [1:0] phase = 0;
    
    always @(posedge CLK) begin
        if (!EN) begin
            // Reset all outputs and internal state
            i <= 0;
            cycle_count <= 0;
            phase <= 0;
            SCAN_IN <= 0;
            CLK_A <= 0;
            CLK_B <= 0;
            SCAN_DONE <= 0;
        end else if (!SCAN_DONE) begin
            cycle_count <= cycle_count + 1;
            case (phase)
                0: begin // Set SCAN_IN and CLK_A high
                    SCAN_IN <= scan_in_buff[i];
                    CLK_A <= 1;
                    CLK_B <= 0;
                    if (cycle_count == N_Cycles) begin
                        cycle_count <= 0;
                        phase <= 1;
                    end
                end

                1: begin // CLK_A low
                    CLK_A <= 0;
                    if (cycle_count == N_Cycles) begin
                        cycle_count <= 0;
                        phase <= 2;
                    end
                end

                2: begin // CLK_B high
                    CLK_B <= 1;
                    if (cycle_count == N_Cycles) begin
                        cycle_count <= 0;
                        phase <= 3;
                    end
                end

                3: begin // CLK_B low and increment i or finish
                    CLK_B <= 0;
                    if (cycle_count == N_Cycles) begin
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
