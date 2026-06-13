module dma_send_data (
    clk,
    EN,
    send_len,
    buffer_flat,
    m_axis_tvalid,
    m_axis_tlast,
    m_axis_tdata,
    m_axis_tready
);

    parameter BUFF_SIZE = 32*37;
    parameter MAX_ITER_BITS = 16; 
    
    input  wire        clk;
    input  wire        EN;
    input  wire [MAX_ITER_BITS -1:0]  send_len;
    input  wire [BUFF_SIZE-1:0] buffer_flat;
    output reg         m_axis_tvalid;
    output reg         m_axis_tlast;
    output reg [31:0]  m_axis_tdata;
    input  wire        m_axis_tready;

    reg [MAX_ITER_BITS -1:0] read_ptr;
    reg sending;
    reg tx_done;
    always @(posedge clk) begin
        if (!EN) begin
            // Reset everything when EN is low
            read_ptr       <= 0;
            m_axis_tvalid  <= 0;
            m_axis_tlast   <= 0;
            m_axis_tdata   <= 0;
            tx_done        <= 0;
            sending        <= 0;
        end else begin
            if (!sending && !tx_done && send_len != 0) begin
                // Start transmission
                sending       <= 1;
                read_ptr      <= 0;
                m_axis_tvalid <= 1;
                m_axis_tdata  <= buffer_flat[0 +: 32];
                m_axis_tlast  <= (send_len == 1);
            end else if (sending) begin
                if (m_axis_tvalid && m_axis_tready) begin
                    read_ptr <= read_ptr + 1;

                    if (read_ptr == send_len - 1) begin
                        // Finished sending
                        m_axis_tvalid <= 0;
                        m_axis_tlast  <= 0;
                        sending       <= 0;
                        tx_done       <= 1;
                    end else begin
                        m_axis_tdata <= buffer_flat[(read_ptr + 1)*32 +: 32];
                        m_axis_tlast <= (read_ptr + 1 == send_len - 1);
                    end
                end
            end
        end
    end

endmodule
