module cordic_8b_l5(
    input [7:0] x_in, y_in, z_in,
    output [7:0] x_out, y_out, z_out
);

// CORDIC angle table
localparam [7:0] ANGLE_0 = 8'd128;
localparam [7:0] ANGLE_1 = 8'd64;
localparam [7:0] ANGLE_2 = 8'd32;
localparam [7:0] ANGLE_3 = 8'd16;
localparam [7:0] ANGLE_4 = 8'd8;
localparam [7:0] ANGLE_5 = 8'd4;
localparam [7:0] ANGLE_6 = 8'd2;
localparam [7:0] ANGLE_7 = 8'd1;


// Unrolled CORDIC iterations (combinational pipeline)
wire [7:0] x_stage [8:0];
wire [7:0] y_stage [8:0];  
wire [7:0] z_stage [8:0];

// Initial values
assign x_stage[0] = x_in;
assign y_stage[0] = y_in;
assign z_stage[0] = z_in;

// Unrolled CORDIC stages
// Stage 0
wire d_0 = z_stage[0][7]; // Sign bit
assign x_stage[1] = d_0 ? (x_stage[0] + (y_stage[0] >>> 0)) : (x_stage[0] - (y_stage[0] >>> 0));
assign y_stage[1] = d_0 ? (y_stage[0] - (x_stage[0] >>> 0)) : (y_stage[0] + (x_stage[0] >>> 0));
assign z_stage[1] = d_0 ? (z_stage[0] + ANGLE_0) : (z_stage[0] - ANGLE_0);
// Stage 1
wire d_1 = z_stage[1][7]; // Sign bit
assign x_stage[2] = d_1 ? (x_stage[1] + (y_stage[1] >>> 1)) : (x_stage[1] - (y_stage[1] >>> 1));
assign y_stage[2] = d_1 ? (y_stage[1] - (x_stage[1] >>> 1)) : (y_stage[1] + (x_stage[1] >>> 1));
assign z_stage[2] = d_1 ? (z_stage[1] + ANGLE_1) : (z_stage[1] - ANGLE_1);
// Stage 2
wire d_2 = z_stage[2][7]; // Sign bit
assign x_stage[3] = d_2 ? (x_stage[2] + (y_stage[2] >>> 2)) : (x_stage[2] - (y_stage[2] >>> 2));
assign y_stage[3] = d_2 ? (y_stage[2] - (x_stage[2] >>> 2)) : (y_stage[2] + (x_stage[2] >>> 2));
assign z_stage[3] = d_2 ? (z_stage[2] + ANGLE_2) : (z_stage[2] - ANGLE_2);
// Stage 3
wire d_3 = z_stage[3][7]; // Sign bit
assign x_stage[4] = d_3 ? (x_stage[3] + (y_stage[3] >>> 3)) : (x_stage[3] - (y_stage[3] >>> 3));
assign y_stage[4] = d_3 ? (y_stage[3] - (x_stage[3] >>> 3)) : (y_stage[3] + (x_stage[3] >>> 3));
assign z_stage[4] = d_3 ? (z_stage[3] + ANGLE_3) : (z_stage[3] - ANGLE_3);
// Stage 4
wire d_4 = z_stage[4][7]; // Sign bit
assign x_stage[5] = d_4 ? (x_stage[4] + (y_stage[4] >>> 4)) : (x_stage[4] - (y_stage[4] >>> 4));
assign y_stage[5] = d_4 ? (y_stage[4] - (x_stage[4] >>> 4)) : (y_stage[4] + (x_stage[4] >>> 4));
assign z_stage[5] = d_4 ? (z_stage[4] + ANGLE_4) : (z_stage[4] - ANGLE_4);
// Stage 5
wire d_5 = z_stage[5][7]; // Sign bit
assign x_stage[6] = d_5 ? (x_stage[5] + (y_stage[5] >>> 5)) : (x_stage[5] - (y_stage[5] >>> 5));
assign y_stage[6] = d_5 ? (y_stage[5] - (x_stage[5] >>> 5)) : (y_stage[5] + (x_stage[5] >>> 5));
assign z_stage[6] = d_5 ? (z_stage[5] + ANGLE_5) : (z_stage[5] - ANGLE_5);
// Stage 6
wire d_6 = z_stage[6][7]; // Sign bit
assign x_stage[7] = d_6 ? (x_stage[6] + (y_stage[6] >>> 6)) : (x_stage[6] - (y_stage[6] >>> 6));
assign y_stage[7] = d_6 ? (y_stage[6] - (x_stage[6] >>> 6)) : (y_stage[6] + (x_stage[6] >>> 6));
assign z_stage[7] = d_6 ? (z_stage[6] + ANGLE_6) : (z_stage[6] - ANGLE_6);
// Stage 7
wire d_7 = z_stage[7][7]; // Sign bit
assign x_stage[8] = d_7 ? (x_stage[7] + (y_stage[7] >>> 7)) : (x_stage[7] - (y_stage[7] >>> 7));
assign y_stage[8] = d_7 ? (y_stage[7] - (x_stage[7] >>> 7)) : (y_stage[7] + (x_stage[7] >>> 7));
assign z_stage[8] = d_7 ? (z_stage[7] + ANGLE_7) : (z_stage[7] - ANGLE_7);

// Final outputs
assign x_out = x_stage[8];
assign y_out = y_stage[8];
assign z_out = z_stage[8];

endmodule