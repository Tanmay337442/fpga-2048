module compact_adjacent(l_init, r_init, l_final, r_final);
    input [3:0] l_init, r_init;
    output reg [3:0] l_final, r_final;
    always @(*) begin
        if (!l_init) begin
            l_final = r_init;
            r_final = 4'b0000;
        end
        else begin
            l_final = l_init;
            r_final = r_init;
        end
    end
endmodule

module compact_row_single(row_init, row_final);
    input [15:0] row_init;
    output [15:0] row_final;
    wire [15:0] row_temp0;
    wire [15:0] row_temp1;
    compact_adjacent c1(row_init[15:12], row_init[11:8], row_temp0[15:12], row_temp0[11:8]);
    assign row_temp0[7:0] = row_init[7:0];
    compact_adjacent c2(row_temp0[11:8], row_temp0[7:4], row_temp1[11:8], row_temp1[7:4]);
    assign row_temp1[15:12] = row_temp0[15:12];
    assign row_temp1[3:0] = row_temp0[3:0];
    compact_adjacent c3(row_temp1[7:4], row_temp1[3:0], row_final[7:4], row_final[3:0]);
    assign row_final[15:8] = row_temp1[15:8];
endmodule

module compact_row(row_init, row_final);
    input [15:0] row_init;
    output [15:0] row_final;
    wire [15:0] row_temp0;
    wire [15:0] row_temp1;
    compact_row_single c1(row_init, row_temp0);
    compact_row_single c2(row_temp0, row_temp1);
    compact_row_single c3(row_temp1, row_final);
endmodule

module compact(grid_in,
            grid_out);
    input [63:0] grid_in;
    output [63:0] grid_out;
    compact_row c0(grid_in[63:48], grid_out[63:48]);
    compact_row c1(grid_in[47:32], grid_out[47:32]);
    compact_row c2(grid_in[31:16], grid_out[31:16]);
    compact_row c3(grid_in[15:0], grid_out[15:0]);
endmodule

module combine_adjacent(l_init, r_init, l_final, r_final);
    input [3:0] l_init, r_init;
    output reg [3:0] l_final, r_final;
    always @(*) begin
        if (l_init != 0 && l_init == r_init) begin
            l_final = l_init + 4'b0001;
            r_final = 4'b0000;
        end
        else begin
            l_final = l_init;
            r_final = r_init;
        end
    end
endmodule

module combine_row(row_init, row_final);
    input [15:0] row_init;
    output [15:0] row_final;
    wire [15:0] row_temp0;
    wire [15:0] row_temp1;
    combine_adjacent c1(row_init[15:12], row_init[11:8], row_temp0[15:12], row_temp0[11:8]);
    assign row_temp0[7:0] = row_init[7:0];
    combine_adjacent c2(row_temp0[11:8], row_temp0[7:4], row_temp1[11:8], row_temp1[7:4]);
    assign row_temp1[15:12] = row_temp0[15:12];
    assign row_temp1[3:0] = row_temp0[3:0];
    combine_adjacent c3(row_temp1[7:4], row_temp1[3:0], row_final[7:4], row_final[3:0]);
    assign row_final[15:8] = row_temp1[15:8];
endmodule

module combine(grid_in,
            grid_out);
    input [63:0] grid_in;
    output [63:0] grid_out;
    combine_row c0(grid_in[63:48], grid_out[63:48]);
    combine_row c1(grid_in[47:32], grid_out[47:32]);
    combine_row c2(grid_in[31:16], grid_out[31:16]);
    combine_row c3(grid_in[15:0], grid_out[15:0]);
endmodule

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
    else begin
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

module flip_row(I0, I1, I2, I3, flip, out0, out1, out2, out3);
  input [3:0] I0, I1, I2, I3;
  input flip;
  output [3:0] out0, out1, out2, out3;

  //Muxes to decide what goes into each box:
  mux2to1 mux0(I0, I3, flip, out0);
  mux2to1 mux1(I1, I2, flip, out1);
  mux2to1 mux2(I2, I1, flip, out2);
  mux2to1 mux3(I3, I0, flip, out3);
endmodule

module flip(grid_in, flip_enable, grid_out);

  input [63:0] grid_in;
  input flip_enable;
  output [63:0] grid_out;

  flip_row r0(grid_in[63:60], grid_in[59:56], grid_in[55:52], grid_in[51:48], flip_enable, grid_out[63:60], grid_out[59:56], grid_out[55:52], grid_out[51:48]);

  flip_row r1(grid_in[47:44], grid_in[43:40], grid_in[39:36], grid_in[35:32], flip_enable, grid_out[47:44], grid_out[43:40], grid_out[39:36], grid_out[35:32]);

  // Row 2
  flip_row r2(grid_in[31:28], grid_in[27:24], grid_in[23:20], grid_in[19:16], flip_enable, grid_out[31:28], grid_out[27:24], grid_out[23:20], grid_out[19:16]);

  // Row 3
  flip_row r3(grid_in[15:12], grid_in[11:8], grid_in[7:4], grid_in[3:0], flip_enable, grid_out[15:12], grid_out[11:8], grid_out[7:4], grid_out[3:0]);
endmodule

// movecontroller takes a 2 bit encoding of the move along with the grid input and applies the move to it
// applies transpose, flip, compact, and combine in order and then in reverse order to output the
// final grid after a left, right, up, or down move
module movecontroller(move_2bit, grid_in, grid_out);
    input [1:0] move_2bit; // left bit gives transpose, right bit gives flip
    input [63:0] grid_in;
    output [63:0] grid_out;
    // standard used for all
    wire [63:0] compacted0, combined0, compacted1;
    // enabled temp versions
    wire [63:0] temp0, temp1, temp2;
    
    // transpose and flip pass same grid if disabled, if enabled update grid and pass
    transpose t0(grid_in, move_2bit[1], temp0);
    flip f0(temp0, move_2bit[0], temp1);
    // since compact and combine occur for any move these do not require an enable
    compact c0(temp1, compacted0);
    combine c(compacted0, combined0);
    compact c1(combined0, compacted1);
    flip f1(compacted1, move_2bit[0], temp2);
    transpose t1(temp2, move_2bit[1], grid_out);
endmodule