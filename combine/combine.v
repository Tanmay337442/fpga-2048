// combine_adjacent takes 2 cells (4 binary digits) and if the left one is nonzero
// and matches the right one then the left one is incremented by 1 (which means it doubles
// since the binary digits represent the exponent of 2) and the right one becomes 0
module combine_adjacent(l_init, r_init, l_final, r_final, score_to_add);
    input [3:0] l_init, r_init;
    output reg [3:0] l_final, r_final;
    output reg [31:0] score_to_add;
    always @(*) begin
        if (l_init != 0 && l_init == r_init) begin
            l_final = l_init + 4'b0001;
            r_final = 4'b0000;
            score_to_add = 32'd1 << l_final; // shifting bit left multiplies by 2 each time
        end
        else begin
            l_final = l_init;
            r_final = r_init;
            score_to_add = 32'd0;
        end
    end
endmodule

// combine_row applies combine_adjacent on the 3 adjacent pairs of cells in a row
// this doesn’t need multiple passes since the combined tiles should not be combined again
module combine_row(row_init, row_final, score_to_add);
    input [15:0] row_init;
    output [15:0] row_final;
    output [31:0] score_to_add;
    wire [15:0] row_temp0;
    wire [15:0] row_temp1;
    wire [31:0] score1, score2, score3;
    combine_adjacent c1(row_init[15:12], row_init[11:8], row_temp0[15:12], row_temp0[11:8], score1);
    assign row_temp0[7:0] = row_init[7:0];
    combine_adjacent c2(row_temp0[11:8], row_temp0[7:4], row_temp1[11:8], row_temp1[7:4], score2);
    assign row_temp1[15:12] = row_temp0[15:12];
    assign row_temp1[3:0] = row_temp0[3:0];
    combine_adjacent c3(row_temp1[7:4], row_temp1[3:0], row_final[7:4], row_final[3:0], score3);
    assign row_final[15:8] = row_temp1[15:8];
    assign score_to_add = score1 + score2 + score3;
endmodule

// combine applies combine_row to all 4 rows
module combine(grid_in,
            grid_out, score_to_add);
    input [63:0] grid_in;
    output [63:0] grid_out;
    output [31:0] score_to_add;
    wire [5:0] score0, score1, score2, score3;
    combine_row c0(grid_in[63:48], grid_out[63:48], score0);
    combine_row c1(grid_in[47:32], grid_out[47:32], score1);
    combine_row c2(grid_in[31:16], grid_out[31:16], score2);
    combine_row c3(grid_in[15:0], grid_out[15:0], score3);
    assign score_to_add = score0 + score1 + score2 + score3;
endmodule