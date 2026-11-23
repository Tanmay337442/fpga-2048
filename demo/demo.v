module display(input[3:0] F, output[6:0] hex);
    wire c0, c1, c2, c3;
    assign c0 = F[0];
    assign c1 = F[1];
    assign c2 = F[2];
    assign c3 = F[3];
    assign hex[6] = (~c3 & ~c2 & ~c1 & ~c0) | (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & c1 & c0);
    assign hex[5] = (~c3 & ~c2 & ~c1 & c0) | (~c3 & ~c2 & c1 & ~c0) | (~c3 & ~c2 & c1 & c0) | (~c3 & c2 & c1 & c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & ~c1 & c0);
    assign hex[4] = (~c3 & ~c2 & ~c1 & c0) | (~c3 & ~c2 & c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (~c3 & c2 & ~c1 & c0) | (~c3 & c2 & c1 & c0) | (c3 & ~c2 & ~c1 & c0);
    assign hex[3] = (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (~c3 & c2 & c1 & c0) | (c3 & ~c2 & ~c1 & c0) | (c3 & ~c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign hex[2] = (~c3 & ~c2 & c1 & ~c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign hex[1] = (~c3 & c2 & ~c1 & c0) | (~c3 & c2 & c1 & ~c0) | (c3 & ~c2 & c1 & c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign hex[0] = (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (c3 & ~c2 & c1 & c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & ~c1 & c0);
endmodule

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

module compact_row(row_init, row_final);
    input [15:0] row_init;
    output [15:0] row_final;
    wire [15:0] row_temp0;
    wire [15:0] row_temp1;
    compact_row_single c1(row_init, row_temp0);
    compact_row_single c2(row_temp0, row_temp1);
    compact_row_single c3(row_temp1, row_final);
endmodule

module combine_adjacent(l_init, r_init, l_final, r_final);
    input [3:0] l_init, r_init;
    output reg [3:0] l_final, r_final;
    always @(*) begin
        if (l_init != 0 && l_init == r_init) begin
            l_final = l_init + 4'b0001;
            r_final = 4'b0000;
        end
        else begin
            l_final = l_init;
            r_final = r_init;
        end
    end
endmodule

module combine_row(row_init, row_final);
    input [15:0] row_init;
    output [15:0] row_final;
    wire [15:0] row_temp0;
    wire [15:0] row_temp1;
    combine_adjacent c1(row_init[15:12], row_init[11:8], row_temp0[15:12], row_temp0[11:8]);
    assign row_temp0[7:0] = row_init[7:0];
    combine_adjacent c2(row_temp0[11:8], row_temp0[7:4], row_temp1[11:8], row_temp1[7:4]);
    assign row_temp1[15:12] = row_temp0[15:12];
    assign row_temp1[3:0] = row_temp0[3:0];
    combine_adjacent c3(row_temp1[7:4], row_temp1[3:0], row_final[7:4], row_final[3:0]);
    assign row_final[15:8] = row_temp1[15:8];
endmodule

module demo(SW, KEY, HEX3, HEX2, HEX1, HEX0);
    input [0:0] SW, KEY;
    output [6:0] HEX3, HEX2, HEX1, HEX0;

    // input and output not actually shown
    wire [15:0] compact_in, combine_in, compact_out, combine_out;
    // row in row out not shown but hold values under the hood, shown row is the actually shown row
    reg [15:0] row_in, row_out, shown_row;

    assign compact_in = 16'h0101;
    assign combine_in = 16'h1111;

    // get the outputs
    compact_row compact(compact_in, compact_out);
    combine_row combine(combine_in, combine_out);
    
    always @(*) begin
        // if switch is off set compact, if on set combine
        if (SW[0] == 1'b0) begin
            row_in = compact_in;
            row_out = compact_out;
        end
        else begin
            row_in = combine_in;
            row_out = combine_out;
        end
        // if key is pressed show row, if key not pressed show row in
        if (KEY[0] == 1'b0) begin
            shown_row = row_out;
        end
        else begin
            shown_row = row_in;
        end
    end

    display d0(shown_row[3:0], HEX0);
    display d1(shown_row[7:4], HEX1);
    display d2(shown_row[11:8], HEX2);
    display d3(shown_row[15:12], HEX3);
endmodule