module decoder_2to4_s4(
    input [1:0] in,
    input enable,
    output reg [3:0] out
);

always @(*) begin
    if (enable) begin
        out = 4'b0;
        out[in] = 1'b1;
    end else begin
        out = 4'b0;
    end
end

endmodule