module conv_3x3_8ch_vl3(
    input [71:0] pixels_in,          // 9 input pixels (packed)
    output [127:0] result_out      // 8 output channels (packed)
);

// Unpack input pixels
wire [7:0] pixel [8:0];
assign pixel[0] = pixels_in[7:0];
assign pixel[1] = pixels_in[15:8];
assign pixel[2] = pixels_in[23:16];
assign pixel[3] = pixels_in[31:24];
assign pixel[4] = pixels_in[39:32];
assign pixel[5] = pixels_in[47:40];
assign pixel[6] = pixels_in[55:48];
assign pixel[7] = pixels_in[63:56];
assign pixel[8] = pixels_in[71:64];

// Convolution weights as parameters
// Channel 0 weights
localparam [7:0] WEIGHT_0_0 = 8'd2;
localparam [7:0] WEIGHT_0_1 = 8'd3;
localparam [7:0] WEIGHT_0_2 = 8'd4;
localparam [7:0] WEIGHT_0_3 = 8'd5;
localparam [7:0] WEIGHT_0_4 = 8'd6;
localparam [7:0] WEIGHT_0_5 = 8'd7;
localparam [7:0] WEIGHT_0_6 = 8'd8;
localparam [7:0] WEIGHT_0_7 = 8'd9;
localparam [7:0] WEIGHT_0_8 = 8'd10;
// Channel 1 weights
localparam [7:0] WEIGHT_1_0 = 8'd3;
localparam [7:0] WEIGHT_1_1 = 8'd4;
localparam [7:0] WEIGHT_1_2 = 8'd5;
localparam [7:0] WEIGHT_1_3 = 8'd6;
localparam [7:0] WEIGHT_1_4 = 8'd7;
localparam [7:0] WEIGHT_1_5 = 8'd8;
localparam [7:0] WEIGHT_1_6 = 8'd9;
localparam [7:0] WEIGHT_1_7 = 8'd10;
localparam [7:0] WEIGHT_1_8 = 8'd11;
// Channel 2 weights
localparam [7:0] WEIGHT_2_0 = 8'd4;
localparam [7:0] WEIGHT_2_1 = 8'd5;
localparam [7:0] WEIGHT_2_2 = 8'd6;
localparam [7:0] WEIGHT_2_3 = 8'd7;
localparam [7:0] WEIGHT_2_4 = 8'd8;
localparam [7:0] WEIGHT_2_5 = 8'd9;
localparam [7:0] WEIGHT_2_6 = 8'd10;
localparam [7:0] WEIGHT_2_7 = 8'd11;
localparam [7:0] WEIGHT_2_8 = 8'd12;
// Channel 3 weights
localparam [7:0] WEIGHT_3_0 = 8'd5;
localparam [7:0] WEIGHT_3_1 = 8'd6;
localparam [7:0] WEIGHT_3_2 = 8'd7;
localparam [7:0] WEIGHT_3_3 = 8'd8;
localparam [7:0] WEIGHT_3_4 = 8'd9;
localparam [7:0] WEIGHT_3_5 = 8'd10;
localparam [7:0] WEIGHT_3_6 = 8'd11;
localparam [7:0] WEIGHT_3_7 = 8'd12;
localparam [7:0] WEIGHT_3_8 = 8'd13;
// Channel 4 weights
localparam [7:0] WEIGHT_4_0 = 8'd6;
localparam [7:0] WEIGHT_4_1 = 8'd7;
localparam [7:0] WEIGHT_4_2 = 8'd8;
localparam [7:0] WEIGHT_4_3 = 8'd9;
localparam [7:0] WEIGHT_4_4 = 8'd10;
localparam [7:0] WEIGHT_4_5 = 8'd11;
localparam [7:0] WEIGHT_4_6 = 8'd12;
localparam [7:0] WEIGHT_4_7 = 8'd13;
localparam [7:0] WEIGHT_4_8 = 8'd14;
// Channel 5 weights
localparam [7:0] WEIGHT_5_0 = 8'd7;
localparam [7:0] WEIGHT_5_1 = 8'd8;
localparam [7:0] WEIGHT_5_2 = 8'd9;
localparam [7:0] WEIGHT_5_3 = 8'd10;
localparam [7:0] WEIGHT_5_4 = 8'd11;
localparam [7:0] WEIGHT_5_5 = 8'd12;
localparam [7:0] WEIGHT_5_6 = 8'd13;
localparam [7:0] WEIGHT_5_7 = 8'd14;
localparam [7:0] WEIGHT_5_8 = 8'd15;
// Channel 6 weights
localparam [7:0] WEIGHT_6_0 = 8'd8;
localparam [7:0] WEIGHT_6_1 = 8'd9;
localparam [7:0] WEIGHT_6_2 = 8'd10;
localparam [7:0] WEIGHT_6_3 = 8'd11;
localparam [7:0] WEIGHT_6_4 = 8'd12;
localparam [7:0] WEIGHT_6_5 = 8'd13;
localparam [7:0] WEIGHT_6_6 = 8'd14;
localparam [7:0] WEIGHT_6_7 = 8'd15;
localparam [7:0] WEIGHT_6_8 = 8'd16;
// Channel 7 weights
localparam [7:0] WEIGHT_7_0 = 8'd9;
localparam [7:0] WEIGHT_7_1 = 8'd10;
localparam [7:0] WEIGHT_7_2 = 8'd11;
localparam [7:0] WEIGHT_7_3 = 8'd12;
localparam [7:0] WEIGHT_7_4 = 8'd13;
localparam [7:0] WEIGHT_7_5 = 8'd14;
localparam [7:0] WEIGHT_7_6 = 8'd15;
localparam [7:0] WEIGHT_7_7 = 8'd16;
localparam [7:0] WEIGHT_7_8 = 8'd1;

