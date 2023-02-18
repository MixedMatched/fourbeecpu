// Program memory
module prog_mem (
    input wire clk,
    input wire [3:0] addr,
    input wire [3:0] data,
    input wire we,
    output [3:0] out
);

    reg [3:0] mem [0:15];
    reg [3:0] addr_reg;

    for (genvar i = 0; i < 16; i = i + 1) begin
        initial mem[i] = 4'b0000;
    end

    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= data;
        end
        addr_reg <= addr;
    end

    assign out = mem[addr_reg];

endmodule