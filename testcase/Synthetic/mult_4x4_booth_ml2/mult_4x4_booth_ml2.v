module mult_4x4_booth_ml2(
    input [3:0] a,
    input [3:0] b,
    output [7:0] product
);

// Simplified Booth multiplier
reg [7:0] accumulator;
reg [3:0] multiplicand;
reg [4:0] multiplier_ext;

integer i;
always @(*) begin
    accumulator = 8'b0;
    multiplicand = a;
    multiplier_ext = {b, 1'b0};
    
    for (i = 0; i < 4; i = i + 1) begin
        case (multiplier_ext[i+1:i])
            2'b01: accumulator = accumulator + (multiplicand << i);
            2'b10: accumulator = accumulator - (multiplicand << i);
            default: ; // No operation for 00 and 11
        endcase
    end
end

assign product = accumulator;

endmodule