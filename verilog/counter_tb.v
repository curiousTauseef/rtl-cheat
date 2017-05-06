`include "counter.v"
module counter_tb();
    reg clock, reset, enable;
    wire [1:0] out;

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars;
        clock = 1;
        reset = 0;
        enable = 0;
        #1 reset = 1;
        #2 reset = 0;
        #2 enable = 1;
        #20 enable = 0;
        #1 $finish;
    end

    always begin
        #1 clock = ~clock;
    end

    counter top (
        clock,
        reset,
        enable,
        out
    );
endmodule
