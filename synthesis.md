# Synthesis

How to transform VHDL into a circuit

<https://en.wikipedia.org/wiki/Logic_synthesis> first step, transform RTL into gates.

That is the whole point of using VHDL instead of C.

<http://electronics.stackexchange.com/questions/85053/how-verilog-or-vhdl-projects-are-implement-as-physical-chips>

<http://www.clifford.at/yosys/> <https://github.com/cliffordwolf/yosys> TODO: is this a simulator, or does it generate hardware compatible stuff?

<http://electronics.stackexchange.com/questions/203689/figuring-out-mininum-maximum-clock-frequency-vhdl>

Generic howto: <http://electronics.stackexchange.com/questions/86718/how-are-microchips-designed>

## Non-synthesizable constructs

Many constructs are non-synthesizable.

There is an official synthesizable subset of VHDL.

## Tools

Open source lists:

- <http://electronics.stackexchange.com/questions/60571/open-source-verilog-synthesizer?rq=1>

### Open source tools

Open source tools:

- <https://github.com/verilog-to-routing/vtr-verilog-to-routing>

#### Yosys

<https://github.com/cliffordwolf/yosys>

Input: Verilog 2005.

Output: TODO check: Verilog 2005 containing only primitives or cell library components.

TODO no GDSII output?

## GDSII

<https://en.wikipedia.org/wiki/GDSII>

IC description format, which describes the 3D structure of the chip.

TODO if I send it to a fab with a lump of cash, will they print it?

Open source generator tool (place and route): <http://stackoverflow.com/questions/4180596/verilog-to-gdsii-compiler-open-source>

## Timing

## Delay

Fundamental analysis of how fast clock the circuit can operate under.

### SDF

<https://en.wikipedia.org/wiki/Standard_Delay_Format>

<http://www.asic-world.com/verilog/gate1.html> says a gate level representation is the most common case for an SDF simulation.
