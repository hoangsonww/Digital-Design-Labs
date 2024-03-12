module lab6 ();

    function logic [7:0] decoder3to8 (logic en_b, logic [2:0] in);
        casex({en_b, in})
            4'b1_xxx: return 8'b1111_1111;
            4'b0_000: return 8'b1111_1110;
            4'b0_001: return 8'b1111_1101;
            4'b0_010: return 8'b1111_1011;
            4'b0_011: return 8'b1111_0111;
            4'b0_100: return 8'b1110_1111;
            4'b0_101: return 8'b1101_1111;
            4'b0_110: return 8'b1011_1111;
            4'b0_111: return 8'b0111_1111;
        endcase
    endfunction

    function logic [2:0] encoder8to3 (logic en_b, logic [7:0] in_b);
        casex({en_b, in_b})
            9'b1_xxxxxxxx: return 3'b111;
            9'b0_1xxxxxxx: return 3'b000;
            9'b0_x1xxxxxx: return 3'b001;
            9'b0_xx1xxxxx: return 3'b010;
            9'b0_xxx1xxxx: return 3'b011;
            9'b0_xxxx1xxx: return 3'b100;
            9'b0_xxxxx1xx: return 3'b101;
            9'b0_xxxxxx1x: return 3'b110;
            9'b0_xxxxxxx1: return 3'b111;
        endcase
    endfunction

    logic [2:0] in, out;
    logic       clk;
    logic [7:0] output_from_decoder;

    assign output_from_decoder = decoder3to8(clk, in);
    assign out = encoder8to3(clk, output_from_decoder);

    initial begin
        clk = 1'b1;
        in  = 3'b111;
        forever #5 clk = ~clk;
    end

    always @ (posedge clk)
        in <= in + 1'b1;

    initial begin
        $monitor("Time: %0t, Input: %b, Decoder Output: %b, Encoder Output: %b", $time, in, output_from_decoder, out);
        #80 
 	$finish();
    end

endmodule

