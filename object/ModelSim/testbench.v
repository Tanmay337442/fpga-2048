`timescale 1ns / 1ps

module testbench ( );

	parameter CLOCK_PERIOD = 20;
    parameter RESOLUTION = "160x120"; // "640x480", "320x240", "160x120"
    parameter nX = (RESOLUTION == "640x480") ? 10 : ((RESOLUTION == "320x240") ? 9 : 8);
    parameter nY = nX - 1;

    reg CLOCK_50;	
	reg [9:0] SW;
	reg [3:0] KEY;
    wire [9:0] LEDR;
    wire [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	wire [nX-1:0] VGA_X;
	wire [nY-1:0] VGA_Y;
	wire [23:0] VGA_COLOR;
    wire ps2_clk, ps2_dat;
    reg key_action = 0;
    reg [7:0] scan_code = 0;

	initial begin
        CLOCK_50 <= 1'b0;
	end // initial
	always @ (*)
	begin : Clock_Generator
		#((CLOCK_PERIOD) / 2) CLOCK_50 <= ~CLOCK_50;
	end
	
	initial begin
        KEY[0] <= 1'b0;
        #20 KEY[0] <= 1'b1; // reset
	end // initial

	initial begin
        KEY[1] <= 1'b1; KEY[2] <= 1'b1; KEY[3] <= 1'b1;
        SW <= 10'b0;
        #20 key_action <= 1'b1; scan_code = 8'h1b;      // PS/2 keyboard s key
        #20 key_action <= 1'b0;
		#80 key_action <= 1'b1; scan_code = 8'hF0;      // PS/2 keyboard release
        #20 key_action <= 1'b0;
		#80 key_action <= 1'b1; scan_code = 8'h1b;      // PS/2 keyboard s key
		#20 key_action <= 1'b0; // complete PS2 packet sent. Will move object 1 to the right
	end // initial

	vga_demo U1 (CLOCK_50, SW, KEY, LEDR, ps2_clk, ps2_dat, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
                 VGA_X, VGA_Y, VGA_COLOR, plot);
        defparam U1.RESOLUTION = RESOLUTION;

	PS2_keyboard U2 (CLOCK_50, KEY[0], key_action, scan_code, ps2_clk, ps2_dat);
         
endmodule
