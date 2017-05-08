# Getting started

Tested in Ubuntu, Verilator 3.9 and Icarus 10.1, both compiled from source.

Make and run all Verilog testbenches (`*_tb.v`) in Icarus:

    make run-icarus

If any run fails, this prints an error message, and exit 1.

The output of every testbench is a `*_tb.vcd` file, which you can visualise with:

    gtkwave negator_tb.vcd

Run just one Verilog testbench in Icarus:

    make run-icarus-negator

Make and run all Verilator testbenches (`*.cpp`):

    make run-verilator

Each one generates a VCD file of form:

    negator.cpp.vcd

Make and run a single Verilator testbench:

    make run-verilator-negator

Make an run testbenches for all tools:

    make run
