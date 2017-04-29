# Verilator

<http://www.veripool.org/wiki/verilator>

Used by lowRISC.

Generates C / C++ / SystemC code that does the simulation, which can then be run multiple times fast.

Claims to be very fast, but hard to use at first.

Exposes the Verilog simulation as a C++ API, which allows us to write test benches in C / C++, which is way easier than embedding it into HDL languages.

Wiki mentions it was created by DEC for Alpha, then then open sourced.

## VERILATOR_ROOT

Must point to where it was installed, the executable is at `VERLIATOR_ROOT/bin/verilator`.

Does not need to be set for packaged Verilator installs.

When installed from source, typically equals:

    export VERILATOR_ROOT='/usr/local'

## VCD

Generated with a C++ API, like everything else. Awesome.

## Types

TODO: what to use for what?

- `vluint64_t`
