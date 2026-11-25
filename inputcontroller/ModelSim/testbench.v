`timescale 1ns / 1ps

module testbench();
        reg clk, reset;
        reg [3:0] key;
        wire [1:0] move_2bit;
        wire enable;
        inputcontroller U1(clk, reset, key, move_2bit, enable);
        initial begin
                // reset and no keys pressed yet
                reset <= 1'b1;
                key <= 4'b1111;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                // turn off reset and repeatedly pulse clock
                reset <= 1'b0;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                // press left and hold 2 cycles to make sure it only sets enable high for one cycle
                // move_2bit should be 00
                key <= 4'b0111;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                // no key pressed to reset keypressed so enable can fire again - like letting go of all keys
                key <= 4'b1111;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                // press right, enable should go high one cycle
                // move_2bit should be 01
                key <= 4'b1011;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                // press up, right was not let go for one cycle so nothing should happen
                // move_2bit should still be 01, enable should be off
                key <= 4'b1101;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                // no key pressed to reset keypressed so enable can fire again - like letting go of all keys
                key <= 4'b1111;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                // move_2bit should be 01 since lrud is priority order
                key <= 4'b1001;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                clk <= 1'b0;
                #20;
                // let go of all keys
                key <= 4'b1111;
                clk <= 1'b0;
                #20;
                clk <= 1'b1;
                #20;
                clk <= 1'b0;
                #20;
        end
endmodule
