# Motivation

VHDL can be used to specify hardware.

Hardware has two applications compared to CPUs (which are also Turing complete): run computations:

- faster
- energy efficiency. Specially important for mobile and huge server farms.
- cheaper. E.g., if the application is so simple that you don't need an OS, which means larger maintenance and silicon costs

You're not going to do anything that a CPU cannot do, only be more efficient.

If you don't need the extra performance, don't bother with circuits.

Try something high-level first, and only go lower level if that doesn't cut it, e.g. Python -> C -> VHDL.

## VHDL generators

VHDL is hard to write, and there are two ways to alleviate that:

- use VHDL generators from higher level languages, e.g.:
    -   <https://github.com/ucb-bar/chisel>
    -   C
        - <http://stackoverflow.com/questions/8988629/can-you-program-fpgas-in-c-like-languages>
        - <http://electronics.stackexchange.com/questions/156041/convert-c-to-fpga>
- GUIs. As in vendor lock-in.

## VHDL vs C

<http://electronics.stackexchange.com/questions/132611/whats-the-motivation-in-using-verilog-or-vhdl-over-c>
