module sort_4x8b_bitonic_ml3(
    input [31:0] data_in,
    output [31:0] data_out
);

// Bitonic sorting network implementation
genvar i, j, k;
wire [7:0] level0[0:0];
assign level0[0] = data_in[7:0];
wire [7:0] level0[1:0];
assign level0[1] = data_in[15:8];
wire [7:0] level0[2:0];
assign level0[2] = data_in[23:16];
wire [7:0] level0[3:0];
assign level0[3] = data_in[31:24];


// Bitonic sorting stages
wire [7:0] level1[0:1];
assign {level1[1], level1[0]} = (level0[0] > level0[1]) ? {level0[0], level0[1]} : {level0[1], level0[0]};

wire [7:0] level1[2:3];
assign {level1[3], level1[2]} = (level0[2] > level0[3]) ? {level0[2], level0[3]} : {level0[3], level0[2]};

wire [7:0] level2[0:3];
assign {level2[3], level2[2], level2[1], level2[0]} = (level1[0] > level1[2]) ? 
    {level1[0], level1[1], level1[2], level1[3]} : {level1[2], level1[3], level1[0], level1[1]};

// Output assignment
assign data_out = {level2[3], level2[2], level2[1], level2[0]};
endmodule