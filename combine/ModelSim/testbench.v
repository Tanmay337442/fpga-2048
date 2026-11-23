`timescale 1ns / 1ps

module testbench();
        reg [63:0] grid_in;
        wire [63:0] grid_out;

	combine U1 (grid_in, grid_out);
        initial begin
                grid_in = 64'h1100000000000000;
                #20;
                grid_in = 64'h1111000000000000;
                #20;
                grid_in = 64'h1200000000000000;
                #20;
                grid_in = 64'h1122112200000000;
                #20;
        end
endmodule
