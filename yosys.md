# Yosys

<https://github.com/cliffordwolf/yosys>

At toplevel at 9804ebedbfd7db66849874bd11b167deb1bfed18 `synth.ys`:

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

Then:

    cat synth.v

and we see that there are only cells from the library!

Also worked with:

- <http://www.vlsitechnology.org/html/libraries.html>
- <http://www.vlsitechnology.org/synopsys/vsclib013.lib>

Timing:

- <https://www.reddit.com/r/yosys/comments/3djedt/timing_constraints_in_yosys_abc/>
- <http://www.clifford.at/yosys/faq.html> 3. Does Yosys support timing driven synthesis?
