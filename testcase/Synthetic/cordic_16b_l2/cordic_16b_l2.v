module cordic_16b_l2(
    input [15:0] x_in, y_in, z_in,
    output [15:0] x_out, y_out, z_out
);

// CORDIC angle table
localparam [15:0] ANGLE_0 = 16'd32768;
localparam [15:0] ANGLE_1 = 16'd16384;
localparam [15:0] ANGLE_2 = 16'd8192;
localparam [15:0] ANGLE_3 = 16'd4096;
localparam [15:0] ANGLE_4 = 16'd2048;
localparam [15:0] ANGLE_5 = 16'd1024;
localparam [15:0] ANGLE_6 = 16'd512;
localparam [15:0] ANGLE_7 = 16'd256;
localparam [15:0] ANGLE_8 = 16'd128;
localparam [15:0] ANGLE_9 = 16'd64;
localparam [15:0] ANGLE_10 = 16'd32;
localparam [15:0] ANGLE_11 = 16'd16;


// Unrolled CORDIC iterations (combinational pipeline)
wire [15:0] x_stage [12:0];
wire [15:0] y_stage [12:0];  
wire [15:0] z_stage [12:0];

// Initial values
assign x_stage[0] = x_in;
assign y_stage[0] = y_in;
assign z_stage[0] = z_in;

