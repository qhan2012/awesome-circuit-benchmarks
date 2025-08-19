module decoder_4to16_s6(
    input [3:0] in,
    input enable,
    output reg [15:0] out
);

always @(*) begin
    if (enable) begin
        out = 16'b0;
        out[in] = 1'b1;
    end else begin
        out = 16'b0;
    end
end

endmodule