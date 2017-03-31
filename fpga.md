# FPGA

## Applications

The major application of FPGAs seems to be to prototype ASICs, as FPGAs are way faster than software simulations.

But they are still way slower and more expensive than the final ASIC.

So basically every application that makes a lot of money deserves a dedicated ASIC.

- <http://stackoverflow.com/questions/7458850/what-are-some-practical-applications-of-an-fpga>
- <http://stackoverflow.com/questions/2909035/algorithms-fpgas-dominate-cpus-on>
- <http://stackoverflow.com/questions/317731/cuda-vs-fpga>
- <http://electronics.stackexchange.com/questions/97277/when-can-fpgas-be-used-and-microcontrollers-dsps-not>
- <https://www.quora.com/What-are-the-most-common-uses-for-FPGA-today>

## Vendors

There are two major vendors as of 2016: Xilinx and Altera.

Third one: Lattice Semiconductor, maker of ICE, which has had the bitstream reversed by the Project IceStorm.

### Cheapest FPGAs

<https://hackaday.io/project/12930-mystorm-the-30-open-hardware-fpga-dev-board>

## .bit file

## Bitstream file

FPGA input.

<http://www.fpga-faq.com/FAQ_Pages/0026_Tell_me_about_bit_files.htm>

Xilinx.

Stands for "bit-stream".

Almost always closed: <https://news.ycombinator.com/item?id=10653179>

Generated from VHDL by vendor tools. TODO: automatically or further human intervention needed?

## Simulation

Besides VHDL simulations, FPGA vendors also offer simulation of their hardware, closer to the actual implementation: <http://www.lowrisc.org/docs/untether-v0.2/fpga-sim/>

<http://electronics.stackexchange.com/questions/57220/simulating-fpga-design-without-having-the-actual-hardware>

## PLD

<https://en.wikipedia.org/wiki/Programmable_logic_device>

Reprogrammable devices, one of which are FPGAs.

#### SPLD

https://en.wikipedia.org/wiki/Simple_programmable_logic_device

#### CPLD

https://en.wikipedia.org/wiki/Complex_programmable_logic_device

## Synthesis

<https://github.com/cseed/arachne-pnr>

## FPGA with CPU

Some vendors sell prototyping boards that integrate FPGA with CPUs, so that you can simulate an ASIC that is meant to interact with a given CPU, e.g. in SoC design.

- <http://www.arm.com/products/tools/development-boards/versatile-express/juno-arm-development-platform.php> <http://www.arm.com/products/tools/development-boards/versatile-express/logictile-express.php>
