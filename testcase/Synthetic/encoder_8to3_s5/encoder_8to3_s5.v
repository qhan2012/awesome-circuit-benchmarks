module encoder_8to3_s5(
    input [7:0] in,
    output reg [2:0] out,
    output valid
);

assign valid = |in;

always @(*) begin
    out = 3'b0;
    casex (in)
        8'bxxxxxxx1: out = 3'd0;
        8'bxxxxxx1x: out = 3'd1;
        8'bxxxxx1xx: out = 3'd2;
        8'bxxxx1xxx: out = 3'd3;
        8'bxxx1xxxx: out = 3'd4;
        8'bxx1xxxxx: out = 3'd5;
        8'bx1xxxxxx: out = 3'd6;
        8'b1xxxxxxx: out = 3'd7;
        default: out = 3'b0;
    endcase
end

endmodule