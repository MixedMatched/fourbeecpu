// Program memory
module prog_mem (
    input clk,
    input [3:0] addr,
    input [3:0] data,
    input we,
    output [3:0] out
);

    reg [3:0] mem [0:14];
    reg [3:0] addr_reg;

    for (genvar i = 0; i < 15; i = i + 1) begin
        initial mem[i] = 4'b0000;
    end

    always @(posedge clk) begin
        if (we) begin
            $display("Program memory write to address %b: %b", addr, data);
            mem[addr] <= data;
        end
        addr_reg <= addr;
    end

    assign out = mem[addr_reg];

endmodule
