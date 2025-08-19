module adder_16b_csel_m5(
    input [15:0] a, b,
    input cin,
    output [15:0] sum,
    output cout
);

wire [7:0] sum_low;
wire cout_low;
wire [7:0] sum_high_0, sum_high_1;
wire cout_high_0, cout_high_1;

// Lower half
assign {cout_low, sum_low} = a[7:0] + b[7:0] + cin;

// Upper half with carry = 0
assign {cout_high_0, sum_high_0} = a[15:8] + b[15:8];

// Upper half with carry = 1  
assign {cout_high_1, sum_high_1} = a[15:8] + b[15:8] + 1'b1;

// Select based on lower carry
assign sum = {cout_low ? sum_high_1 : sum_high_0, sum_low};
assign cout = cout_low ? cout_high_1 : cout_high_0;

endmodule