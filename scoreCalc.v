module scoreCalc(receivedScore, clock, enable, reset, updatedScore);
  input [31:0] receivedScore;
  input clock;
  input enable;
  input reset;
  output reg [7:0] updatedScore;

  always@(posedge clock, negedge reset) begin
    if(!reset) begin
      updatedScore <= 7'b0;
    end

    else if (enable) begin
      updatedScore <= updatedScore + receivedScore;
    end
  end
endmodule