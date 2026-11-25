module reg4(storedVal, enable, clock, reset, Q);
  input [3:0] storedVal;
  input clock;
  input reset;
  input enable;
  output reg [3:0] Q;

  always @ (posedge clock) begin
    if(!reset)begin
      Q<= 4'b0000;
    end
    
    else if (enable) begin
      Q<=storedVal;
    end
  end
endmodule

module gridmemory(grid_in, enable, clock, reset, grid_out);
  //After all combinations of transformations are done:
  //ie. after compress --> combine --> compress
  //The board needs to be stored

  input [63:0] grid_in;
  input enable, clock, reset;
  output [63:0] grid_out;

  //R00 to R33 --> The grid completed after final moves calculated by move controller
  wire [3:0] R00, R01, R02, R03, R10, R11, R12, R13, R20, R21, R22, R23, R30, R31, R32, R33;

  assign R00 = grid_in[63:60];
  assign R01 = grid_in[59:56];
  assign R02 = grid_in[55:52];
  assign R03 = grid_in[51:48];

  //Row 1
  assign R10 = grid_in[47:44];
  assign R11 = grid_in[43:40];
  assign R12 = grid_in[39:36];
  assign R13 = grid_in[35:32];

  //Row 2
  assign R20 = grid_in[31:28];
  assign R21 = grid_in[27:24];
  assign R22 = grid_in[23:20];
  assign R23 = grid_in[19:16];

  //Row 3
  assign R30 = grid_in[15:12];
  assign R31 = grid_in[11:8];
  assign R32 = grid_in[7:4];
  assign R33 = grid_in[3:0];
  
  
  //Q00 to Q33 --> The "current grid" stored until it gets updated
  wire [3:0] Q00, Q01, Q02, Q03, Q10, Q11, Q12, Q13, Q20, Q21, Q22, Q23, Q30, Q31, Q32, Q33;

  reg4 storedR00(R00, enable, clock, reset, Q00);
  reg4 storedR01(R01, enable, clock, reset, Q01);
  reg4 storedR02(R02, enable, clock, reset, Q02);
  reg4 storedR03(R03, enable, clock, reset, Q03);
  reg4 storedR10(R10, enable, clock, reset, Q10);
  reg4 storedR11(R11, enable, clock, reset, Q11);
  reg4 storedR12(R12, enable, clock, reset, Q12);
  reg4 storedR13(R13, enable, clock, reset, Q13);
  reg4 storedR20(R20, enable, clock, reset, Q20);
  reg4 storedR21(R21, enable, clock, reset, Q21);
  reg4 storedR22(R22, enable, clock, reset, Q22);
  reg4 storedR23(R23, enable, clock, reset, Q23);
  reg4 storedR30(R30, enable, clock, reset, Q30);
  reg4 storedR31(R31, enable, clock, reset, Q31);
  reg4 storedR32(R32, enable, clock, reset, Q32);
  reg4 storedR33(R33, enable, clock, reset, Q33);

  //Row 0
  assign grid_out[63:60] = Q00;
  assign grid_out[59:56] = Q01;
  assign grid_out[55:52] = Q02;
  assign grid_out[51:48] = Q03;

  //Row 1
  assign grid_out[47:44] = Q10;
  assign grid_out[43:40] = Q11;
  assign grid_out[39:36] = Q12;
  assign grid_out[35:32] = Q13;

  //Row 2
  assign grid_out[31:28] = Q20;
  assign grid_out[27:24] = Q21;
  assign grid_out[23:20] = Q22;
  assign grid_out[19:16] = Q23;

  //Row 3
  assign grid_out[15:12]=Q30; 
  assign grid_out[11:8]= Q31;
  assign grid_out[7:4]= Q32;
  assign grid_out[3:0]=Q33;
endmodule
