module alu_tb();

    reg [3:0] op;
    reg [3:0] rx;
    reg [3:0] ry;
    reg [3:0] mem;
    wire [3:0] out;
    wire z;
    wire n;

    alu alu_inst(
        .op(op),
        .rx(rx),
        .ry(ry),
        .mem(mem),
        .out(out),
        .z(z),
        .n(n)
    );

    initial begin
        $display("ALU Testbench");
        $display("op\trx\try\tmem\tout\tz\tn");
        $display("------------------------------------------------");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b", op, rx, ry, mem, out, z, n);
        op = 4'b0000;
        rx = 4'b0101;
        ry = 4'b0001;
        mem = 4'b0000;
        #10;
        op = 4'b0001;
        #10;
        op = 4'b0010;
        #10;
        op = 4'b0011;
        #10;
        op = 4'b0100;
        #10;
        op = 4'b0101;
        #10;
        op = 4'b0110;
        #10;
        op = 4'b0111;
        #10;
        op = 4'b1000;
        #10;
        op = 4'b1001;
        #10;
        op = 4'b1010;
        #10;
        op = 4'b1011;
        #10;
        op = 4'b1100;
        #10;
        op = 4'b1101;
        #10;
        op = 4'b1110;
        #10;
        op = 4'b1111;
        #10;
        $finish;
    end

endmodule