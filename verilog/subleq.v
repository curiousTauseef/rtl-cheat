/*
subleq OSIC with separated instruction and data RAMs.

http://stackoverflow.com/a/38523869/895245
*/
module subleq #(
    parameter BITS = 1
) (
    input wire clock,
    input wire reset,
    output wire write,
    output wire [BITS-1:0] address,
    inout wire [BITS-1:0] data
);
    reg [1:0] stage;
    reg [BITS-1:0] pc, a, b, c;

    wire signed [BITS-1:0] b_next;

    assign address =
        (stage == 0) ? pc + BITS'(0 * BITS) :
        (stage == 1) ? pc + BITS'(1 * BITS) :
        (stage == 2) ? pc + BITS'(2 * BITS) :
        (stage == 3) ? c :
        {BITS{1'b0}}
    ;
    assign b_next = b - a;
    assign data = write ? b_next : {BITS{1'bz}};
    assign write = stage == 3;

    always @(posedge clock) begin
        if (reset == 1'b1) begin
            pc <= 0;
            stage <= 0;
        end else begin
            case(stage)
                0: a <= data;
                1: b <= data;
                2: c <= data;
                3: pc <= (b_next < 0) ? c : pc + BITS'(BITS);
            endcase
            stage <= stage + 1;
        end
    end
endmodule
