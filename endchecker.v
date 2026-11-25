module win_checker(grid, win);
    input [63:0] grid;
    output reg win;
    // check for win if its 2048 in any cell
    always @(*) begin
        if (grid[63:60] == 4'b1011 || grid[59:56] == 4'b1011 || grid[55:52] == 4'b1011 || grid[51:48] == 4'b1011
            || grid[47:44] == 4'b1011 || grid[43:40] == 4'b1011 || grid[39:36] == 4'b1011 || grid[35:32] == 4'b1011
            || grid[31:28] == 4'b1011  || grid[27:24] == 4'b1011  || grid[23:20] == 4'b1011  || grid[19:16] == 4'b1011
            || grid[15:12] == 4'b1011  || grid[11:8] == 4'b1011  || grid[7:4] == 4'b1011  || grid[3:0] == 4'b1011) begin
            win = 1;
        end
        else begin
            win = 0;
        end
    end
endmodule

// compare adjacent and match goes high if the cells have the same value
module compare_adjacent(left, right, match);
    input [3:0] left, right;
    output match;
    assign match = (left == right);
endmodule

// check entire row for matching adjacent
module compare_row(row, match);
    input [15:0] row;
    wire match0, match1, match2;
    output match;
    compare_adjacent c0(row[15:12], row[11:8], match0);
    compare_adjacent c1(row[11:8], row[7:4], match1);
    compare_adjacent c2(row[7:4], row[3:0], match2);
    assign match = match0 | match1 | match2;
endmodule

// check entire grid for matching adjacent
module compare_grid(grid_in, match);
    input [63:0] grid_in;
    wire match0, match1, match2, match3;
    output match;
    compare_row c0(grid_in[63:48], match0);
    compare_row c1(grid_in[47:32], match1);
    compare_row c2(grid_in[31:16], match2);
    compare_row c3(grid_in[15:0], match3);
    assign match = match0 | match1 | match2 | match3;
endmodule

// check for any empty cell
module empty_checker(grid, empty);
    input [63:0] grid;
    output reg empty;
    always @(*) begin
        if (grid[63:60] == 4'b0000 || grid[59:56] == 4'b0000 || grid[55:52] == 4'b0000 || grid[51:48] == 4'b0000
            || grid[47:44] == 4'b0000 || grid[43:40] == 4'b0000 || grid[39:36] == 4'b0000 || grid[35:32] == 4'b0000
            || grid[31:28] == 4'b0000  || grid[27:24] == 4'b0000  || grid[23:20] == 4'b0000  || grid[19:16] == 4'b0000
            || grid[15:12] == 4'b0000  || grid[11:8] == 4'b0000  || grid[7:4] == 4'b0000  || grid[3:0] == 4'b0000) begin
            empty = 1;
        end
        else begin
            empty = 0;
        end
    end
endmodule

// output winloss_2bit with {win, loss}
// cases:
// if win = 1 -> the game is won
// else if loss = 1 -> the game is lost
// else if both are 0 -> the game is being played
module endchecker(grid_in, winloss_2bit);
    input [63:0] grid_in;
    output [1:0] winloss_2bit;
    wire [63:0] grid_transpose;
    wire empty, match0, match1;
    // generate transposed for vertical comparison
    transpose transposition(grid_in, 1'b1, grid_transpose);
    // check for win
    win_checker wincheck(grid_in, winloss_2bit[1]);
    // compare horizontal adjacent
    compare_grid c0(grid_in, match0);
    // compare vertical adjacent
    compare_grid c1(grid_transpose, match1);
    // check if grid empty
    empty_checker emptycheck(grid_in, empty);
    assign winloss_2bit[0] = !(empty | match0 | match1);
endmodule