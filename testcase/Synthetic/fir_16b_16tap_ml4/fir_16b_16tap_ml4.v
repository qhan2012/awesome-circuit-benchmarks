module fir_16b_16tap_ml4(
    input [255:0] data_in,  // 16 parallel 16-bit inputs
    output [23:0] data_out   // Single output
);

// Coefficients as localparams
localparam [15:0] COEFF_0 = 16'd1;
localparam [15:0] COEFF_1 = 16'd2;
localparam [15:0] COEFF_2 = 16'd3;
localparam [15:0] COEFF_3 = 16'd4;
localparam [15:0] COEFF_4 = 16'd5;
localparam [15:0] COEFF_5 = 16'd6;
localparam [15:0] COEFF_6 = 16'd7;
localparam [15:0] COEFF_7 = 16'd8;
localparam [15:0] COEFF_8 = 16'd9;
localparam [15:0] COEFF_9 = 16'd10;
localparam [15:0] COEFF_10 = 16'd11;
localparam [15:0] COEFF_11 = 16'd12;
localparam [15:0] COEFF_12 = 16'd13;
localparam [15:0] COEFF_13 = 16'd14;
localparam [15:0] COEFF_14 = 16'd15;
localparam [15:0] COEFF_15 = 16'd16;

// Input data split into 16 segments
wire [15:0] data [15:0];
assign data[0] = data_in[15:0];
assign data[1] = data_in[31:16];
assign data[2] = data_in[47:32];
assign data[3] = data_in[63:48];
assign data[4] = data_in[79:64];
assign data[5] = data_in[95:80];
assign data[6] = data_in[111:96];
assign data[7] = data_in[127:112];
assign data[8] = data_in[143:128];
assign data[9] = data_in[159:144];
assign data[10] = data_in[175:160];
assign data[11] = data_in[191:176];
assign data[12] = data_in[207:192];
assign data[13] = data_in[223:208];
assign data[14] = data_in[239:224];
assign data[15] = data_in[255:240];

// Products for each tap
wire [23:0] products [15:0];
assign products[0] = data[0] * COEFF_0;
assign products[1] = data[1] * COEFF_1;
assign products[2] = data[2] * COEFF_2;
assign products[3] = data[3] * COEFF_3;
assign products[4] = data[4] * COEFF_4;
assign products[5] = data[5] * COEFF_5;
assign products[6] = data[6] * COEFF_6;
assign products[7] = data[7] * COEFF_7;
assign products[8] = data[8] * COEFF_8;
assign products[9] = data[9] * COEFF_9;
assign products[10] = data[10] * COEFF_10;
assign products[11] = data[11] * COEFF_11;
assign products[12] = data[12] * COEFF_12;
assign products[13] = data[13] * COEFF_13;
assign products[14] = data[14] * COEFF_14;
assign products[15] = data[15] * COEFF_15;

// Sum all products
assign data_out = products[0] + products[1] + products[2] + products[3] + products[4] + products[5] + products[6] + products[7] + products[8] + products[9] + products[10] + products[11] + products[12] + products[13] + products[14] + products[15];

endmodule