module conv_3x3_4ch_vl1(
    input [71:0] pixels_in,          // 9 input pixels (packed)
    output [63:0] result_out      // 4 output channels (packed)
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

// Output channels
wire [15:0] channel_out [3:0];

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

// Pack output channels
assign result_out[15:0] = channel_out[0];
assign result_out[31:16] = channel_out[1];
assign result_out[47:32] = channel_out[2];
assign result_out[63:48] = channel_out[3];

endmodule