`include "negator2.v"
module negator_tb();
    reg clock;
    wire out;

    initial begin
        $dumpfile("negator2_tb.vcd");
        $dumpvars;
        clock = 0;
        #10 $finish;
    end

    always begin
        #1 clock = ~clock;
    end

    negator2 top (
        clock,
        out
    );
endmodule
