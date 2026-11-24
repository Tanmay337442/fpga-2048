// movecontroller takes a 2 bit encoding of the move along with the grid input and applies the move to it
// applies transpose, flip, compact, and combine in order and then in reverse order to output the
// final grid after a left, right, up, or down move
module movecontroller(move_2bit, grid_in, grid_out, score_to_add);
    input [1:0] move_2bit; // left bit gives transpose, right bit gives flip
    input [63:0] grid_in;
    output [63:0] grid_out;
    // standard used for all
    wire [63:0] compacted0, combined0, compacted1;
    // enabled temp versions
    wire [63:0] temp0, temp1, temp2;
    output [31:0] score_to_add;
    
    // transpose and flip pass same grid if disabled, if enabled update grid and pass
    transpose t0(grid_in, move_2bit[1], temp0);
    flip f0(temp0, move_2bit[0], temp1);
    // since compact and combine occur for any move these do not require an enable
    compact c0(temp1, compacted0);
    combine c(compacted0, combined0, score_to_add);
    compact c1(combined0, compacted1);
    flip f1(compacted1, move_2bit[0], temp2);
    transpose t1(temp2, move_2bit[1], grid_out);
endmodule