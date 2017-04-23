`include "ram.v"
module ram_tb();
    reg clock, reset, write;
    reg [1:0] address;
    wire data;

    initial begin
        $dumpfile("ram.vcd");
        $dumpvars;
        clock = 1;
        reset = 0;
        write = 0;
        address = 2'b0;
        #10 reset = 1;
        #10 reset = 0;
        #10 $finish;
    end

    always begin
        #5 clock = ~clock;
    end

    ram ram0 (
        clock,
        reset,
        write,
        address,
        data
    );
endmodule