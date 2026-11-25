// add linear feedback shift register - modified from https://www.youtube.com/watch?v=Mg52A84Mcps
module lfsr(clk, seed_out);
    input clk;
    parameter seed_in = 16'hBEEF;
    output reg [15:0] seed_out = seed_in;
    wire next_bit;
    assign next_bit = ((seed_out[15] ^ seed_out[13]) ^ seed_out[12]) ^ seed_out[10];
    always @(posedge clk) begin
        seed_out <= {seed_out[14:0], next_bit};
    end
endmodule

// will be implemented by using the linear feedback shift register
module random(clk, reset, enable, grid_in, grid_out, complete);
    input clk, reset, enable;
    input [63:0] grid_in;
    output reg complete;
    output reg [63:0] grid_out;
    wire [15:0] init_pos; // initial random starting seed
    lfsr pos_lfsr(clk, init_pos);

    reg [1:0] currentstate;
    parameter [1:0] WAITING = 2'b00, SELECTING = 2'b01, COMPLETED = 2'b10; // fsm based on states of whether to select a position
   
    
    reg [3:0] select_pos; // position to insert 2 starting with 4 MSB of initial position
    // fsm that moves through states where each one is a cell in the grid
    parameter [3:0] A = 4'd0, B = 4'd1, C = 4'd2, D = 4'd3, E = 4'd4, F = 4'd5, G = 4'd6,
        H = 4'd7, I = 4'd8, J = 4'd9, K = 4'd10, L = 4'd11, M = 4'd12, N = 4'd13, O = 4'd14, P = 4'd15;
    always @(posedge clk) begin
        if (reset) begin
            currentstate <= WAITING;
            select_pos <= 4'b0000;
            grid_out <= 64'd0;
            complete <= 1'b0;
        end
        else begin
            // based on states of whether to select a position
            case (currentstate)
                // set complete low and initialize starting select position
                WAITING: begin
                    complete <= 1'b0;
                    if (enable) begin
                        select_pos <= init_pos[15:12];
                        grid_out <= grid_in;
                        currentstate <= SELECTING;
                    end
                end
                // select a cell and add a 2 then move to completed
                SELECTING: begin
                    // cases of cells to select to insert 2
                    case (select_pos)
                        // if the cell is empty add a 2 and set state to completed
                        A: if(grid_out[63:60] == 0) begin
                            grid_out[63:60] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        // if the cell is not empty move to the next cell
                        else begin
                            select_pos <= B;
                        end
                        B: if(grid_out[59:56] == 0) begin
                            grid_out[59:56] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= C;
                        end
                        C: if(grid_out[55:52] == 0) begin
                            grid_out[55:52] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= D;
                        end
                        D: if(grid_out[51:48] == 0) begin
                            grid_out[51:48] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= E;
                        end
                        E: if(grid_out[47:44] == 0) begin
                            grid_out[47:44] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= F;
                        end
                        F: if(grid_out[43:40] == 0) begin
                            grid_out[43:40] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= G;
                        end
                        G: if(grid_out[39:36] == 0) begin
                            grid_out[39:36] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= H;
                        end
                        H: if(grid_out[35:32] == 0) begin
                            grid_out[35:32] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= I;
                        end
                        I: if(grid_out[31:28] == 0) begin
                            grid_out[31:28] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= J;
                        end
                        J: if(grid_out[27:24] == 0) begin
                            grid_out[27:24] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= K;
                        end
                        K: if(grid_out[23:20] == 0) begin
                            grid_out[23:20] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= L;
                        end
                        L: if(grid_out[19:16] == 0) begin
                            grid_out[19:16] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= M;
                        end
                        M: if(grid_out[15:12] == 0) begin
                            grid_out[15:12] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= N;
                        end
                        N: if(grid_out[11:8] == 0) begin
                            grid_out[11:8] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= O;
                        end
                        O: if(grid_out[7:4] == 0) begin
                            grid_out[7:4] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= P;
                        end
                        P: if(grid_out[3:0] == 0) begin
                            grid_out[3:0] <= 4'b0001;
                            currentstate <= COMPLETED;
                        end
                        else begin
                            select_pos <= A;
                        end
                    endcase
                end
                COMPLETED: begin
                    // set complete high
                    complete <= 1'b1;
                    // when enable goes low then complete goes low again and state moves back to waiting
                    if (!enable) begin
                        complete <= 1'b0;
                        currentstate <= WAITING;
                    end
                end
                default: currentstate <= WAITING;
            endcase
        end
    end
endmodule