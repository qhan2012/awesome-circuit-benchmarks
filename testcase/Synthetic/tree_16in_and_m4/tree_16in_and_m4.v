module tree_16in_and_m4(
    input [15:0] in,
    output out
);

wire [7:0] level_0;
assign level_0[0] = in[0] & in[1];
assign level_0[1] = in[2] & in[3];
assign level_0[2] = in[4] & in[5];
assign level_0[3] = in[6] & in[7];
assign level_0[4] = in[8] & in[9];
assign level_0[5] = in[10] & in[11];
assign level_0[6] = in[12] & in[13];
assign level_0[7] = in[14] & in[15];
wire [3:0] level_1;
assign level_1[0] = level_0[0] & level_0[1];
assign level_1[1] = level_0[2] & level_0[3];
assign level_1[2] = level_0[4] & level_0[5];
assign level_1[3] = level_0[6] & level_0[7];
wire [1:0] level_2;
assign level_2[0] = level_1[0] & level_1[1];
assign level_2[1] = level_1[2] & level_1[3];
wire [0:0] level_3;
assign level_3[0] = level_2[0] & level_2[1];

assign out = level_3[0];

endmodule