module mac_8b_l4(
    input [31:0] a_in,     // 4 A operands (packed)
    input [31:0] b_in,     // 4 B operands (packed)
    output [15:0] result_out // MAC result
);

// Unpack inputs into individual operands
wire [7:0] a_operands [3:0];
wire [7:0] b_operands [3:0];
assign a_operands[0] = a_in[7:0];
assign b_operands[0] = b_in[7:0];
assign a_operands[1] = a_in[15:8];
assign b_operands[1] = b_in[15:8];
assign a_operands[2] = a_in[23:16];
assign b_operands[2] = b_in[23:16];
assign a_operands[3] = a_in[31:24];
assign b_operands[3] = b_in[31:24];

// Parallel multiply operations
wire [15:0] products [3:0];
assign products[0] = a_operands[0] * b_operands[0];
assign products[1] = a_operands[1] * b_operands[1];
assign products[2] = a_operands[2] * b_operands[2];
assign products[3] = a_operands[3] * b_operands[3];

// Sum all products in one combinational step
assign result_out = products[0] + products[1] + products[2] + products[3];

endmodule