module filter_16b_8tap_m4(
    input [127:0] data_in,  // 8 parallel 16-bit inputs
    output [19:0] data_out   // Filtered output
);

// Split input into parallel taps
wire [15:0] tap [7:0];
assign tap[0] = data_in[15:0];
assign tap[1] = data_in[31:16];
assign tap[2] = data_in[47:32];
assign tap[3] = data_in[63:48];
assign tap[4] = data_in[79:64];
assign tap[5] = data_in[95:80];
assign tap[6] = data_in[111:96];
assign tap[7] = data_in[127:112];

// Coefficients for FIR filter
localparam [15:0] COEFF_0 = 16'd1;
localparam [15:0] COEFF_1 = 16'd2;
localparam [15:0] COEFF_2 = 16'd3;
localparam [15:0] COEFF_3 = 16'd4;
localparam [15:0] COEFF_4 = 16'd5;
localparam [15:0] COEFF_5 = 16'd6;
localparam [15:0] COEFF_6 = 16'd7;
localparam [15:0] COEFF_7 = 16'd8;

// Multiply each tap by its coefficient
wire [19:0] products [7:0];
assign products[0] = tap[0] * COEFF_0;
assign products[1] = tap[1] * COEFF_1;
assign products[2] = tap[2] * COEFF_2;
assign products[3] = tap[3] * COEFF_3;
assign products[4] = tap[4] * COEFF_4;
assign products[5] = tap[5] * COEFF_5;
assign products[6] = tap[6] * COEFF_6;
assign products[7] = tap[7] * COEFF_7;

// Sum all products (combinational)
assign data_out = products[0] + products[1] + products[2] + products[3] + products[4] + products[5] + products[6] + products[7];

endmodule