/*
Synchronous active high reset with active high enable signal.
Adapted from: http://www.asic-world.com/verilog/first1.html
*/
module counter (
    input clock,
    input reset,
    input enable,
    output [3:0] counter_out
);
    /* All the input ports should be wires. */
    wire clock;
    wire reset;
    wire enable;

    /* Output ports can be either regs or wires. */
    reg [3:0] counter_out ;

    /* Do this on every positive edge. */
    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            counter_out <= #1 4'b0000;
        end
        else if (enable == 1'b1) begin
            counter_out <= #1 counter_out + 1;
        end
    end
endmodule
