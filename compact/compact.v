// compact_adjacent takes 2 cells (4 binary digits) and if the left one is zero it shifts the right number to the left position
module compact_adjacent(l_init, r_init, l_final, r_final);
    input [3:0] l_init, r_init;
    output reg [3:0] l_final, r_final;
    always @(*) begin
        if (!l_init) begin
            l_final = r_init;
            r_final = 4'b0000;
        end
        else begin
            l_final = l_init;
            r_final = r_init;
        end
    end
endmodule

// compact_row_single applies compact_adjacent on the 3 adjacent pairs of cells in a row
module compact_row_single(row_init, row_final);
    input [15:0] row_init;
    output [15:0] row_final;
    wire [15:0] row_temp0;
    wire [15:0] row_temp1;
    compact_adjacent c1(row_init[15:12], row_init[11:8], row_temp0[15:12], row_temp0[11:8]);
    assign row_temp0[7:0] = row_init[7:0];
    compact_adjacent c2(row_temp0[11:8], row_temp0[7:4], row_temp1[11:8], row_temp1[7:4]);
    assign row_temp1[15:12] = row_temp0[15:12];
    assign row_temp1[3:0] = row_temp0[3:0];
    compact_adjacent c3(row_temp1[7:4], row_temp1[3:0], row_final[7:4], row_final[3:0]);
    assign row_final[15:8] = row_temp1[15:8];
endmodule

// compact_row applies compact_row_single in 3 passes to guarantee that the worst case still works
// i.e. if there’s a row 0001 it becomes 1000
module compact_row(row_init, row_final);
    input [15:0] row_init;
    output [15:0] row_final;
    wire [15:0] row_temp0;
    wire [15:0] row_temp1;
    compact_row_single c1(row_init, row_temp0);
    compact_row_single c2(row_temp0, row_temp1);
    compact_row_single c3(row_temp1, row_final);
endmodule

// compact applies compact_row to all 4 rows
module compact(grid_in,
            grid_out);
    input [63:0] grid_in;
    output [63:0] grid_out;
    compact_row c0(grid_in[63:48], grid_out[63:48]);
    compact_row c1(grid_in[47:32], grid_out[47:32]);
    compact_row c2(grid_in[31:16], grid_out[31:16]);
    compact_row c3(grid_in[15:0], grid_out[15:0]);
endmodule