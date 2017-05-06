# Getting started

Run all testbenches (`_tb.v`):

    make run

The output of every testbench is a `*_tb.vcd` file, which you can visualise with:

    gtkwave negator_tb.vcd

or other tools.

Run a single testbench:

    make run-negator
