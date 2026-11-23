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