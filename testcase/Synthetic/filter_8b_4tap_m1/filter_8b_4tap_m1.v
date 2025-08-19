module filter_8b_4tap_m1(
    input [31:0] data_in,  // 4 parallel 8-bit inputs
    output [11:0] data_out   // Filtered output
);

// Split input into parallel taps
wire [7:0] tap [3:0];
assign tap[0] = data_in[7:0];
assign tap[1] = data_in[15:8];
assign tap[2] = data_in[23:16];
assign tap[3] = data_in[31:24];

// Coefficients for FIR filter
localparam [7:0] COEFF_0 = 8'd1;
localparam [7:0] COEFF_1 = 8'd2;
localparam [7:0] COEFF_2 = 8'd3;
localparam [7:0] COEFF_3 = 8'd4;

// Multiply each tap by its coefficient
wire [11:0] products [3:0];
assign products[0] = tap[0] * COEFF_0;
assign products[1] = tap[1] * COEFF_1;
assign products[2] = tap[2] * COEFF_2;
assign products[3] = tap[3] * COEFF_3;

// Sum all products (combinational)
assign data_out = products[0] + products[1] + products[2] + products[3];

endmodule