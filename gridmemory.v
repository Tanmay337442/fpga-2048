module reg4(storedVal, clock, reset, Q);
  input [3:0] storedVal;
  input clock;
  input reset;
  output reg [3:0] Q;

  always @ (posedge clock) begin
    if(!reset)begin
      Q<= 4'b0000;
    end
    
    else begin
      Q<=storedVal;
    end
  end
endmodule

module gridmemory();
  //After all combinations of transformations are done:
  //ie. after compress --> combine --> compress
  //The board needs to be stored

  wire clock;
  wire reset;

  //R00 to R33 --> The grid completed after final moves calculated by move controller
  wire [3:0] R00, R01, R02, R03, R10, R11, R12, R13, R20, R21, R22, R23, R30, R31, R32, R33;
  
  //Q00 to Q33 --> The "current grid" stored until it gets updated
  wire [3:0] Q00, Q01, Q02, Q03, Q10, Q11, Q12, Q13, Q20, Q21, Q22, Q23, Q30, Q31, Q32, Q33;

  reg4 storedR00(R00, clock, reset, Q00);
  reg4 storedR01(R01, clock, reset, Q01);
  reg4 storedR02(R02, clock, reset, Q02);
  reg4 storedR03(R03, clock, reset, Q03);
  reg4 storedR10(R10, clock, reset, Q10);
  reg4 storedR11(R11, clock, reset, Q11);
  reg4 storedR12(R21, clock, reset, Q12);
  reg4 storedR13(R13, clock, reset, Q13);
  reg4 storedR20(R20, clock, reset, Q20);
  reg4 storedR21(R21, clock, reset, Q21);
  reg4 storedR22(R22, clock, reset, Q22);
  reg4 storedR23(R23, clock, reset, Q23);
  reg4 storedR30(R30, clock, reset, Q30);
  reg4 storedR31(R31, clock, reset, Q31);
  reg4 storedR32(R32, clock, reset, Q32);
  reg4 storedR33(R33, clock, reset, Q33);
endmodule