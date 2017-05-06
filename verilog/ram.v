/*
Zero delay 1-bit bus, 2 bit capacity RAM model.

You will need RAM's for all non-trivial designs.
*/
module ram (
    input wire clock,
    input wire reset,
    input wire write,
    input wire [1:0] address,
    inout wire data
);
    reg [1:0] memory;

    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            memory <= {2{1'b1}};
        end
    end
endmodule
