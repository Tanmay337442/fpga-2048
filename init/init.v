module init(clk, reset, grid_out, initialized);
    input clk, reset;
    output reg initialized;
    output [63:0] grid_out;
    wire complete;
    reg enable;
    // enable is used to create a random number in the grid, complete tells you when it's been added
    random random_generator(clk, reset, enable, grid_out, grid_out, complete);
    // need an fsm to keep track of how many 2's have been spawned
    reg [1:0] state;
    parameter FIRST = 2'b00, FIRST_COMPLETE = 2'b01, SECOND = 2'b10, SECOND_COMPLETE = 2'b11;
    always @(posedge clk) begin
        if (reset) begin
            enable <= 1'b0;
            initialized <= 1'b0;
            state <= FIRST;
        end
        else begin
            case (state)
                FIRST: begin
                    enable <= 1'b1; // triggers the random generation once
                    // if number added
                    if (complete) begin
                        // move into WAITING in random
                        // complete will go low after one cycle
                        enable <= 1'b0;
                        state <= FIRST_COMPLETE;
                    end
                end
                FIRST_COMPLETE: begin
                    // ensure complete is low before moving to second number generation
                    if (!complete) begin
                        state <= SECOND;
                    end
                end
                SECOND: begin
                    // pulse enable high to trigger random generation second time
                    enable <= 1'b1;
                    // if number added
                    if (complete) begin
                        // move into WAITING in random
                        // complete goes low
                        enable <= 1'b0;
                        state <= SECOND_COMPLETE;
                    end
                end
                SECOND_COMPLETE: begin
                    // board is now initialized
                    initialized <= 1'b1;
                end
                default: state <= FIRST;
            endcase
        end
    end
endmodule