# Yosys

<https://github.com/cliffordwolf/yosys>

At toplevel at 9804ebedbfd7db66849874bd11b167deb1bfed18:

    read_verilog tests/simple/fiedler-cooley.v
    hierarchy
    proc
    opt
    memory
    opt
    techmap
    opt
    dfflibmap -liberty examples/cmos/cmos_cells.lib
    abc -liberty examples/cmos/cmos_cells.lib
    opt
    write_verilog synth.v

Most of Verilog 2005.

Output: TODO check: Verilog 2005 containing only gate level primitives or cell library components.

TODO no GDSII output?

TODO: what do the following do:

    fsm
	memory
