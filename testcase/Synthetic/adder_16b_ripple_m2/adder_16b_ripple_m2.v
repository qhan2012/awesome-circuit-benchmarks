module adder_16b_ripple_m2(
    input [15:0] a, b,
    input cin,
    output [15:0] sum,
    output cout
);

wire [16:0] carry;
assign carry[0] = cin;
assign cout = carry[16];

genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin: adder_stage
        assign {carry[i+1], sum[i]} = a[i] + b[i] + carry[i];
    end
endgenerate

endmodule