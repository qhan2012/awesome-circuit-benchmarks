module mult_8x8_array_l5(
    input [7:0] a,
    input [7:0] b,
    output [15:0] product
);

// Array multiplier implementation
wire [63:0] partial_products;
wire [15:0] sum_array [8:0];

assign sum_array[0] = 16'b0;

genvar i, j;
generate
    for (i = 0; i < 8; i = i + 1) begin: row
        for (j = 0; j < 8; j = j + 1) begin: col
            assign partial_products[i*8+j] = a[j] & b[i];
        end
    end
endgenerate

// Add partial products
generate
    for (i = 0; i < 8; i = i + 1) begin: add_stage
        assign sum_array[i+1] = sum_array[i] + (partial_products[i*8+:8] << i);
    end
endgenerate

assign product = sum_array[8];

endmodule