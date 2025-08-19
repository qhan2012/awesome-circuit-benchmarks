module tree_8in_and_m1(
    input [7:0] in,
    output out
);

wire [3:0] level_0;
assign level_0[0] = in[0] & in[1];
assign level_0[1] = in[2] & in[3];
assign level_0[2] = in[4] & in[5];
assign level_0[3] = in[6] & in[7];
wire [1:0] level_1;
assign level_1[0] = level_0[0] & level_0[1];
assign level_1[1] = level_0[2] & level_0[3];
wire [0:0] level_2;
assign level_2[0] = level_1[0] & level_1[1];

assign out = level_2[0];

endmodule