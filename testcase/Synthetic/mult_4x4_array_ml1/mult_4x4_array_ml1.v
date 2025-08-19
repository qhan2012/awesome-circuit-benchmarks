module mult_4x4_array_ml1(
    input [3:0] a,
    input [3:0] b,
    output [7:0] product
);

// Array multiplier implementation
wire [15:0] partial_products;
wire [7:0] sum_array [4:0];

assign sum_array[0] = 8'b0;

genvar i, j;
generate
    for (i = 0; i < 4; i = i + 1) begin: row
        for (j = 0; j < 4; j = j + 1) begin: col
            assign partial_products[i*4+j] = a[j] & b[i];
        end
    end
endgenerate

// Add partial products
generate
    for (i = 0; i < 4; i = i + 1) begin: add_stage
        assign sum_array[i+1] = sum_array[i] + (partial_products[i*4+:4] << i);
    end
endgenerate

assign product = sum_array[4];

endmodule