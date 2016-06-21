# Getting started

Install GHDL: http://askubuntu.com/questions/655961/use-14-04-application-in-15-04/786463#786463

This was tested on GHDL `v0.33`.

We use the following naming convention:

-   files that end in `XXX_tb.vhdl` are runnable testbenches.

    They may or may not have a corresponding `XXX.vhdl` file which is the component being tested.

    If that file exists, it must be analyzed before the `_tb` is run.

Run all testbenches:

    ./run

Run a single testbench: either of:

    ./run counter
    ./run counter_tb
    ./run counter_tb.vhdl

The corresponding `counter.vhdl` file is analyzed first automatically.

Clean up generated files:

    ./clean
