// Testbench for the 16X2 Synchronous RAM Module

`timescale 1ns/1ps 
`include "syn_ram.v"

module syn_ram_tb;

reg clk;
reg rst;
reg oe;
reg we;
reg [3:0] addr;
reg [1:0] din;
wire [1:0] dout;

// instantiate RAM module
syn_ram dut(.clk(clk), .rst(rst), .we(we), .oe(oe), .addr(addr), .din(din), .dout(dout));

// clk generation
always #5 clk = ~ clk;

initial begin

    $dumpfile("syn_ram_tb.vcd"); //create a cvd file
    $dumpvars(0, syn_ram_tb);

    clk = 0;       // Initializing 
    rst = 1;
    oe = 1;
    we = 0;
    addr = 0;
    din = 0;

    #12 rst = 0;   // Release reset

    we = 1;        // Write operation
    addr = 4'd3;
    din = 2'b10;
    #10;           // delay

    addr = 4'd7;
    din = 2'b01;
    #10;

    we = 0;          // Read operation
    addr = 4'd3;
    #10; 

    addr = 4'd7;
    #10;

    $stop;

end

endmodule
