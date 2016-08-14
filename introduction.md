# Introduction

RTL can be used to specify what hardware should do.

It could also be used to specify software to run on CPUs just like C, but it is not specialized for that: <http://electronics.stackexchange.com/questions/132611/whats-the-motivation-in-using-verilog-or-vhdl-over-c> and no one uses it for that.

Hardware has the following applications compared to CPUs (which are also Turing complete): run computations with better:

- power: more energy efficiency. Specially important for mobile and huge server farms.
- performance: faster.
- area (cost): smaller chip area, and thus cheaper chips. This can be achieved if the function implemented by the chip is simpler than a full CPU design.

You're not going to do anything that a CPU cannot do, only be more efficient.

If you don't need the extra performance, don't bother with circuits.

Try something high-level first, and only go lower level if that doesn't cut it, e.g. Python -> C -> VHDL.

Creating efficient hardware is **way** harder than a high level implementation.

Efficient synthesis requires huge computational cost, and you have to produce a huge batch for it to be economically feasible.

This is why CPUs are so important: they allow Turing complete programs to be run on them efficiently without designing hardware.

Don't bother learning RTL languages if you are not going to learn and consider power, performance or cost optimizations.

## RTL generators

RTL is hard to write, and there are two ways to alleviate that:

- use RTL generators from higher level languages, e.g.:
    -   <https://github.com/ucb-bar/chisel>
    -   C
        - <http://stackoverflow.com/questions/8988629/can-you-program-fpgas-in-c-like-languages>
        - <http://electronics.stackexchange.com/questions/156041/convert-c-to-fpga>
- GUIs. As in vendor lock-in.

## Digital

VHDL and Verilog are made for digital design: every wire can basically have two voltage values.

There is an extension for analog design: <https://en.wikipedia.org/wiki/VHDL-AMS>

For mostly analog projects, consider SPICE.

## Testbench

Usually non-synthesizable test driver circuit.

We use the suffix `_tb` to indicate testbench files.
