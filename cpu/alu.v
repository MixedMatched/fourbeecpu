// Arithmetic logic unit
module alu (
    input [3:0] op,
    input [3:0] rx,
    input [3:0] ry,
    input [3:0] mem,
    output reg [3:0] out,
    output z,
    output n
);

    assign z = (out == 4'b0000);
    assign n = out[3];

    always @(*) begin
        case (op)
            4'b0000: out = 4'b0000; // nop
            4'b0001: out = rx + ry; // add
            4'b0010: out = rx - ry; // sub
            4'b0011: out = rx & ry; // and
            4'b0100: out = rx | ry; // or
            4'b0101: out = rx ^ ry; // xor
            4'b0110: out = ~rx; // not
            4'b0111: out = rx << 1; // lsl
            4'b1000: out = rx >> 1; // lsr
            4'b1001: out = rx; // jmp
            4'b1010: out = rx; // jz
            4'b1011: out = rx; // jnz
            4'b1100: out = rx; // jn
            4'b1101: out = rx; // jnn
            4'b1110: out = mem; // ld
            4'b1111: out = rx; // st
            default: out = 4'b0000;
        endcase
    end
endmodule
