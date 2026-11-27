module gamestatefsm (clock, reset, initialized, win, loss, y, move_enable, screen_select);
  input clock;
  input reset;
  input initialized;
  input win;
  input loss;
  output reg [1:0] y;
  output reg move_enable;
  output reg [1:0] screen_select;

  //encoding
  parameter [1:0] I = 2'b00, P = 2'b01, W = 2'b10, L = 2'b11;

  reg [1:0] Y;

  //Remember current state + reset:
  always @(posedge clock) begin
    if (reset)
      y <= I;
    else
      y <= Y;
  end

  //FSM:
  always @(*) begin
    case (y)
      I: begin
        if (initialized) //given by Init
          Y = P;
        else
          Y = I;
      end

      P: begin
        if (win) //given by Win/loss checker
          Y = W;
        else if (loss) //given by win/loss checker
          Y = L;
        else
          Y = P;
      end

      //reset == 1 already in register above
      W: begin
        Y = W;
      end

      //reset == 1 already in register above
      L: begin
        Y = L;
      end

      default: begin
        Y = I;
      end
    endcase
  end

  //Outputs
  always @(*) begin
    case (y)
      I: begin
        move_enable   = 1'b0; //cant move when initializing
        screen_select = 2'b00; //select screen --> 00
      end

      P: begin
        move_enable   = 1'b1; //can move
        screen_select = 2'b01; //select screen --> 01
      end

      W: begin
        move_enable   = 1'b0; //can't move when won
        screen_select = 2'b10; //select screen --> 10
      end

      L: begin
        move_enable   = 1'b0; //cant move when lost
        screen_select = 2'b11; //select screen --> 11
      end

      default: begin
        move_enable   = 1'b0; //default cases 
        screen_select = 2'b00; //default cases
      end
    endcase
  end
endmodule
