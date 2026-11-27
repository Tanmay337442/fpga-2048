`default_nettype none

/*  This code serves as an example that illustrates usage of the VGA output in the DE1-SoC 
 *  board. The code uses a VGA adapter to send pixel colors to the VGA display. To use the demo 
 *  first press KEY[0] to reset the circuit. It will display the contents of a video memory
 *  in the VGA adapter as a background image.
*/
module loss_vga(CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B,
                VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
	
    // specify the number of bits needed for an X (column) pixel coordinate on the VGA display
    parameter nX = 9;
    // specify the number of bits needed for a Y (row) pixel coordinate on the VGA display
    parameter nY = 8;

	input wire CLOCK_50;	
	input wire [3:0] KEY;
	output wire [9:0] LEDR;
    output [7:0] VGA_R;
    output [7:0] VGA_G;
    output [7:0] VGA_B;
    output VGA_HS;
    output VGA_VS;
    output VGA_BLANK_N;
    output VGA_SYNC_N;
    output VGA_CLK;    

	// The four signals below are used in demos that actively draw pixels on top of the 
    // background MIF. In this example, only the background is drawn, so these signals are 
    // just used as placeholders in this very simple example.
	wire [8:0] color;        // used as placeholder.
    wire [nX-1:0] X;         // used as placeholder
    wire [nY-1:0] Y;         // used as placeholder
    wire write;              // used as placeholder
    
    assign color = 0;
    assign X = 0;
    assign Y = 0;
    assign write = 0;

    // instantiate the VGA adapter
    vga_adapter VGA (
        .resetn(KEY[0]),
        .clock(CLOCK_50),
        .color(color),
        .x(X),
        .y(Y),
        .write(write),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_N(VGA_BLANK_N),
        .VGA_SYNC_N(VGA_SYNC_N),
        .VGA_CLK(VGA_CLK));
		defparam VGA.BACKGROUND_IMAGE = "./MIF/loss_bmp_320_3.mif" ;
endmodule

module win_vga(CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B,
                VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
	
    // specify the number of bits needed for an X (column) pixel coordinate on the VGA display
    parameter nX = 9;
    // specify the number of bits needed for a Y (row) pixel coordinate on the VGA display
    parameter nY = 8;

	input wire CLOCK_50;	
	input wire [3:0] KEY;
	output wire [9:0] LEDR;
    output [7:0] VGA_R;
    output [7:0] VGA_G;
    output [7:0] VGA_B;
    output VGA_HS;
    output VGA_VS;
    output VGA_BLANK_N;
    output VGA_SYNC_N;
    output VGA_CLK;    

	// The four signals below are used in demos that actively draw pixels on top of the 
    // background MIF. In this example, only the background is drawn, so these signals are 
    // just used as placeholders in this very simple example.
	wire [8:0] color;        // used as placeholder.
    wire [nX-1:0] X;         // used as placeholder
    wire [nY-1:0] Y;         // used as placeholder
    wire write;              // used as placeholder
    
    assign color = 0;
    assign X = 0;
    assign Y = 0;
    assign write = 0;

    // instantiate the VGA adapter
    vga_adapter VGA (
        .resetn(KEY[0]),
        .clock(CLOCK_50),
        .color(color),
        .x(X),
        .y(Y),
        .write(write),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_N(VGA_BLANK_N),
        .VGA_SYNC_N(VGA_SYNC_N),
        .VGA_CLK(VGA_CLK));
		defparam VGA.BACKGROUND_IMAGE = "./MIF/win_bmp_320_3.mif" ;
endmodule

module init_vga(CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B,
                VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
	
    // specify the number of bits needed for an X (column) pixel coordinate on the VGA display
    parameter nX = 9;
    // specify the number of bits needed for a Y (row) pixel coordinate on the VGA display
    parameter nY = 8;

	input wire CLOCK_50;	
	input wire [3:0] KEY;
	output wire [9:0] LEDR;
    output [7:0] VGA_R;
    output [7:0] VGA_G;
    output [7:0] VGA_B;
    output VGA_HS;
    output VGA_VS;
    output VGA_BLANK_N;
    output VGA_SYNC_N;
    output VGA_CLK;    

	// The four signals below are used in demos that actively draw pixels on top of the 
    // background MIF. In this example, only the background is drawn, so these signals are 
    // just used as placeholders in this very simple example.
	wire [8:0] color;        // used as placeholder.
    wire [nX-1:0] X;         // used as placeholder
    wire [nY-1:0] Y;         // used as placeholder
    wire write;              // used as placeholder
    
    assign color = 0;
    assign X = 0;
    assign Y = 0;
    assign write = 0;

    // instantiate the VGA adapter
    vga_adapter VGA (
        .resetn(KEY[0]),
        .clock(CLOCK_50),
        .color(color),
        .x(X),
        .y(Y),
        .write(write),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_N(VGA_BLANK_N),
        .VGA_SYNC_N(VGA_SYNC_N),
        .VGA_CLK(VGA_CLK));
		defparam VGA.BACKGROUND_IMAGE = "./MIF/bmp_320_3.mif" ;
endmodule

module playing_vga(CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B,
                VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
	
    // specify the number of bits needed for an X (column) pixel coordinate on the VGA display
    parameter nX = 9;
    // specify the number of bits needed for a Y (row) pixel coordinate on the VGA display
    parameter nY = 8;

	input wire CLOCK_50;	
	input wire [3:0] KEY;
	output wire [9:0] LEDR;
    output [7:0] VGA_R;
    output [7:0] VGA_G;
    output [7:0] VGA_B;
    output VGA_HS;
    output VGA_VS;
    output VGA_BLANK_N;
    output VGA_SYNC_N;
    output VGA_CLK;    

	// The four signals below are used in demos that actively draw pixels on top of the 
    // background MIF. In this example, only the background is drawn, so these signals are 
    // just used as placeholders in this very simple example.
	wire [8:0] color;        // used as placeholder.
    wire [nX-1:0] X;         // used as placeholder
    wire [nY-1:0] Y;         // used as placeholder
    wire write;              // used as placeholder
    
    assign color = 0;
    assign X = 0;
    assign Y = 0;
    assign write = 0;

    // instantiate the VGA adapter
    vga_adapter VGA (
        .resetn(KEY[0]),
        .clock(CLOCK_50),
        .color(color),
        .x(X),
        .y(Y),
        .write(write),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_N(VGA_BLANK_N),
        .VGA_SYNC_N(VGA_SYNC_N),
        .VGA_CLK(VGA_CLK));
		defparam VGA.BACKGROUND_IMAGE = "./MIF/bmp_320_3.mif" ;
endmodule


module background_loader(screen_select, CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B,
                VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
  input [1:0] screen_select; //provided by game state fsm

  //From template for display MIF
  input wire CLOCK_50;	
	input wire [3:0] KEY;
	output wire [9:0] LEDR;
  output [7:0] VGA_R;
  output [7:0] VGA_G;
  output [7:0] VGA_B;
  output VGA_HS;
  output VGA_VS;
  output VGA_BLANK_N;
  output VGA_SYNC_N;
  output VGA_CLK;    

  //Depending on the FSM state, it will display the appropriate screen on the VGA
  always@(*) begin
    case(screen_select)
      00: begin
        init_vga(CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
      end

      01: begin
        playing_vga(CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
      end

      10: begin
        win_vga(CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
      end

      11: begin
        loss_vga(CLOCK_50, KEY, LEDR, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
      end
    endcase
  end
endmodule

