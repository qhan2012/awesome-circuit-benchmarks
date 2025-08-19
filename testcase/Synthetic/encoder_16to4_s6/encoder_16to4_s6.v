module encoder_16to4_s6(
    input [15:0] in,
    output reg [3:0] out,
    output valid
);

assign valid = |in;

always @(*) begin
    out = 4'b0;
    casex (in)
        16'bxxxxxxxxxxxxxxx1: out = 4'd0;
        16'bxxxxxxxxxxxxxx1x: out = 4'd1;
        16'bxxxxxxxxxxxxx1xx: out = 4'd2;
        16'bxxxxxxxxxxxx1xxx: out = 4'd3;
        16'bxxxxxxxxxxx1xxxx: out = 4'd4;
        16'bxxxxxxxxxx1xxxxx: out = 4'd5;
        16'bxxxxxxxxx1xxxxxx: out = 4'd6;
        16'bxxxxxxxx1xxxxxxx: out = 4'd7;
        16'bxxxxxxx1xxxxxxxx: out = 4'd8;
        16'bxxxxxx1xxxxxxxxx: out = 4'd9;
        16'bxxxxx1xxxxxxxxxx: out = 4'd10;
        16'bxxxx1xxxxxxxxxxx: out = 4'd11;
        16'bxxx1xxxxxxxxxxxx: out = 4'd12;
        16'bxx1xxxxxxxxxxxxx: out = 4'd13;
        16'bx1xxxxxxxxxxxxxx: out = 4'd14;
        16'b1xxxxxxxxxxxxxxx: out = 4'd15;
        default: out = 4'b0;
    endcase
end

endmodule