// Design Program for 16X2 Synchronous RAM

module syn_ram (clk, rst, we, oe, addr, din, dout);
    input wire clk;            // system clock
    input wire rst;            // reset for output register
    input wire we;             // write enable: for 1 - write, for 0 - read
    input wire oe;             // output enable: for 1 - drive dout, for 0 - disable output
    input wire [3:0] addr;     // 4-bits address 
    input wire [1:0] din;      // 2-bits data i/p
    output wire [1:0] dout;    // 2-bits data o/p

    reg [1:0] mem [0:15];      // 16 loc, each 2 bits wide
    reg [1:0] dout_reg;        // registered read o/p

    always @(posedge clk) begin

        if (rst) begin
            dout_reg <= 2'b00;  // rst = high, clear o/p reg
        end 
        else begin
            dout_reg <= mem[addr];    // syn read
        end

        if (we) begin
            mem[addr] <= din; // syn write at clk edge if we = high
        end
    end

assign dout = oe ? dout_reg : 2'b00;  // o/p enable
    
endmodule