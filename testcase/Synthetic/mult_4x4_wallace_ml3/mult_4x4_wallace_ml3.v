module mult_4x4_wallace_ml3(
    input [3:0] a,
    input [3:0] b,
    output [7:0] product
);

// Wallace tree multiplier (simplified)
wire [15:0] pp;

// Generate partial products
genvar i, j;
generate
    for (i = 0; i < 4; i = i + 1) begin: pp_row
        for (j = 0; j < 4; j = j + 1) begin: pp_col
            assign pp[i*4+j] = a[j] & b[i];
        end
    end
endgenerate

// Wallace tree reduction (simplified - actual implementation would be more complex)
reg [7:0] sum;
integer k, l;
always @(*) begin
    sum = 8'b0;
    for (k = 0; k < 4; k = k + 1) begin
        for (l = 0; l < 4; l = l + 1) begin
            sum = sum + (pp[k*4+l] << (k+l));
        end
    end
end

assign product = sum;

endmodule