module adder_32b_ripple_m3(
    input [31:0] a, b,
    input cin,
    output [31:0] sum,
    output cout
);

wire [32:0] carry;
assign carry[0] = cin;
assign cout = carry[32];

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin: adder_stage
        assign {carry[i+1], sum[i]} = a[i] + b[i] + carry[i];
    end
endgenerate

endmodule