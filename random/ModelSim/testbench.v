`timescale 1ns / 1ps

module testbench();
        parameter CLOCK_PERIOD = 20;
        reg clk, reset, enable;
        reg [63:0] grid_in;
        wire [63:0] grid_out;
        wire complete;
	random U1 (clk, reset, enable, grid_in, grid_out, complete);
        
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
                enable <= 1'b0;
                grid_in <= 64'h1010010110100101; // checker pattern of empty spaces and 2's
                @(negedge clk);
                reset <= 1'b0;
                enable <= 1'b1;
                @(posedge complete);
                @(negedge clk);
                enable <= 1'b0;
                @(negedge clk);
                enable <= 1'b1;
                @(posedge complete);
                @(negedge clk);
                enable <= 1'b0;
        end
endmodule
