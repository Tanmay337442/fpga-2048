// add linear feedback shift register - adapted from https://www.youtube.com/watch?v=Mg52A84Mcps
module lfsr(reset, clk, seed_out);
    input reset, clk;
    parameter seed_in = 16'hBEEF;
    output reg [15:0] seed_out;
    wire next_bit;
    assign next_bit = ((seed_out[15] ^ seed_out[13]) ^ seed_out[12]) ^ seed_out[10];
    always @(posedge clk) begin
        if (reset) begin
            seed_out <= seed_in;
        end
        else begin
            seed_out <= {seed_out[14:0], next_bit};
        end
    end
endmodule

// will be implemented by using the linear feedback shift register
module random(clk, reset, enable, grid_in, grid_out, complete);
endmodule