module testbench_hw8 ();

    logic clk, rst_b, left, right, haz;
    logic [2:0] l_lights, r_lights;

    tbird_fsm UUT (
        .clk(clk),
        .rst_b(rst_b),
        .left(left),
        .right(right),
        .haz(haz),
        .l_lights(l_lights),
        .r_lights(r_lights)
    );

    initial begin
        clk   = 1'b0;
        rst_b = 1'b1;
        left  = 1'b0;
        right = 1'b0;
        haz   = 1'b0;

        forever #5 clk = ~clk;
    end

    initial begin
        #10; 
        rst_b = 1'b0;
        #20; 
        rst_b = 1'b1;
        #20;
        right = 1'b1;
        #40;
        right = 1'b0;
        left  = 1'b1;
        #40;
        left  = 1'b0;
        right = 1'b1;
        #10;
        right = 1'b0;
        haz   = 1'b1;
        #10;
        haz   = 1'b0;
        #10;
        right = 1'b1;
        #20;
        right = 1'b0;
        haz   = 1'b1;
        #10;
        haz   = 1'b0;
        #10;
        left = 1'b1;
        #10;
        left = 1'b0;
        haz  = 1'b1;
        #10;
        haz   = 1'b0;
        #10;
        left = 1'b1;
        #20;
        left = 1'b0;
        haz  = 1'b1;
        #10;
        haz   = 1'b0;
        #10;
        $finish();
    end
endmodule