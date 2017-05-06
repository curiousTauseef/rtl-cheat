`include "ram.v"
module ram_tb();
    reg clock, reset, write;
    reg [1:0] address;
    wire data;

    initial begin
        $dumpfile("ram_tb.vcd");
        $dumpvars;
        clock = 1;
        reset = 0;
        write = 0;
        address = 2'b0;
        #1 reset = 1;
        #2 reset = 0;
        #10 $finish;
    end

    always begin
        #1 clock = ~clock;
    end

    ram top (
        clock,
        reset,
        write,
        address,
        data
    );
endmodule
