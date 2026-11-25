module inputcontroller(clk, reset, key, move_2bit, keypressed, enable);
    input clk, reset;
    input [3:0] key;
    output reg [1:0] move_2bit; // left bit gives transpose, right bit gives flip
    // thus 00 is left, 01 is right, 10 is up, 11 is down
    // match key3 left key2 right key1 up key0 down
    // only want to allow one key press at a time - thus keypressed stores whether a key is pressed currently
    reg keypressed;
    // enable will tell the game state fsm whether to actually allow the move through since
    // a key can't be held and trigger many moves
    output reg enable;
    always @(posedge clk) begin
        if (reset) begin
            keypressed <= 1'b0;
            move_2bit <= 2'b00;
            enable <= 1'b0;
        end
        else begin
            enable <= 1'b0;
            if (!key[0] & !keypressed) begin
                move_2bit <= 2'b00;
                keypressed <= 1'b1;
                enable <= 1'b1;
            end
            else if (!key[1] & !keypressed) begin
                move_2bit <= 2'b01;
                keypressed <= 1'b1;
                enable <= 1'b1;
            end
            else if (!key[2] & !keypressed) begin
                move_2bit <= 2'b10;
                keypressed <= 1'b1;
                enable <= 1'b1;
            end
            else if (!key[3] & !keypressed) begin
                move_2bit <= 2'b11;
                keypressed <= 1'b1;
                enable <= 1'b1;
            end
            else if (key[3] & key[2] & key[1] & key[0] & keypressed) begin
                keypressed <= 1'b0;
            end
        end
    end
endmodule