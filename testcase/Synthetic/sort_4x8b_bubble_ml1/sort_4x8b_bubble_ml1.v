module sort_4x8b_bubble_ml1(
    input [31:0] data_in,
    output [31:0] data_out
);

wire [7:0] stage0_3;
wire [7:0] stage1_3;
wire [7:0] stage2_3;
wire [7:0] stage3_3;

wire [7:0] stage0_0;
wire [7:0] stage0_1;
assign {stage0_1, stage0_0} = (data_in[7:0] > data_in[15:8]) ? {data_in[7:0], data_in[15:8]} : {data_in[15:8], data_in[7:0]};

wire [7:0] stage0_1;
wire [7:0] stage0_2;
assign {stage0_2, stage0_1} = (data_in[15:8] > data_in[23:16]) ? {data_in[15:8], data_in[23:16]} : {data_in[23:16], data_in[15:8]};

wire [7:0] stage0_2;
wire [7:0] stage0_3;
assign {stage0_3, stage0_2} = (data_in[23:16] > data_in[31:24]) ? {data_in[23:16], data_in[31:24]} : {data_in[31:24], data_in[23:16]};

wire [7:0] stage1_0;
wire [7:0] stage1_1;
assign {stage1_1, stage1_0} = (stage0_0 > stage0_1) ? {stage0_0, stage0_1} : {stage0_1, stage0_0};

wire [7:0] stage1_1;
wire [7:0] stage1_2;
assign {stage1_2, stage1_1} = (stage0_1 > stage0_2) ? {stage0_1, stage0_2} : {stage0_2, stage0_1};

wire [7:0] stage1_2;
wire [7:0] stage1_3;
assign {stage1_3, stage1_2} = (stage0_2 > stage0_3) ? {stage0_2, stage0_3} : {stage0_3, stage0_2};

wire [7:0] stage2_0;
wire [7:0] stage2_1;
assign {stage2_1, stage2_0} = (stage1_0 > stage1_1) ? {stage1_0, stage1_1} : {stage1_1, stage1_0};

wire [7:0] stage2_1;
wire [7:0] stage2_2;
assign {stage2_2, stage2_1} = (stage1_1 > stage1_2) ? {stage1_1, stage1_2} : {stage1_2, stage1_1};

wire [7:0] stage2_2;
wire [7:0] stage2_3;
assign {stage2_3, stage2_2} = (stage1_2 > stage1_3) ? {stage1_2, stage1_3} : {stage1_3, stage1_2};

wire [7:0] stage3_0;
wire [7:0] stage3_1;
assign {stage3_1, stage3_0} = (stage2_0 > stage2_1) ? {stage2_0, stage2_1} : {stage2_1, stage2_0};

wire [7:0] stage3_1;
wire [7:0] stage3_2;
assign {stage3_2, stage3_1} = (stage2_1 > stage2_2) ? {stage2_1, stage2_2} : {stage2_2, stage2_1};

wire [7:0] stage3_2;
wire [7:0] stage3_3;
assign {stage3_3, stage3_2} = (stage2_2 > stage2_3) ? {stage2_2, stage2_3} : {stage2_3, stage2_2};


// Output assignment
assign data_out = {stage0_3, stage0_2, stage0_1, stage0_0};
endmodule