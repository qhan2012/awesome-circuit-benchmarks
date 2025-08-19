module fir_8b_8tap_ml5(
    input [63:0] data_in,  // 8 parallel 8-bit inputs
    output [15:0] data_out   // Single output
);

// Coefficients as localparams
localparam [7:0] COEFF_0 = 8'd1;
localparam [7:0] COEFF_1 = 8'd2;
localparam [7:0] COEFF_2 = 8'd3;
localparam [7:0] COEFF_3 = 8'd4;
localparam [7:0] COEFF_4 = 8'd5;
localparam [7:0] COEFF_5 = 8'd6;
localparam [7:0] COEFF_6 = 8'd7;
localparam [7:0] COEFF_7 = 8'd8;

// Input data split into 8 segments
wire [7:0] data [7:0];
assign data[0] = data_in[7:0];
assign data[1] = data_in[15:8];
assign data[2] = data_in[23:16];
assign data[3] = data_in[31:24];
assign data[4] = data_in[39:32];
assign data[5] = data_in[47:40];
assign data[6] = data_in[55:48];
assign data[7] = data_in[63:56];

// Products for each tap
wire [15:0] products [7:0];
assign products[0] = data[0] * COEFF_0;
assign products[1] = data[1] * COEFF_1;
assign products[2] = data[2] * COEFF_2;
assign products[3] = data[3] * COEFF_3;
assign products[4] = data[4] * COEFF_4;
assign products[5] = data[5] * COEFF_5;
assign products[6] = data[6] * COEFF_6;
assign products[7] = data[7] * COEFF_7;

// Sum all products
assign data_out = products[0] + products[1] + products[2] + products[3] + products[4] + products[5] + products[6] + products[7];

endmodule