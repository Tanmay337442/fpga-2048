`timescale 1ns / 1ps

module testbench();
        reg clk, reset;
        wire [63:0] grid_out;

	init U1 (clk, reset, grid_out);
        initial begin
                clk = 0;
                reset = 0;
                #20;
        end
endmodule
