module sort_8x8b_bubble_ml2(
    input [63:0] data_in,
    output [63:0] data_out
);

wire [7:0] stage0_7;
wire [7:0] stage1_7;
wire [7:0] stage2_7;
wire [7:0] stage3_7;
wire [7:0] stage4_7;
wire [7:0] stage5_7;
wire [7:0] stage6_7;
wire [7:0] stage7_7;

wire [7:0] stage0_0;
wire [7:0] stage0_1;
assign {stage0_1, stage0_0} = (data_in[7:0] > data_in[15:8]) ? {data_in[7:0], data_in[15:8]} : {data_in[15:8], data_in[7:0]};

wire [7:0] stage0_1;
wire [7:0] stage0_2;
assign {stage0_2, stage0_1} = (data_in[15:8] > data_in[23:16]) ? {data_in[15:8], data_in[23:16]} : {data_in[23:16], data_in[15:8]};

wire [7:0] stage0_2;
wire [7:0] stage0_3;
assign {stage0_3, stage0_2} = (data_in[23:16] > data_in[31:24]) ? {data_in[23:16], data_in[31:24]} : {data_in[31:24], data_in[23:16]};

wire [7:0] stage0_3;
wire [7:0] stage0_4;
assign {stage0_4, stage0_3} = (data_in[31:24] > data_in[39:32]) ? {data_in[31:24], data_in[39:32]} : {data_in[39:32], data_in[31:24]};

wire [7:0] stage0_4;
wire [7:0] stage0_5;
assign {stage0_5, stage0_4} = (data_in[39:32] > data_in[47:40]) ? {data_in[39:32], data_in[47:40]} : {data_in[47:40], data_in[39:32]};

wire [7:0] stage0_5;
wire [7:0] stage0_6;
assign {stage0_6, stage0_5} = (data_in[47:40] > data_in[55:48]) ? {data_in[47:40], data_in[55:48]} : {data_in[55:48], data_in[47:40]};

wire [7:0] stage0_6;
wire [7:0] stage0_7;
assign {stage0_7, stage0_6} = (data_in[55:48] > data_in[63:56]) ? {data_in[55:48], data_in[63:56]} : {data_in[63:56], data_in[55:48]};

wire [7:0] stage1_0;
wire [7:0] stage1_1;
assign {stage1_1, stage1_0} = (stage0_0 > stage0_1) ? {stage0_0, stage0_1} : {stage0_1, stage0_0};

wire [7:0] stage1_1;
wire [7:0] stage1_2;
assign {stage1_2, stage1_1} = (stage0_1 > stage0_2) ? {stage0_1, stage0_2} : {stage0_2, stage0_1};

wire [7:0] stage1_2;
wire [7:0] stage1_3;
assign {stage1_3, stage1_2} = (stage0_2 > stage0_3) ? {stage0_2, stage0_3} : {stage0_3, stage0_2};

wire [7:0] stage1_3;
wire [7:0] stage1_4;
assign {stage1_4, stage1_3} = (stage0_3 > stage0_4) ? {stage0_3, stage0_4} : {stage0_4, stage0_3};

wire [7:0] stage1_4;
wire [7:0] stage1_5;
assign {stage1_5, stage1_4} = (stage0_4 > stage0_5) ? {stage0_4, stage0_5} : {stage0_5, stage0_4};

wire [7:0] stage1_5;
wire [7:0] stage1_6;
assign {stage1_6, stage1_5} = (stage0_5 > stage0_6) ? {stage0_5, stage0_6} : {stage0_6, stage0_5};

wire [7:0] stage1_6;
wire [7:0] stage1_7;
assign {stage1_7, stage1_6} = (stage0_6 > stage0_7) ? {stage0_6, stage0_7} : {stage0_7, stage0_6};

wire [7:0] stage2_0;
wire [7:0] stage2_1;
assign {stage2_1, stage2_0} = (stage1_0 > stage1_1) ? {stage1_0, stage1_1} : {stage1_1, stage1_0};

wire [7:0] stage2_1;
wire [7:0] stage2_2;
assign {stage2_2, stage2_1} = (stage1_1 > stage1_2) ? {stage1_1, stage1_2} : {stage1_2, stage1_1};

wire [7:0] stage2_2;
wire [7:0] stage2_3;
assign {stage2_3, stage2_2} = (stage1_2 > stage1_3) ? {stage1_2, stage1_3} : {stage1_3, stage1_2};

