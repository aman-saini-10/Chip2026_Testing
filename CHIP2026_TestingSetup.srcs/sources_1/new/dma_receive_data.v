module dma_recv_data (
    clk,
    EN,
    s_axis_tvalid,
    s_axis_tlast,
    s_axis_tdata,
    s_axis_tready,  // Added tready signal
    buffer_flat
);
    parameter BUFF_SIZE = 32*37;
    parameter MAX_ITER_BITS = 16; 
    input wire clk;
    input wire EN;
    input wire s_axis_tvalid;
    input wire s_axis_tlast;
    input wire [31:0] s_axis_tdata;
    output wire s_axis_tready;  // Added tready signal
    output reg [BUFF_SIZE-1:0] buffer_flat;
    
    reg [MAX_ITER_BITS-1:0] write_ptr;
    reg [MAX_ITER_BITS-1:0] recv_len;
    reg rx_done;
    // Always ready to accept data while enabled and not done
    assign s_axis_tready = (EN && !rx_done);
    always @(posedge clk) begin
        if (!EN) begin
            write_ptr <= 0;
            recv_len <= 0;
            rx_done <= 0;
            //buffer_flat <= 0;
            //s_axis_tready <= 0;  // ready when reset released
        end 
        else begin
             if (s_axis_tvalid && s_axis_tready) begin
                buffer_flat[write_ptr*32 +: 32] <= s_axis_tdata;
                write_ptr <= write_ptr + 1;
                if (s_axis_tlast) begin
                    recv_len <= write_ptr + 1;
                    rx_done <= 1;
                end
            end
        end
    end
endmodule
