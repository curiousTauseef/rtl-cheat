# VHDL Cheat

1. [GHDL](ghdl.md)
1. [Wave files](wave-files.md)
1.  Examples
    1. [Hello world](hello_world.vhdl)
    1. [Clock](clock.vhdl)
    1. [Adder](adder.vhdl)
    1. TODO counter

## Digital

VHDL is made for digital design: every wire can basically have two voltage values.

There is an extension for analog design: <https://en.wikipedia.org/wiki/VHDL-AMS>

## History

Created by the USA DoF as a way to standardize documentation of third party hardware, and they ended up wanting to run those documentations.

Based on Ada because the DoF already used Ada before.

## Applications

VHDL can be used to specify hardware.

Hardware has two applications compared to CPUs (which are also Turing complete): run computations:

- faster
- more energy efficiently
- more silicon efficiently: e.g. if the application is so simple that you don't need an OS

You're not going to do anything that a CPU cannot do, only be more efficient.

One good way to find useful things to do, it to look into SoC architecture and try to re-implement some of the IP cores.

## Alternatives

### Verilog

<http://electronics.stackexchange.com/questions/16767/vhdl-or-verilog>

## Standards

IEEE standardized.

- IEEE 1076-1987: first
- IEEE 1076-2008

## Simulators

- <http://electronics.stackexchange.com/questions/22596/vhdl-ide-for-a-gnu-linux-environment>
- <http://askubuntu.com/questions/130588/is-there-a-vhdl-simulator>

The best open source one seems to be GHDL, but it is not good enough to compete? <http://www.sigasi.com/content/why-ghdl-currently-not-good-enough> Written in ADA (looks like VHDL).

## Synthesis

<http://electronics.stackexchange.com/questions/85053/how-verilog-or-vhdl-projects-are-implement-as-physical-chips>

<http://www.clifford.at/yosys/> <https://github.com/cliffordwolf/yosys> TODO: is this a simulator, or does it generate hardware compatible stuff?

### Non-synthesizable constructs

Many constructs are non-synthesizable.

There is an official synthesizable subset of VHDL.

## Useful projects

- CPU
- GPU
- TODO: which signal processors are hardware accelerated and modelled in VHDL?

## Language

### std_logic

- <http://electronics.stackexchange.com/questions/51848/when-to-use-std-logic-over-bit-in-vhdl>
- <http://stackoverflow.com/questions/12504884/std-logic-in-vhdl>
- <http://www.thecodingforums.com/threads/what-are-weak-unknown-weak-zero-and-weak-1.23302/>

### Architecture

#### stl vs behaviour

<http://electronics.stackexchange.com/questions/63682/difference-between-rtl-and-behavioral-verilog>

#### process

`process`: says that things will be done sequentially.

### wait

Wait for some time. If no arguments are given, stop the simulation.

`ghdl` has the `--stop-time=10ns` option to limit simulation time.

### library ieee

TODO optional or mandatory?

## Testbench

Usually non synthesizable test driver circuit.

## Bibliography

Introduction tutorials:

- <http://www.seas.upenn.edu/~ese171/vhdl/vhdl_primer.html>

Examples:

- <https://github.com/silverjam/VHDL>

Cool projects:

- <https://github.com/hamsternz/FPGA_Webserver>
- <https://github.com/fabioperez/space-invaders-vhdl>
