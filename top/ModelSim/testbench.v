`timescale 1ns / 1ps

module testbench();
        reg reset, clk;
        wire [15:0] generated_num;
        lfsr U1(reset, clk, generated_num);
        initial begin
                // reset lfsr by turning on reset and pulsing clock
                #20;
                reset <= 1'b1;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                clk <= 1'b0;
                #20;
                // turn off reset and repeatedly pulse clock
                reset <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                clk <= 1'b0;
                #20;
                #20;
                clk <= 1'b1;
                #20;
                clk <= 1'b0;
                #20;
                #20;
                clk <= 1'b1;
                #20;
                clk <= 1'b0;
                #20;
                #20;
                clk <= 1'b1;
                #20;
                clk <= 1'b0;
                #20;

        end
endmodule
