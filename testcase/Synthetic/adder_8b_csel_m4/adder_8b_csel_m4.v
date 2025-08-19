module adder_8b_csel_m4(
    input [7:0] a, b,
    input cin,
    output [7:0] sum,
    output cout
);

wire [3:0] sum_low;
wire cout_low;
wire [3:0] sum_high_0, sum_high_1;
wire cout_high_0, cout_high_1;

// Lower half
assign {cout_low, sum_low} = a[3:0] + b[3:0] + cin;

// Upper half with carry = 0
assign {cout_high_0, sum_high_0} = a[7:4] + b[7:4];

// Upper half with carry = 1  
assign {cout_high_1, sum_high_1} = a[7:4] + b[7:4] + 1'b1;

// Select based on lower carry
assign sum = {cout_low ? sum_high_1 : sum_high_0, sum_low};
assign cout = cout_low ? cout_high_1 : cout_high_0;

endmodule