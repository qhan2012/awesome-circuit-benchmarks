module mac_16b_l1(
    input [127:0] a_in,     // 8 A operands (packed)
    input [127:0] b_in,     // 8 B operands (packed)
    output [23:0] result_out // MAC result
);

// Unpack inputs into individual operands
wire [15:0] a_operands [7:0];
wire [15:0] b_operands [7:0];
assign a_operands[0] = a_in[15:0];
assign b_operands[0] = b_in[15:0];
assign a_operands[1] = a_in[31:16];
assign b_operands[1] = b_in[31:16];
assign a_operands[2] = a_in[47:32];
assign b_operands[2] = b_in[47:32];
assign a_operands[3] = a_in[63:48];
assign b_operands[3] = b_in[63:48];
assign a_operands[4] = a_in[79:64];
assign b_operands[4] = b_in[79:64];
assign a_operands[5] = a_in[95:80];
assign b_operands[5] = b_in[95:80];
assign a_operands[6] = a_in[111:96];
assign b_operands[6] = b_in[111:96];
assign a_operands[7] = a_in[127:112];
assign b_operands[7] = b_in[127:112];

// Parallel multiply operations
wire [31:0] products [7:0];
assign products[0] = a_operands[0] * b_operands[0];
assign products[1] = a_operands[1] * b_operands[1];
assign products[2] = a_operands[2] * b_operands[2];
assign products[3] = a_operands[3] * b_operands[3];
assign products[4] = a_operands[4] * b_operands[4];
assign products[5] = a_operands[5] * b_operands[5];
assign products[6] = a_operands[6] * b_operands[6];
assign products[7] = a_operands[7] * b_operands[7];

// Sum all products in one combinational step
assign result_out = products[0] + products[1] + products[2] + products[3] + products[4] + products[5] + products[6] + products[7];

endmodule