// Output channels
wire [15:0] channel_out [7:0];

// Parallel convolution computation for each channel
// Channel 0 computation
wire [15:0] products_0 [8:0];
assign products_0[0] = pixel[0] * WEIGHT_0_0;
assign products_0[1] = pixel[1] * WEIGHT_0_1;
assign products_0[2] = pixel[2] * WEIGHT_0_2;
assign products_0[3] = pixel[3] * WEIGHT_0_3;
assign products_0[4] = pixel[4] * WEIGHT_0_4;
assign products_0[5] = pixel[5] * WEIGHT_0_5;
assign products_0[6] = pixel[6] * WEIGHT_0_6;
assign products_0[7] = pixel[7] * WEIGHT_0_7;
assign products_0[8] = pixel[8] * WEIGHT_0_8;
assign channel_out[0] = products_0[0] + products_0[1] + products_0[2] + products_0[3] + products_0[4] + products_0[5] + products_0[6] + products_0[7] + products_0[8];
// Channel 1 computation
wire [15:0] products_1 [8:0];
assign products_1[0] = pixel[0] * WEIGHT_1_0;
assign products_1[1] = pixel[1] * WEIGHT_1_1;
assign products_1[2] = pixel[2] * WEIGHT_1_2;
assign products_1[3] = pixel[3] * WEIGHT_1_3;
assign products_1[4] = pixel[4] * WEIGHT_1_4;
assign products_1[5] = pixel[5] * WEIGHT_1_5;
assign products_1[6] = pixel[6] * WEIGHT_1_6;
assign products_1[7] = pixel[7] * WEIGHT_1_7;
assign products_1[8] = pixel[8] * WEIGHT_1_8;
assign channel_out[1] = products_1[0] + products_1[1] + products_1[2] + products_1[3] + products_1[4] + products_1[5] + products_1[6] + products_1[7] + products_1[8];
// Channel 2 computation
wire [15:0] products_2 [8:0];
assign products_2[0] = pixel[0] * WEIGHT_2_0;
assign products_2[1] = pixel[1] * WEIGHT_2_1;
assign products_2[2] = pixel[2] * WEIGHT_2_2;
assign products_2[3] = pixel[3] * WEIGHT_2_3;
assign products_2[4] = pixel[4] * WEIGHT_2_4;
assign products_2[5] = pixel[5] * WEIGHT_2_5;
assign products_2[6] = pixel[6] * WEIGHT_2_6;
assign products_2[7] = pixel[7] * WEIGHT_2_7;
assign products_2[8] = pixel[8] * WEIGHT_2_8;
assign channel_out[2] = products_2[0] + products_2[1] + products_2[2] + products_2[3] + products_2[4] + products_2[5] + products_2[6] + products_2[7] + products_2[8];
// Channel 3 computation
wire [15:0] products_3 [8:0];
assign products_3[0] = pixel[0] * WEIGHT_3_0;
assign products_3[1] = pixel[1] * WEIGHT_3_1;
assign products_3[2] = pixel[2] * WEIGHT_3_2;
assign products_3[3] = pixel[3] * WEIGHT_3_3;
assign products_3[4] = pixel[4] * WEIGHT_3_4;
assign products_3[5] = pixel[5] * WEIGHT_3_5;
assign products_3[6] = pixel[6] * WEIGHT_3_6;
assign products_3[7] = pixel[7] * WEIGHT_3_7;
assign products_3[8] = pixel[8] * WEIGHT_3_8;
assign channel_out[3] = products_3[0] + products_3[1] + products_3[2] + products_3[3] + products_3[4] + products_3[5] + products_3[6] + products_3[7] + products_3[8];
// Channel 4 computation
wire [15:0] products_4 [8:0];
assign products_4[0] = pixel[0] * WEIGHT_4_0;
assign products_4[1] = pixel[1] * WEIGHT_4_1;
assign products_4[2] = pixel[2] * WEIGHT_4_2;
assign products_4[3] = pixel[3] * WEIGHT_4_3;
assign products_4[4] = pixel[4] * WEIGHT_4_4;
assign products_4[5] = pixel[5] * WEIGHT_4_5;
assign products_4[6] = pixel[6] * WEIGHT_4_6;
assign products_4[7] = pixel[7] * WEIGHT_4_7;
assign products_4[8] = pixel[8] * WEIGHT_4_8;
assign channel_out[4] = products_4[0] + products_4[1] + products_4[2] + products_4[3] + products_4[4] + products_4[5] + products_4[6] + products_4[7] + products_4[8];
// Channel 5 computation
wire [15:0] products_5 [8:0];
assign products_5[0] = pixel[0] * WEIGHT_5_0;
assign products_5[1] = pixel[1] * WEIGHT_5_1;
assign products_5[2] = pixel[2] * WEIGHT_5_2;
assign products_5[3] = pixel[3] * WEIGHT_5_3;
assign products_5[4] = pixel[4] * WEIGHT_5_4;
assign products_5[5] = pixel[5] * WEIGHT_5_5;
assign products_5[6] = pixel[6] * WEIGHT_5_6;
assign products_5[7] = pixel[7] * WEIGHT_5_7;
assign products_5[8] = pixel[8] * WEIGHT_5_8;
assign channel_out[5] = products_5[0] + products_5[1] + products_5[2] + products_5[3] + products_5[4] + products_5[5] + products_5[6] + products_5[7] + products_5[8];
// Channel 6 computation
wire [15:0] products_6 [8:0];
assign products_6[0] = pixel[0] * WEIGHT_6_0;
assign products_6[1] = pixel[1] * WEIGHT_6_1;
assign products_6[2] = pixel[2] * WEIGHT_6_2;
assign products_6[3] = pixel[3] * WEIGHT_6_3;
assign products_6[4] = pixel[4] * WEIGHT_6_4;
assign products_6[5] = pixel[5] * WEIGHT_6_5;
assign products_6[6] = pixel[6] * WEIGHT_6_6;
assign products_6[7] = pixel[7] * WEIGHT_6_7;
assign products_6[8] = pixel[8] * WEIGHT_6_8;
assign channel_out[6] = products_6[0] + products_6[1] + products_6[2] + products_6[3] + products_6[4] + products_6[5] + products_6[6] + products_6[7] + products_6[8];
// Channel 7 computation
wire [15:0] products_7 [8:0];
assign products_7[0] = pixel[0] * WEIGHT_7_0;
assign products_7[1] = pixel[1] * WEIGHT_7_1;
assign products_7[2] = pixel[2] * WEIGHT_7_2;
assign products_7[3] = pixel[3] * WEIGHT_7_3;
assign products_7[4] = pixel[4] * WEIGHT_7_4;
assign products_7[5] = pixel[5] * WEIGHT_7_5;
assign products_7[6] = pixel[6] * WEIGHT_7_6;
assign products_7[7] = pixel[7] * WEIGHT_7_7;
assign products_7[8] = pixel[8] * WEIGHT_7_8;
assign channel_out[7] = products_7[0] + products_7[1] + products_7[2] + products_7[3] + products_7[4] + products_7[5] + products_7[6] + products_7[7] + products_7[8];

// Pack output channels
assign result_out[15:0] = channel_out[0];
assign result_out[31:16] = channel_out[1];
assign result_out[47:32] = channel_out[2];
assign result_out[63:48] = channel_out[3];
assign result_out[79:64] = channel_out[4];
assign result_out[95:80] = channel_out[5];
assign result_out[111:96] = channel_out[6];
assign result_out[127:112] = channel_out[7];

endmodule