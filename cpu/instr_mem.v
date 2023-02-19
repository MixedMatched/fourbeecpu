// Reference instruction memory
module instr_mem (
    input wire clk,
    input wire [3:0] addr,
    output [3:0] out
);

    reg [3:0] mem [0:15];
    reg [3:0] addr_reg;

    always @(posedge clk) begin
        addr_reg <= addr;
    end

    assign out = mem[addr_reg];

endmodule