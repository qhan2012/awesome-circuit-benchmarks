module decoder_3to8_s2(
    input [2:0] in,
    input enable,
    output reg [7:0] out
);

always @(*) begin
    if (enable) begin
        out = 8'b0;
        out[in] = 1'b1;
    end else begin
        out = 8'b0;
    end
end

endmodule