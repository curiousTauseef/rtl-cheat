/*
Sequential hello world.

Synchronous active high reset with active high enable signal.
Adapted from: http://www.asic-world.com/verilog/first1.html
*/
module counter (
    /* All the input ports should be wires. */
    input wire clock,
    input wire reset,
    input wire enable,
    output reg [1:0] out
);
    /* Do this on every positive edge. */
    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            out <= 2'b00;
        end
        else if (enable == 1'b1) begin
            out <= out + 1;
        end
    end
endmodube
