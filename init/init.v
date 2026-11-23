// init temporarily assigns the initial grid as having 1100 in the first row and 0’s in the other 3 rows
module init(clk, reset, grid_out);
    input clk, reset;
    output [63:0] grid_out;
    assign grid_out = 64'h1100000000000000;
    // ordinarily just instantiate random module and pulse its enable high twice
endmodule