/*
Zero delay 1-bit bus, 2 bit capacity RAM model.

You will need RAM's for all non-trivial designs.
*/
module ram (
    input wire clock,
    input wire reset,
    input wire in,
    input wire [1:0] address,
    inout wire data
);

    output reg [1:0] out

    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            out <= 2'b00;
        end
        else if (enable == 1'b1) begin
            out <= out + 1;
        end
    end
endmodube
