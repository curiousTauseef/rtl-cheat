# VHDL Cheat

1.  [GHDL](ghdl.md)
1.  [Wave files](wave-files.md)
1.  [Language](language.md)
1.  Examples
    1.  [Comments](comments_tb.vhdl)
    1.  [Hello world](hello_world_tb.vhdl)
    1.  [Min](min_tb.vhdl)
    1.  [write](write_tb.vhdl)
    1.  [assert](assert_tb.vhdl)
    1.  [Literals](literals_tb.md)
    1.  [Operators](operators_tb.md)
    1.  [STANDARD package](standard_package_tb.md)
    1.  Combinatoric
        1.  [Adder](adder.vhdl)
        1.  [sqrt8](sqrt8_tb.vhdl)
        1.  TODO multiplier
    1.  Sequential
        1.  [Clock](clock_tb.vhdl)
        1.  [Counter](counter.vhdl)
1.  Helpers
    1.  [Template](template_tb.vhdl)
1.  [Bibliography](bibliography.md)

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

Non-free... <http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=4772740&filter=AND(p_Publication_Number:4772738)>

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

## Testbench

Usually non synthesizable test driver circuit.

## Behavioural vs structural modeling

Behavioural:

- a component is implemented as a black box using high level constructs
- only IO matters, not how it is generated
- the component does not need to be synthesizable

Structural: opposite.
