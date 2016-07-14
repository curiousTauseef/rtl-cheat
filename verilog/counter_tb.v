`include "counter.v"
module counter_tb();
    // Declare inputs as regs and outputs as wires.
    reg clock, reset, enable;
    wire [1:0] out;

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);
        $display ("time\t clk reset enable counter");
        $monitor ("%g\t %b   %b     %b      %b",
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

    // Connect DUT to test bench.
    counter U_counter (
        clock,
        reset,
        enable,
        out
    );
endmodule
