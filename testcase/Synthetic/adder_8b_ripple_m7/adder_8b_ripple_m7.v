module adder_8b_ripple_m7(
    input [7:0] a, b,
    input cin,
    output [7:0] sum,
    output cout
);

wire [8:0] carry;
assign carry[0] = cin;
assign cout = carry[8];

genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin: adder_stage
        assign {carry[i+1], sum[i]} = a[i] + b[i] + carry[i];
    end
endgenerate

endmodule