`include "counter.v"
module counter_tb();
    reg clock, reset, enable;
    wire [1:0] out;

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars;
        $display ("time\tclk reset enable counter");
        $monitor ("%g\t%b   %b     %b      %b",
            $time, clock, reset, enable, out);
        clock = 1;
        reset = 0;
        enable = 0;
        #5 reset = 1;
        #10 reset = 0;
        #10 enable = 1;
        #100 enable = 0;
        #5 $finish;
    end

    always begin
        #5 clock = ~clock;
    end

    counter top (
        clock,
        reset,
        enable,
        out
    );
endmodule
