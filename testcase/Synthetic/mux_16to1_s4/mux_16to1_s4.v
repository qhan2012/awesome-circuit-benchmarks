module mux_16to1_s4(
    input [15:0] data_in,
    input [3:0] sel,
    output reg out
);

always @(*) begin
    case (sel)
        4'd0: out = data_in[0];
        4'd1: out = data_in[1];
        4'd2: out = data_in[2];
        4'd3: out = data_in[3];
        4'd4: out = data_in[4];
        4'd5: out = data_in[5];
        4'd6: out = data_in[6];
        4'd7: out = data_in[7];
        4'd8: out = data_in[8];
        4'd9: out = data_in[9];
        4'd10: out = data_in[10];
        4'd11: out = data_in[11];
        4'd12: out = data_in[12];
        4'd13: out = data_in[13];
        4'd14: out = data_in[14];
        4'd15: out = data_in[15];
        default: out = 1'b0;
    endcase
end

endmodule