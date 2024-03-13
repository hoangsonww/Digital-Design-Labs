module testbench_lab4 ();

    logic [3:0]  a4, b4, s4;
    logic [7:0]  a8, b8, s8;
    logic [1:0]  f;
    logic        co4, co8;
    logic        clk;
    logic [25:0] tvs [15:0];
    int i = 0;

    gen_alu #(
        .N(4)
    ) UUT4 (
        .a(a4),
        .b(b4),
        .f(f),
        .s(s4),
        .co(co4)
    );

    gen_alu #( 
	.N(8)
    ) UUT8 (
        .a(a8),
        .b(b8),
        .f(f),
        .s(s8),
        .co(co8)
    );

    initial begin
        clk = 1'b0;
        forever #10 
	    clk = ~clk;
    end

    always @(posedge clk) begin
        f  = tvs[i][25:24];   
        a4 = tvs[i][23:20];    
        b4 = tvs[i][19:16];              
        a8 = tvs[i][15:8];    
        b8 = tvs[i][7:0];     
        i++;
    end

    initial begin
        $readmemb("test_vectors.txt", tvs);
        $display("TIME |  A4   B4  |  S4  CO4|     A8         B8     |    S8    CO8| ");
        $monitor(" %3d | %4b %4b | %4b  %b |  %8b   %8b  | %8b  %b |", $time, a4, b4, s4, co4, a8, b8, s8, co8);  
        #320 
	$finish();
    end

endmodule