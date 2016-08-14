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
- <https://githubbcom/cjdrake/pyeda>

### Open source tools

Open source tools:

- <https://github.com/verilog-to-routing/vtr-verilog-to-routing>
- Yosys

## GDSII

<https://en.wikipedia.org/wiki/GDSII>

IC description format, which describes the 3D structure of the chip.

TODO if I send it to a fab with a lump of cash, will they print it?

Open source generator tool (place and route, `pnr`): <http://stackoverflow.com/questions/4180596/verilog-to-gdsii-compiler-open-source>
