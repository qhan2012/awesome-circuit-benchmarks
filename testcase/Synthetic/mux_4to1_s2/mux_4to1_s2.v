module mux_4to1_s2(
    input [3:0] data_in,
    input [1:0] sel,
    output reg out
);

always @(*) begin
    case (sel)
        2'd0: out = data_in[0];
        2'd1: out = data_in[1];
        2'd2: out = data_in[2];
        2'd3: out = data_in[3];
        default: out = 1'b0;
    endcase
end

endmodule