`timescale 1ns / 1ps

module testbench();
        reg [63:0] grid_in;
        wire [63:0] grid_out;

	compact U1 (grid_in, grid_out);
        initial begin
                grid_in = 64'h0001000000000000;
                #20;
                grid_in = 64'h0101000000000000;
                #20;
                grid_in = 64'h1100100100000000;
                #20;
        end
endmodule
