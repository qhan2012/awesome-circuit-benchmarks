module encoder_4to2_s1(
    input [3:0] in,
    output reg [1:0] out,
    output valid
);

assign valid = |in;

always @(*) begin
    out = 2'b0;
    casex (in)
        4'bxxx1: out = 2'd0;
        4'bxx1x: out = 2'd1;
        4'bx1xx: out = 2'd2;
        4'b1xxx: out = 2'd3;
        default: out = 2'b0;
    endcase
end

endmodule