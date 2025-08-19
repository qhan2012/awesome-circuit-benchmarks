module sort_8x8b_bitonic_ml8(
    input [63:0] data_in,
    output [63:0] data_out
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
wire [7:0] level0[4:0];
assign level0[4] = data_in[39:32];
wire [7:0] level0[5:0];
assign level0[5] = data_in[47:40];
wire [7:0] level0[6:0];
assign level0[6] = data_in[55:48];
wire [7:0] level0[7:0];
assign level0[7] = data_in[63:56];


// Bitonic sorting stages for 8 elements
wire [7:0] level1[0:7];
assign {level1[1], level1[0]} = (level0[0] > level0[1]) ? {level0[0], level0[1]} : {level0[1], level0[0]};
assign {level1[3], level1[2]} = (level0[2] > level0[3]) ? {level0[2], level0[3]} : {level0[3], level0[2]};
assign {level1[5], level1[4]} = (level0[4] > level0[5]) ? {level0[4], level0[5]} : {level0[5], level0[4]};
assign {level1[7], level1[6]} = (level0[6] > level0[7]) ? {level0[6], level0[7]} : {level0[7], level0[6]};

wire [7:0] level2[0:7];
assign {level2[3], level2[2], level2[1], level2[0]} = (level1[0] > level1[2]) ? 
    {level1[0], level1[1], level1[2], level1[3]} : {level1[2], level1[3], level1[0], level1[1]};
assign {level2[7], level2[6], level2[5], level2[4]} = (level1[4] > level1[6]) ? 
    {level1[4], level1[5], level1[6], level1[7]} : {level1[6], level1[7], level1[4], level1[5]};

wire [7:0] level3[0:7];
assign {level3[7], level3[6], level3[5], level3[4], level3[3], level3[2], level3[1], level3[0]} = 
    (level2[0] > level2[4]) ? 
    {level2[0], level2[1], level2[2], level2[3], level2[4], level2[5], level2[6], level2[7]} : 
    {level2[4], level2[5], level2[6], level2[7], level2[0], level2[1], level2[2], level2[3]};

// Output assignment
assign data_out = {level3[7], level3[6], level3[5], level3[4], level3[3], level3[2], level3[1], level3[0]};
endmodule