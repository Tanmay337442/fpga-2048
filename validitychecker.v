module comparator(x, y, enable);
  input [3:0] x, y;
  output enable;

  wire [3:0] e;

  assign e[3] = x[3] ^ y[3];
  assign e[2] = x[2] ^ y[2];
  assign e[1] = x[1] ^ y[1];
  assign e[0] = x[0] ^ y[0];

  //If both are different, then enable will equal 1
  //If both are same, e[3] = 0, e[2] = 0, e[1] = 0, e[0] = 0
  //Thus, if even one bit is different, enable == 1
  assign enable = e[3] | e[2] | e[1] | e[0];
endmodule

module mux2to1 (x,y,s,f);
  //x: current board
  //y: updated board
  input [3:0] x, y;
  input s;
  output reg [3:0] f;

  always@(*)begin
    //flip = 0
    if(s == 1'b0) begin
      f = x;
    end

    //flip = 1
    else if (s == 1'b1) begin
      f = y;
    end
  end
endmodule

module validitychecker(updated_grid, current_grid, new_grid);
  //Game Move Validity Checker
  //Compares current grid with an updated board
  //If the 2 boards are different: send updated board to grid memory
  //If the 2 boards are the same: do nothing

  //Receives updated grid from move controller and the most current grid from grid memory
  //Compares the values of each grid (R00, R01, R02, etc.) from updated and current

  //Updated Grid [3:0] XOR Current Grid [3:0] (individually)
  //If Result == 0 --> Both are identical (nothing happens / current grid should not change)
  //If Result == 1 --> Both are not identical (updated grid should be passed through)

  input [63:0] updated_grid, current_grid;
  output [63:0] new_grid;

  wire [3:0] R00, R01, R02, R03, R10, R11, R12, R13, R20, R21, R22, R23, R30, R31, R32, R33;
  wire [3:0] Q00, Q01, Q02, Q03, Q10, Q11, Q12, Q13, Q20, Q21, Q22, Q23, Q30, Q31, Q32, Q33;
  wire [15:0] enableCheck;

  //Updated Grid:
  //Row 0
  assign R00 = updated_grid[63:60];
  assign R01 = updated_grid[59:56];
  assign R02 = updated_grid[55:52];
  assign R03 = updated_grid[51:48];

  //Row 1
  assign R10 = updated_grid[47:44];
  assign R11 = updated_grid[43:40];
  assign R12 = updated_grid[39:36];
  assign R13 = updated_grid[35:32];

  //Row 2
  assign R20 = updated_grid[31:28];
  assign R21 = updated_grid[27:24];
  assign R22 = updated_grid[23:20];
  assign R23 = updated_grid[19:16];

  //Row 3
  assign R30 = updated_grid[15:12];
  assign R31 = updated_grid[11:8];
  assign R32 = updated_grid[7:4];
  assign R33 = updated_grid[3:0];

  //Current Grid:
  //Row 0
  assign Q00 = current_grid[63:60];
  assign Q01 = current_grid[59:56];
  assign Q02 = current_grid[55:52];
  assign Q03 = current_grid[51:48];

  //Row 1
  assign Q10 = current_grid[47:44];
  assign Q11 = current_grid[43:40];
  assign Q12 = current_grid[39:36];
  assign Q13 = current_grid[35:32];

  //Row 2
  assign Q20 = current_grid[31:28];
  assign Q21 = current_grid[27:24];
  assign Q22 = current_grid[23:20];
  assign Q23 = current_grid[19:16];

  //Row 3
  assign Q30 = current_grid[15:12];
  assign Q31 = current_grid[11:8];
  assign Q32 = current_grid[7:4];
  assign Q33 = current_grid[3:0];

  wire [3:0] F00, F01, F02, F03, F10, F11, F12, F13, F20, F21, F22, F23, F30, F31, F32, F33;

  wire enable;

  comparator checkR00(R00, Q00, enableCheck[0]);
  comparator checkR01(R01, Q01, enableCheck[1]);
  comparator checkR02(R02, Q02, enableCheck[2]);
  comparator checkR03(R03, Q03, enableCheck[3]);
  comparator checkR10(R10, Q10, enableCheck[4]);
  comparator checkR11(R11, Q11, enableCheck[5]);
  comparator checkR12(R12, Q12, enableCheck[6]);
  comparator checkR13(R13, Q13, enableCheck[7]);
  comparator checkR20(R20, Q20, enableCheck[8]);
  comparator checkR21(R21, Q21, enableCheck[9]);
  comparator checkR22(R22, Q22, enableCheck[10]);
  comparator checkR23(R23, Q23, enableCheck[11]);
  comparator checkR30(R30, Q30, enableCheck[12]);
  comparator checkR31(R31, Q31, enableCheck[13]);
  comparator checkR32(R32, Q32, enableCheck[14]);
  comparator checkR33(R33, Q33, enableCheck[15]);

  assign enable = enableCheck[0] | enableCheck[1] | enableCheck[2] | enableCheck[3] | enableCheck[4] | enableCheck[5] | enableCheck[6] | enableCheck[7] | enableCheck[8] | enableCheck[9] | enableCheck[10] | enableCheck[11] | enableCheck[12] | enableCheck[13] | enableCheck[14] | enableCheck[15];
 
  mux2to1 mux0(Q00, R00, enable, F00);
  mux2to1 mux1(Q01, R01, enable, F01);
  mux2to1 mux2(Q02, R02, enable, F02);
  mux2to1 mux3(Q03, R03, enable, F03);
  mux2to1 mux4(Q10, R10, enable, F10);
  mux2to1 mux5(Q11, R11, enable, F11);
  mux2to1 mux6(Q12, R12, enable, F12);
  mux2to1 mux7(Q13, R13, enable, F13);
  mux2to1 mux8(Q20, R20, enable, F20);
  mux2to1 mux9(Q21, R21, enable, F21);
  mux2to1 mux10(Q22, R22, enable, F22);
  mux2to1 mux11(Q23, R23, enable, F23);
  mux2to1 mux12(Q30, R30, enable, F30);
  mux2to1 mux13(Q31, R31, enable, F31);
  mux2to1 mux14(Q32, R32, enable, F32);
  mux2to1 mux15(Q33, R33, enable, F33);


  //Row 0
  assign new_grid[63:60] = F00;
  assign new_grid[59:56] = F01;
  assign new_grid[55:52] = F02;
  assign new_grid[51:48] = F03;

  //Row 1
  assign new_grid[47:44] = F10;
  assign new_grid[43:40] = F11;
  assign new_grid[39:36] = F12;
  assign new_grid[35:32] = F13;

  //Row 2
  assign new_grid[31:28] = F20;
  assign new_grid[27:24] = F21;
  assign new_grid[23:20] = F22;
  assign new_grid[19:16] = F23;

  //Row 3
  assign new_grid[15:12]= F30; 
  assign new_grid[11:8] = F31;
  assign new_grid[7:4] = F32;
  assign new_grid[3:0] = F33;


  //F is what holds either the current or the updated grid depending on if enable is 0 or 1
  //if enable is 0 --> F is current grid (will not update)
  //if enable is 1 --> F is the updated grid as the grids are not identical
endmodule
