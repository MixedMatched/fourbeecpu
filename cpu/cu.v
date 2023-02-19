// Control unit
module cu (
    input clk,
    input reset,

    input [3:0] alu_out,
    input alu_z,
    input alu_n,

    output reg alu_clk,
    output [3:0] alu_op,
    output [3:0] alu_reg_x,
    output [3:0] alu_reg_y,

    output reg mem_clk,
    output reg mem_we,
    output [3:0] mem_addr,
    output [3:0] mem_data,

    input wire [3:0] mem_out,

    output reg instr_mem_clk,
    output [3:0] instr_mem_addr,

    input wire [3:0] instr_mem_out
);

    // program counter
    reg [3:0] pc;
    assign instr_mem_addr = pc;

    assign alu_op = instr_mem_out;

    reg [3:0] rx;
    reg [3:0] ext_rx;
    reg [3:0] ry;
    reg [3:0] ext_ry;
    reg [3:0] swp;

    assign alu_reg_x = ext_rx;
    assign alu_reg_y = ext_ry;

    assign mem_addr = ry;
    assign mem_data = rx;

    always @(posedge clk) begin
        mem_we <= 0;
        if (reset) begin
            pc <= 4'b0000;
            rx <= 4'b0000;
            ry <= 4'b0000;
            ext_rx <= 4'b0000;
            ext_ry <= 4'b0000;

            mem_clk <= 0;
            instr_mem_clk <= 0;
            mem_clk <= 1;
            instr_mem_clk <= 1;
            alu_clk <= 0;
            alu_clk <= 1;
        end else begin
            instr_mem_clk <= 0;
            instr_mem_clk <= 1;
            alu_clk <= 0;
            alu_clk <= 1;

            rx <= alu_out;

            $display("op: %b, rx: %b, ry: %b", alu_op, rx, ry);

            case (instr_mem_out)
                4'b0000: begin // swp
                    swp <= rx;
                    rx <= ry;
                    ry <= swp;
                end
                4'b1001: // jmp
                    pc <= rx;
                4'b1010: // jz
                    if (alu_z) begin
                        pc <= rx;
                    end
                4'b1011: // jnz
                    if (!alu_z) begin
                        pc <= rx;
                    end
                4'b1100: // jn
                    if (alu_n) begin
                        pc <= rx;
                    end
                4'b1101: // jnn
                    if (!alu_n) begin
                        pc <= rx;
                    end
                4'b1110: // ld
                    ry <= mem_out;
                4'b1111: // st
                    mem_we <= 1;
            endcase

            mem_clk <= 0;
            mem_clk <= 1;

            ext_rx <= rx;
            ext_ry <= ry;

            pc <= pc + 1;
        end

    end

endmodule