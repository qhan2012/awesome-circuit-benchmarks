module mult_8x8_booth_l2(
    input [7:0] a,
    input [7:0] b,
    output [15:0] product
);

// Simplified Booth multiplier
reg [15:0] accumulator;
reg [7:0] multiplicand;
reg [8:0] multiplier_ext;

integer i;
always @(*) begin
    accumulator = 16'b0;
    multiplicand = a;
    multiplier_ext = {b, 1'b0};
    
    for (i = 0; i < 8; i = i + 1) begin
        case (multiplier_ext[i+1:i])
            2'b01: accumulator = accumulator + (multiplicand << i);
            2'b10: accumulator = accumulator - (multiplicand << i);
            default: ; // No operation for 00 and 11
        endcase
    end
end

assign product = accumulator;

endmodule