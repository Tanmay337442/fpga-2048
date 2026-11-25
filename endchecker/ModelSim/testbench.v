`timescale 1ns / 1ps

module testbench();
        reg [63:0] grid_in;
        wire [1:0] winloss_2bit;
        endchecker U1(grid_in, winloss_2bit);
        initial begin
                // win case - 2048 in one cell, rest empty
                grid_in = 64'hB000000000000000;
                #30;
                // loss case - checkered means no moves possible
                grid_in = 64'h1212212112122121;
                #30;
                // playing case - merges possible
                grid_in = 64'h1111111111111111;
                #30;
                // both win and loss case
                grid_in = 64'h12122121b2122121;
                #30;
        end
endmodule
