module prog_mem_tb();
    
    reg mem_clk;
    reg mem_we;
    reg [3:0] mem_addr;
    reg [3:0] mem_data;
    wire [3:0] mem_out;

    prog_mem prog_mem_inst(
        .clk(mem_clk),
        .addr(mem_addr),
        .data(mem_data),
        .we(mem_we),
        .out(mem_out)
    );

    initial begin
        $display("Program Memory Testbench");
        $display("mem_clk\tmem_we\tmem_addr mem_data mem_out");
        $display("--------------------------------------------");
        $monitor("%b\t%b\t%b\t%b\t%b", mem_clk, mem_we, mem_addr, mem_data, mem_out);
        mem_clk = 0;
        mem_we = 0;
        mem_addr = 4'b0000;
        mem_data = 4'b0000;
        #10;
        mem_clk = 1;
        #10;
        mem_clk = 0;
        #10;
        mem_we = 1;
        mem_data = 4'b0001;
        #10;
        mem_clk = 1;
        #10;
        mem_clk = 0;
        #10;
        $finish;
    end

endmodule