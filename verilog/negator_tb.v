`include "negator.v"
module negator_tb();
    // Declare inputs as regs and outputs as wires.
    reg clock;
    wire out;

    initial begin
        $dumpfile("negator_tb.vcd");
        $dumpvars;
        $display ("time\t clk out");
        $monitor ("%g\t %b   %b", $time, clock, out);
        clock = 0;
        #10 $finish;
    end

    always begin
        #1 clock = ~clock;
    end

    negator top (
        clock,
        out
    );
endmodule