wire [7:0] stage2_3;
wire [7:0] stage2_4;
assign {stage2_4, stage2_3} = (stage1_3 > stage1_4) ? {stage1_3, stage1_4} : {stage1_4, stage1_3};

wire [7:0] stage2_4;
wire [7:0] stage2_5;
assign {stage2_5, stage2_4} = (stage1_4 > stage1_5) ? {stage1_4, stage1_5} : {stage1_5, stage1_4};

wire [7:0] stage2_5;
wire [7:0] stage2_6;
assign {stage2_6, stage2_5} = (stage1_5 > stage1_6) ? {stage1_5, stage1_6} : {stage1_6, stage1_5};

wire [7:0] stage2_6;
wire [7:0] stage2_7;
assign {stage2_7, stage2_6} = (stage1_6 > stage1_7) ? {stage1_6, stage1_7} : {stage1_7, stage1_6};

wire [7:0] stage3_0;
wire [7:0] stage3_1;
assign {stage3_1, stage3_0} = (stage2_0 > stage2_1) ? {stage2_0, stage2_1} : {stage2_1, stage2_0};

wire [7:0] stage3_1;
wire [7:0] stage3_2;
assign {stage3_2, stage3_1} = (stage2_1 > stage2_2) ? {stage2_1, stage2_2} : {stage2_2, stage2_1};

wire [7:0] stage3_2;
wire [7:0] stage3_3;
assign {stage3_3, stage3_2} = (stage2_2 > stage2_3) ? {stage2_2, stage2_3} : {stage2_3, stage2_2};

wire [7:0] stage3_3;
wire [7:0] stage3_4;
assign {stage3_4, stage3_3} = (stage2_3 > stage2_4) ? {stage2_3, stage2_4} : {stage2_4, stage2_3};

wire [7:0] stage3_4;
wire [7:0] stage3_5;
assign {stage3_5, stage3_4} = (stage2_4 > stage2_5) ? {stage2_4, stage2_5} : {stage2_5, stage2_4};

wire [7:0] stage3_5;
wire [7:0] stage3_6;
assign {stage3_6, stage3_5} = (stage2_5 > stage2_6) ? {stage2_5, stage2_6} : {stage2_6, stage2_5};

wire [7:0] stage3_6;
wire [7:0] stage3_7;
assign {stage3_7, stage3_6} = (stage2_6 > stage2_7) ? {stage2_6, stage2_7} : {stage2_7, stage2_6};

wire [7:0] stage4_0;
wire [7:0] stage4_1;
assign {stage4_1, stage4_0} = (stage3_0 > stage3_1) ? {stage3_0, stage3_1} : {stage3_1, stage3_0};

wire [7:0] stage4_1;
wire [7:0] stage4_2;
assign {stage4_2, stage4_1} = (stage3_1 > stage3_2) ? {stage3_1, stage3_2} : {stage3_2, stage3_1};

wire [7:0] stage4_2;
wire [7:0] stage4_3;
assign {stage4_3, stage4_2} = (stage3_2 > stage3_3) ? {stage3_2, stage3_3} : {stage3_3, stage3_2};

wire [7:0] stage4_3;
wire [7:0] stage4_4;
assign {stage4_4, stage4_3} = (stage3_3 > stage3_4) ? {stage3_3, stage3_4} : {stage3_4, stage3_3};

wire [7:0] stage4_4;
wire [7:0] stage4_5;
assign {stage4_5, stage4_4} = (stage3_4 > stage3_5) ? {stage3_4, stage3_5} : {stage3_5, stage3_4};

wire [7:0] stage4_5;
wire [7:0] stage4_6;
assign {stage4_6, stage4_5} = (stage3_5 > stage3_6) ? {stage3_5, stage3_6} : {stage3_6, stage3_5};

wire [7:0] stage4_6;
wire [7:0] stage4_7;
assign {stage4_7, stage4_6} = (stage3_6 > stage3_7) ? {stage3_6, stage3_7} : {stage3_7, stage3_6};

wire [7:0] stage5_0;
wire [7:0] stage5_1;
assign {stage5_1, stage5_0} = (stage4_0 > stage4_1) ? {stage4_0, stage4_1} : {stage4_1, stage4_0};

wire [7:0] stage5_1;
wire [7:0] stage5_2;
assign {stage5_2, stage5_1} = (stage4_1 > stage4_2) ? {stage4_1, stage4_2} : {stage4_2, stage4_1};

