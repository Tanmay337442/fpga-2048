`timescale 1ns / 1ps

module testbench();
        reg [1:0] move_2bit;
        reg [63:0] grid_in;
        wire [63:0] grid_out;

	movecontroller U1 (move_2bit, grid_in, grid_out);
        initial begin
                move_2bit = 2'b00;
                grid_in = 64'h1010010200000000;
                #20;
                move_2bit = 2'b01;
                grid_in = 64'h1010010200000000;
                #20;
                move_2bit = 2'b10;
                grid_in = 64'h1010102000000000;
                #20;
                move_2bit = 2'b11;
                grid_in = 64'h1010102000000000;
                #20;
        end
endmodule
