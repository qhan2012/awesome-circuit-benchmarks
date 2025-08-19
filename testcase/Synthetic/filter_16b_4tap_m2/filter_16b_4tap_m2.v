module filter_16b_4tap_m2(
    input [63:0] data_in,  // 4 parallel 16-bit inputs
    output [19:0] data_out   // Filtered output
);

// Split input into parallel taps
wire [15:0] tap [3:0];
assign tap[0] = data_in[15:0];
assign tap[1] = data_in[31:16];
assign tap[2] = data_in[47:32];
assign tap[3] = data_in[63:48];

// Coefficients for FIR filter
localparam [15:0] COEFF_0 = 16'd1;
localparam [15:0] COEFF_1 = 16'd2;
localparam [15:0] COEFF_2 = 16'd3;
localparam [15:0] COEFF_3 = 16'd4;

// Multiply each tap by its coefficient
wire [19:0] products [3:0];
assign products[0] = tap[0] * COEFF_0;
assign products[1] = tap[1] * COEFF_1;
assign products[2] = tap[2] * COEFF_2;
assign products[3] = tap[3] * COEFF_3;

// Sum all products (combinational)
assign data_out = products[0] + products[1] + products[2] + products[3];

endmodule