wire [7:0] stage5_2;
wire [7:0] stage5_3;
assign {stage5_3, stage5_2} = (stage4_2 > stage4_3) ? {stage4_2, stage4_3} : {stage4_3, stage4_2};

wire [7:0] stage5_3;
wire [7:0] stage5_4;
assign {stage5_4, stage5_3} = (stage4_3 > stage4_4) ? {stage4_3, stage4_4} : {stage4_4, stage4_3};

wire [7:0] stage5_4;
wire [7:0] stage5_5;
assign {stage5_5, stage5_4} = (stage4_4 > stage4_5) ? {stage4_4, stage4_5} : {stage4_5, stage4_4};

wire [7:0] stage5_5;
wire [7:0] stage5_6;
assign {stage5_6, stage5_5} = (stage4_5 > stage4_6) ? {stage4_5, stage4_6} : {stage4_6, stage4_5};

wire [7:0] stage5_6;
wire [7:0] stage5_7;
assign {stage5_7, stage5_6} = (stage4_6 > stage4_7) ? {stage4_6, stage4_7} : {stage4_7, stage4_6};

wire [7:0] stage6_0;
wire [7:0] stage6_1;
assign {stage6_1, stage6_0} = (stage5_0 > stage5_1) ? {stage5_0, stage5_1} : {stage5_1, stage5_0};

wire [7:0] stage6_1;
wire [7:0] stage6_2;
assign {stage6_2, stage6_1} = (stage5_1 > stage5_2) ? {stage5_1, stage5_2} : {stage5_2, stage5_1};

wire [7:0] stage6_2;
wire [7:0] stage6_3;
assign {stage6_3, stage6_2} = (stage5_2 > stage5_3) ? {stage5_2, stage5_3} : {stage5_3, stage5_2};

wire [7:0] stage6_3;
wire [7:0] stage6_4;
assign {stage6_4, stage6_3} = (stage5_3 > stage5_4) ? {stage5_3, stage5_4} : {stage5_4, stage5_3};

wire [7:0] stage6_4;
wire [7:0] stage6_5;
assign {stage6_5, stage6_4} = (stage5_4 > stage5_5) ? {stage5_4, stage5_5} : {stage5_5, stage5_4};

wire [7:0] stage6_5;
wire [7:0] stage6_6;
assign {stage6_6, stage6_5} = (stage5_5 > stage5_6) ? {stage5_5, stage5_6} : {stage5_6, stage5_5};

wire [7:0] stage6_6;
wire [7:0] stage6_7;
assign {stage6_7, stage6_6} = (stage5_6 > stage5_7) ? {stage5_6, stage5_7} : {stage5_7, stage5_6};

wire [7:0] stage7_0;
wire [7:0] stage7_1;
assign {stage7_1, stage7_0} = (stage6_0 > stage6_1) ? {stage6_0, stage6_1} : {stage6_1, stage6_0};

wire [7:0] stage7_1;
wire [7:0] stage7_2;
assign {stage7_2, stage7_1} = (stage6_1 > stage6_2) ? {stage6_1, stage6_2} : {stage6_2, stage6_1};

wire [7:0] stage7_2;
wire [7:0] stage7_3;
assign {stage7_3, stage7_2} = (stage6_2 > stage6_3) ? {stage6_2, stage6_3} : {stage6_3, stage6_2};

wire [7:0] stage7_3;
wire [7:0] stage7_4;
assign {stage7_4, stage7_3} = (stage6_3 > stage6_4) ? {stage6_3, stage6_4} : {stage6_4, stage6_3};

wire [7:0] stage7_4;
wire [7:0] stage7_5;
assign {stage7_5, stage7_4} = (stage6_4 > stage6_5) ? {stage6_4, stage6_5} : {stage6_5, stage6_4};

wire [7:0] stage7_5;
wire [7:0] stage7_6;
assign {stage7_6, stage7_5} = (stage6_5 > stage6_6) ? {stage6_5, stage6_6} : {stage6_6, stage6_5};

wire [7:0] stage7_6;
wire [7:0] stage7_7;
assign {stage7_7, stage7_6} = (stage6_6 > stage6_7) ? {stage6_6, stage6_7} : {stage6_7, stage6_6};


// Output assignment
assign data_out = {stage0_7, stage0_6, stage0_5, stage0_4, 
                   stage0_3, stage0_2, stage0_1, stage0_0};
endmodule