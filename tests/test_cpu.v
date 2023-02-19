module instr_mem_ex (
    input clk,
    input [3:0] addr,
    output [3:0] out
);

    reg [3:0] mem [0:15];
    reg [3:0] addr_reg;

    initial begin
        // this program simply adds 1 to the x register and stores it in memory
        $readmemh("tests/test_program.hex", mem); 
    end

    always @(posedge clk) begin
        addr_reg <= addr;
    end

    assign out = mem[addr_reg];

endmodule

module cpu_tb();

    reg clk;
    reg reset;

    wire mem_clk;
    wire mem_we;
    wire [3:0] mem_addr;
    wire [3:0] mem_data;

    wire [3:0] mem_out;

    wire instr_mem_clk;
    wire [3:0] instr_mem_addr;

    wire [3:0] instr_mem_out;

    cpu cpu_inst (
        .clk(clk),
        .reset(reset),
        .mem_clk(mem_clk),
        .mem_we(mem_we),
        .mem_addr(mem_addr),
        .mem_data(mem_data),
        .mem_out(mem_out),
        .instr_mem_clk(instr_mem_clk),
        .instr_mem_addr(instr_mem_addr),
        .instr_mem_out(instr_mem_out)
    );

    prog_mem prog_mem_inst (
        .clk(mem_clk),
        .addr(mem_addr),
        .data(mem_data),
        .we(mem_we),
        .out(mem_out)
    );

    instr_mem_ex instr_mem_inst (
        .clk(instr_mem_clk),
        .addr(instr_mem_addr),
        .out(instr_mem_out)
    );

    integer i;
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #100 $finish; // 10 * the number of instructions you want to run the program for
    end

    always #5 clk = ~clk;

endmodule