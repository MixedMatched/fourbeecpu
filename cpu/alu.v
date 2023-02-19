// Arithmetic logic unit
module alu (
    input clk,
    input [3:0] op,
    input [3:0] rx,
    input [3:0] ry,
    output reg [3:0] out,
    output z,
    output n
);

    assign z = (out == 4'b0000);
    assign n = out[3];

    always @(posedge clk) begin
        out = rx;

        case (op)
            4'b0001: out = rx + ry; // add
            4'b0010: out = rx - ry; // sub
            4'b0011: out = rx & ry; // and
            4'b0100: out = rx | ry; // or
            4'b0101: out = rx + 1; // inc
            4'b0110: out = ~rx; // not
            4'b0111: out = rx << 1; // lsl
            4'b1000: out = rx >> 1; // lsr
        endcase
    end
endmodule
