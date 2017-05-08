# Incisive

Collection of tools for functional simulation and debugging.

<https://en.wikipedia.org/wiki/NCSim>

<http://hdvacademy.blogspot.co.uk/2014/07/simulation-using-cadence-ncsimncverilog.html> teaches the usage of `ncverilog`.

<https://community.cadence.com/cadence_technology_forums/f/30/t/11942>

where `counter_tb.v` includes `counter.v`.

## irun

Convenient frontend for other tools including `ncelab` and `ncsim`.

Allows you to compile and run in a single CLI command.

Most CLI options are forwarded to the backend tools.

Recompilation is only done if sources were modified.

Options not exposed on `irun` can be explicitly forwarded with options like:

    -ncsimargs "opt1 opt2"
    -ncelabargs "opt1 opt2"

TODO generate vcd: <https://community.cadence.com/cadence_technology_forums/f/31/t/22540>

    irun -input <( echo "database a.vcd -vcd; probe counter_tb; run" ) counter_tb.v

TODO: above creating empty `.vcd`.

### Most important options

- `+nctimescale+1ns/1ns` mandatory? Can be set on testbench.
- `-access +rwc`: allows interactive debug. Runs slower.
- `-gui`: open interactive debugger (SimVision)
- `-sv`: force SystemVerilog instead of verilog. Automatic for `.sv` files, required for `.v` files.
- `-sysv2009`: use SystemVerilog 2009. TODO: no 2012? Seems to be default, but not forward compatible once they move the default to 200X...

### ncverilog

Replaced by `irun`, had basically the same options.

## ncsim

Simulator.

Requires that the Verilog has already been compiled.

Once it is: run non-interactive simulation:

    ncsim counter_tb

Open SimVision GUI, break at time 0:

    ncsim -gui counter_tb

Open REPL, break at time 0:

    ncsim -tcl counter_tb

TODO: can you step debug from there?
