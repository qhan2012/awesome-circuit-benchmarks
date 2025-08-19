module mux_2to1_s5(
    input [1:0] data_in,
    input [0:0] sel,
    output reg out
);

always @(*) begin
    case (sel)
        1'd0: out = data_in[0];
        1'd1: out = data_in[1];
        default: out = 1'b0;
    endcase
end

endmodule