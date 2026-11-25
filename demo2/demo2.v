// temporary - delete later
//Select if Transpose or not
module mux2to1 (x,y,s,f);
  input [3:0] x, y;
  input s;
  output reg [3:0] f;

  always@(*)begin
    //Stay same, transpose = 0
    if(s == 1'b0) begin
      f = x;
    end

    //Transpose, transpose = 1
    else if (s == 1'b1) begin
      f = y;
    end
  end
endmodule

module transpose_grid(in, transpose, out);
  input [63:0] in;
  input transpose;
  output [63:0] out;

  //transpose: the enable for transpose
  //if transpose = 0 --> keep same, if transpose = 1 --> transpose

  wire [3:0] R00, R01, R02, R03, R10, R11, R12, R13, R20, R21, R22, R23, R30, R31, R32, R33;
  wire [3:0] Q00, Q01, Q02, Q03, Q10, Q11, Q12, Q13, Q20, Q21, Q22, Q23, Q30, Q31, Q32, Q33;

  //Transpose:
  //2 4 2 4 2 8 --> 2 2 4 4 8 2

  //Row 0
  assign Q00 = in[63:60];
  assign Q01 = in[59:56];
  assign Q02 = in[55:52];
  assign Q03 = in[51:48];

  //Row 1
  assign Q10 = in[47:44];
  assign Q11 = in[43:40];
  assign Q12 = in[39:36];
  assign Q13 = in[35:32];

  //Row 2
  assign Q20 = in[31:28];
  assign Q21 = in[27:24];
  assign Q22 = in[23:20];
  assign Q23 = in[19:16];

  //Row 3
  assign Q30 = in[15:12];
  assign Q31 = in[11:8];
  assign Q32 = in[7:4];
  assign Q33 = in[3:0];

  //Muxes to decide what goes into each box:
  mux2to1 mux0(Q00, Q00, transpose, R00);
  mux2to1 mux1(Q01, Q10, transpose, R01);
  mux2to1 mux2(Q02, Q20, transpose, R02);
  mux2to1 mux3(Q03, Q30, transpose, R03);
  mux2to1 mux4(Q10, Q01, transpose, R10);
  mux2to1 mux5(Q11, Q11, transpose, R11);
  mux2to1 mux6(Q12, Q21, transpose, R12);
  mux2to1 mux7(Q13, Q31, transpose, R13);
  mux2to1 mux8(Q20, Q02, transpose, R20);
  mux2to1 mux9(Q21, Q12, transpose, R21);
  mux2to1 mux10(Q22, Q22, transpose, R22);
  mux2to1 mux11(Q23, Q32, transpose, R23);
  mux2to1 mux12(Q30, Q03, transpose, R30);
  mux2to1 mux13(Q31, Q13, transpose, R31);
  mux2to1 mux14(Q32, Q23, transpose, R32);
  mux2to1 mux15(Q33, Q33, transpose, R33);

  //Row 0
  assign out[63:60] = R00;
  assign out[59:56] = R01;
  assign out[55:52] = R02;
  assign out[51:48] = R03;

  //Row 1
  assign out[47:44] = R10;
  assign out[43:40] = R11;
  assign out[39:36] = R12;
  assign out[35:32] = R13;

  //Row 2
  assign out[31:28] = R20;
  assign out[27:24] = R21;
  assign out[23:20] = R22;
  assign out[19:16] = R23;

  //Row 3
  assign out[15:12] = R30;
  assign out[11:8]  = R31;
  assign out[7:4]   = R32;
  assign out[3:0]   = R33;
endmodule

module transpose(grid_in, transpose_enable, grid_out);
  input [63:0] grid_in;
  input transpose_enable;
  output [63:0] grid_out;

  transpose_grid t1(grid_in, transpose_enable, grid_out);
endmodule
// temporary - delete later

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

module display(input[3:0] F, output[6:0] hex);
    wire c0, c1, c2, c3;
    assign c0 = F[0];
    assign c1 = F[1];
    assign c2 = F[2];
    assign c3 = F[3];
    assign hex[6] = (~c3 & ~c2 & ~c1 & ~c0) | (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & c1 & c0);
    assign hex[5] = (~c3 & ~c2 & ~c1 & c0) | (~c3 & ~c2 & c1 & ~c0) | (~c3 & ~c2 & c1 & c0) | (~c3 & c2 & c1 & c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & ~c1 & c0);
    assign hex[4] = (~c3 & ~c2 & ~c1 & c0) | (~c3 & ~c2 & c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (~c3 & c2 & ~c1 & c0) | (~c3 & c2 & c1 & c0) | (c3 & ~c2 & ~c1 & c0);
    assign hex[3] = (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (~c3 & c2 & c1 & c0) | (c3 & ~c2 & ~c1 & c0) | (c3 & ~c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign hex[2] = (~c3 & ~c2 & c1 & ~c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign hex[1] = (~c3 & c2 & ~c1 & c0) | (~c3 & c2 & c1 & ~c0) | (c3 & ~c2 & c1 & c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign hex[0] = (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (c3 & ~c2 & c1 & c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & ~c1 & c0);
endmodule

// demo
module demo2(SW, LEDR, HEX3, HEX2, HEX1, HEX0);
    input [1:0] SW;
    output [1:0] LEDR;
    output [6:0] HEX3, HEX2, HEX1, HEX0;

    // input and output not actually shown
    wire [15:0] case_win, case_loss, case_both, case_playing;
    wire [47:0] checkerboard;
    wire [63:0] grid_in;
    wire [1:0] winloss_2bit;
    reg [15:0] shown_row;

    assign case_win = 16'h1B11;
    assign case_loss = 16'h1212;
    assign case_both = 16'h1B12;
    assign case_playing = 16'h1112;

    assign checkerboard = 48'h212112122121;
    assign grid_in = {shown_row, checkerboard};

    endchecker checker(grid_in, winloss_2bit);
    
    always @(*) begin
        if (!SW[0] & !SW[1]) begin
            shown_row = case_win;
        end
        else if (SW[0] & !SW[1]) begin
            shown_row = case_loss;
        end
        else if (!SW[0] & SW[1]) begin
            shown_row = case_both;
        end
        else begin
            shown_row = case_playing;
        end
    end

    display d0(shown_row[3:0], HEX0);
    display d1(shown_row[7:4], HEX1);
    display d2(shown_row[11:8], HEX2);
    display d3(shown_row[15:12], HEX3);
    
    assign LEDR[1] = winloss_2bit[1];
    assign LEDR[0] = winloss_2bit[0];
endmodule