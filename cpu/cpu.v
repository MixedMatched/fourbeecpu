// Central Processing Unit
module cpu (
    input wire clk,
    input wire reset,

    output mem_clk,
    output mem_we,
    output [3:0] mem_addr,
    output [3:0] mem_data,

    input wire [3:0] mem_out,

    output instr_mem_clk,
    output [3:0] instr_mem_addr,

    input wire [3:0] instr_mem_out
);

    wire alu_clk;
    wire [3:0] alu_op;
    wire [3:0] alu_reg_x;
    wire [3:0] alu_reg_y;
    
    wire [3:0] alu_out;
    wire alu_z;
    wire alu_n;

    alu alu_inst(
        .clk(alu_clk),
        .op(alu_op),
        .rx(alu_reg_x),
        .ry(alu_reg_y),
        .out(alu_out),
        .z(alu_z),
        .n(alu_n)
    );

    cu cu_inst(
        .clk(clk),
        .reset(reset),
        .alu_out(alu_out),
        .alu_z(alu_z),
        .alu_n(alu_n),
        .alu_clk(alu_clk),
        .alu_op(alu_op),
        .alu_reg_x(alu_reg_x),
        .alu_reg_y(alu_reg_y),
        .mem_clk(mem_clk),
        .mem_we(mem_we),
        .mem_addr(mem_addr),
        .mem_data(mem_data),
        .mem_out(mem_out),
        .instr_mem_clk(instr_mem_clk),
        .instr_mem_addr(instr_mem_addr),
        .instr_mem_out(instr_mem_out)
    );

endmodule