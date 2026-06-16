//------------------------------------------------------------------------------
// TOPS_BLOCK
//------------------------------------------------------------------------------
// Generates a periodic DFF_RST pulse:
//   - HIGH for N_CYCLES clock cycles
//   - LOW for 1 clock cycle
// Repeats while EN is asserted.
// If stop = 1, DFF_RST is held HIGH.
//------------------------------------------------------------------------------

module TOPS_BLOCK (
    input  wire       CLK,
    input  wire       EN,
    input  wire       stop,
    input  wire [7:0] N_CYCLES,
    output reg        DFF_RST
);

    reg [7:0] counter = 0;
    reg [1:0] state   = 0;   // 0=INIT, 1=HIGH, 2=LOW

    always @(posedge CLK) begin
        if (!EN) begin
            DFF_RST <= 0;
            counter <= 0;
            state   <= 0;
        end
        else if (stop) begin
            DFF_RST <= 1;
        end
        else begin
            case (state)
                0: begin
                    DFF_RST <= 1;
                    counter <= 1;
                    state   <= 1;
                end

                1: begin
                    if (counter < N_CYCLES) begin
                        DFF_RST <= 1;
                        counter <= counter + 1;
                    end
                    else begin
                        DFF_RST <= 0;
                        counter <= 0;
                        state   <= 2;
                    end
                end

                2: begin
                    DFF_RST <= 1;
                    counter <= 1;
                    state   <= 1;
                end
            endcase
        end
    end
endmodule