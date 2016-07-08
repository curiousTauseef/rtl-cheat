/* The simplest non-identity combinatorial circuit. */
module negator(input in, output out);
    wire in, out;
    assign out = ~in;
endmodule
