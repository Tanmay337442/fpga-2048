//Select if flip will operate or not
module mux2to1 (x,y,s,f);
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