// Unrolled CORDIC stages
// Stage 0
wire d_0 = z_stage[0][15]; // Sign bit
assign x_stage[1] = d_0 ? (x_stage[0] + (y_stage[0] >>> 0)) : (x_stage[0] - (y_stage[0] >>> 0));
assign y_stage[1] = d_0 ? (y_stage[0] - (x_stage[0] >>> 0)) : (y_stage[0] + (x_stage[0] >>> 0));
assign z_stage[1] = d_0 ? (z_stage[0] + ANGLE_0) : (z_stage[0] - ANGLE_0);
// Stage 1
wire d_1 = z_stage[1][15]; // Sign bit
assign x_stage[2] = d_1 ? (x_stage[1] + (y_stage[1] >>> 1)) : (x_stage[1] - (y_stage[1] >>> 1));
assign y_stage[2] = d_1 ? (y_stage[1] - (x_stage[1] >>> 1)) : (y_stage[1] + (x_stage[1] >>> 1));
assign z_stage[2] = d_1 ? (z_stage[1] + ANGLE_1) : (z_stage[1] - ANGLE_1);
// Stage 2
wire d_2 = z_stage[2][15]; // Sign bit
assign x_stage[3] = d_2 ? (x_stage[2] + (y_stage[2] >>> 2)) : (x_stage[2] - (y_stage[2] >>> 2));
assign y_stage[3] = d_2 ? (y_stage[2] - (x_stage[2] >>> 2)) : (y_stage[2] + (x_stage[2] >>> 2));
assign z_stage[3] = d_2 ? (z_stage[2] + ANGLE_2) : (z_stage[2] - ANGLE_2);
// Stage 3
wire d_3 = z_stage[3][15]; // Sign bit
assign x_stage[4] = d_3 ? (x_stage[3] + (y_stage[3] >>> 3)) : (x_stage[3] - (y_stage[3] >>> 3));
assign y_stage[4] = d_3 ? (y_stage[3] - (x_stage[3] >>> 3)) : (y_stage[3] + (x_stage[3] >>> 3));
assign z_stage[4] = d_3 ? (z_stage[3] + ANGLE_3) : (z_stage[3] - ANGLE_3);
// Stage 4
wire d_4 = z_stage[4][15]; // Sign bit
assign x_stage[5] = d_4 ? (x_stage[4] + (y_stage[4] >>> 4)) : (x_stage[4] - (y_stage[4] >>> 4));
assign y_stage[5] = d_4 ? (y_stage[4] - (x_stage[4] >>> 4)) : (y_stage[4] + (x_stage[4] >>> 4));
assign z_stage[5] = d_4 ? (z_stage[4] + ANGLE_4) : (z_stage[4] - ANGLE_4);
// Stage 5
wire d_5 = z_stage[5][15]; // Sign bit
assign x_stage[6] = d_5 ? (x_stage[5] + (y_stage[5] >>> 5)) : (x_stage[5] - (y_stage[5] >>> 5));
assign y_stage[6] = d_5 ? (y_stage[5] - (x_stage[5] >>> 5)) : (y_stage[5] + (x_stage[5] >>> 5));
assign z_stage[6] = d_5 ? (z_stage[5] + ANGLE_5) : (z_stage[5] - ANGLE_5);
// Stage 6
wire d_6 = z_stage[6][15]; // Sign bit
assign x_stage[7] = d_6 ? (x_stage[6] + (y_stage[6] >>> 6)) : (x_stage[6] - (y_stage[6] >>> 6));
assign y_stage[7] = d_6 ? (y_stage[6] - (x_stage[6] >>> 6)) : (y_stage[6] + (x_stage[6] >>> 6));
assign z_stage[7] = d_6 ? (z_stage[6] + ANGLE_6) : (z_stage[6] - ANGLE_6);
// Stage 7
wire d_7 = z_stage[7][15]; // Sign bit
assign x_stage[8] = d_7 ? (x_stage[7] + (y_stage[7] >>> 7)) : (x_stage[7] - (y_stage[7] >>> 7));
assign y_stage[8] = d_7 ? (y_stage[7] - (x_stage[7] >>> 7)) : (y_stage[7] + (x_stage[7] >>> 7));
assign z_stage[8] = d_7 ? (z_stage[7] + ANGLE_7) : (z_stage[7] - ANGLE_7);
// Stage 8
wire d_8 = z_stage[8][15]; // Sign bit
assign x_stage[9] = d_8 ? (x_stage[8] + (y_stage[8] >>> 8)) : (x_stage[8] - (y_stage[8] >>> 8));
assign y_stage[9] = d_8 ? (y_stage[8] - (x_stage[8] >>> 8)) : (y_stage[8] + (x_stage[8] >>> 8));
assign z_stage[9] = d_8 ? (z_stage[8] + ANGLE_8) : (z_stage[8] - ANGLE_8);
// Stage 9
wire d_9 = z_stage[9][15]; // Sign bit
assign x_stage[10] = d_9 ? (x_stage[9] + (y_stage[9] >>> 9)) : (x_stage[9] - (y_stage[9] >>> 9));
assign y_stage[10] = d_9 ? (y_stage[9] - (x_stage[9] >>> 9)) : (y_stage[9] + (x_stage[9] >>> 9));
assign z_stage[10] = d_9 ? (z_stage[9] + ANGLE_9) : (z_stage[9] - ANGLE_9);
// Stage 10
wire d_10 = z_stage[10][15]; // Sign bit
assign x_stage[11] = d_10 ? (x_stage[10] + (y_stage[10] >>> 10)) : (x_stage[10] - (y_stage[10] >>> 10));
assign y_stage[11] = d_10 ? (y_stage[10] - (x_stage[10] >>> 10)) : (y_stage[10] + (x_stage[10] >>> 10));
assign z_stage[11] = d_10 ? (z_stage[10] + ANGLE_10) : (z_stage[10] - ANGLE_10);
// Stage 11
wire d_11 = z_stage[11][15]; // Sign bit
assign x_stage[12] = d_11 ? (x_stage[11] + (y_stage[11] >>> 11)) : (x_stage[11] - (y_stage[11] >>> 11));
assign y_stage[12] = d_11 ? (y_stage[11] - (x_stage[11] >>> 11)) : (y_stage[11] + (x_stage[11] >>> 11));
assign z_stage[12] = d_11 ? (z_stage[11] + ANGLE_11) : (z_stage[11] - ANGLE_11);

// Final outputs
assign x_out = x_stage[12];
assign y_out = y_stage[12];
assign z_out = z_stage[12];

endmodule