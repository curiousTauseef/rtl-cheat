`include "ram.v"
module ram_tb();
    localparam ADDRESS_BITS = 1;
    localparam DATA_BITS = 1;
    reg clock, reset, write;
    reg [ADDRESS_BITS-1:0] address;
    reg [DATA_BITS-1:0] data_in;
    wire [DATA_BITS-1:0] data_out;

    initial begin
        $dumpfile("ram_tb.vcd");
        $dumpvars;

        /* Start. */
        clock = 0;
        reset = 0;
        write = 0;

        /* Reset. */
        #2 reset = 1;
        #2 reset = 0;

        /* Write. */
        #2
        address = 0;
        data_in = 1;
        #2 write = 1;
        #2 write = 0;
        #2 $finish;
    end

    always begin
        #1 clock = ~clock;
    end

    ram top (
        clock,
        reset,
        write,
        address,
        data_in,
        data_out
    );
endmodule
