module mux_8to1_s7(
    input [7:0] data_in,
    input [2:0] sel,
    output reg out
);

always @(*) begin
    case (sel)
        3'd0: out = data_in[0];
        3'd1: out = data_in[1];
        3'd2: out = data_in[2];
        3'd3: out = data_in[3];
        3'd4: out = data_in[4];
        3'd5: out = data_in[5];
        3'd6: out = data_in[6];
        3'd7: out = data_in[7];
        default: out = 1'b0;
    endcase
end

endmodule