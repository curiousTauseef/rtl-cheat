/*
Minimalistic Turing complete CPU.

Should be super slow if we did a timing analysis.

- http://stackoverflow.com/questions/3711443/minimal-instruction-set-to-solve-any-problem-with-a-computer-program
- http://stackoverflow.com/questions/9439001/what-is-the-minimum-instruction-set-required-for-any-assembly-language-to-be-con
- http://programmers.stackexchange.com/questions/230538/what-is-the-absolute-minimum-set-of-instructions-required-to-build-a-turing-comp

What is needed for a Turing complete circuit:

- http://stackoverflow.com/questions/26644912/is-vhdl-turing-complete
- http://stackoverflow.com/questions/4908893/what-logic-gates-are-required-for-turing-completeness
- http://cs.stackexchange.com/questions/26096/are-boolean-functions-turing-complete
- http://cs.stackexchange.com/questions/51220/connection-between-nand-gates-and-turing-completeness
*/

module counter (
    input wire clock,
    input wire reset,
    input wire enable,
    output reg [1:0] out
);
    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            out <= 2'b00;
        end
        else if (enable == 1'b1) begin
            out <= out + 1;
        end
    end
endmodule
