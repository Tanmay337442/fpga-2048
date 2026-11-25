`timescale 1ns / 1ps

module testbench();
        parameter CLOCK_PERIOD = 20;
        reg clk, reset;
        wire [63:0] grid_out;
        wire initialized;
	init U1 (clk, reset, grid_out, initialized);
        
        // initialize clock
        initial begin
                clk <= 1'b0;
	end

        always @(*) begin
	        #(CLOCK_PERIOD / 2);
                clk <= ~clk;
	end

        initial begin
                // pulse reset high
                reset <= 1'b1;
                #20;
                reset <= 1'b0;
                // wait 100 cycles and should be initialized by then
                @(posedge initialized);
                @(negedge clk);
                // pulse reset high
                reset <= 1'b1;
                @(negedge clk);
                reset <= 1'b0;
                // wait 100 cycles and should be initialized by then
                @(posedge initialized);
        end
endmodule
