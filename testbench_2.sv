`timescale 1ns/10ps

module testbench_lab2 ();

    logic a, b;
    logic y1s, y2s, y3s;
    logic y1d, y2d, y3d;
    logic y1b, y2b, y3b;

    module_s UUT1 (
        .a (a),
        .b (b),
        .y1(y1s),
        .y2(y2s),
        .y3(y3s)
    );

    module_d UUT2 (
        .a (a),
        .b (b),
        .y1(y1d),
        .y2(y2d),
        .y3(y3d)
    );

    module_b UUT3 (
        .a (a),
        .b (b),
        .y1(y1b),
        .y2(y2b),
        .y3(y3b)
    ); 


    initial begin
        a = 0;
        b = 0;
        #10;
        a = 1;
	b = 0;
        #10;
        a = 0;
        b = 1;
        #10;
        a = 1;
	b = 1;
        #10;
        $finish();
    end

    initial begin
        $display("TIME | AB | y1s y2s y3s | y1d y2d y3d | y1b y2b y3b");
        $display("---------------------------------------------------");
        $monitor("  %2d | %b %b |   %b   %b   %b |   %b   %b   %b |   %b   %b   %b",
          	  $time, a, b, y1s, y2s, y3s, y1d, y2d, y3d, y1b, y2b, y3b);

        $dumpfile("lab2.vcd");
        $dumpvars(1, a, b, y1s, y2s, y3s, y1d, y2d, y3d, y1b, y2b, y3b);
        $dumpflush;
    end

endmodule
