# Cadence

Major tools:

- Incisive
- Genus
- Allegro: PCB
- Virtuoso: Analog
- Innovus: implementation (PnR)
- Tempus: timing sign-off <https://www.cadence.com/content/cadence-www/global/en_US/home/tools/digital-design-and-signoff/silicon-signoff/tempus-timing-signoff-solution.html>

## Documentation

<https://support.cadence.com>

Rapid adoption kits (RAK) are good single PDF + sample code getting started guides.

## Incisive

Logic simulator.

<https://en.wikipedia.org/wiki/NCSim>

<http://hdvacademy.blogspot.co.uk/2014/07/simulation-using-cadence-ncsimncverilog.html> teaches the usage:

    ncverilog counter_tb.v +nctimescale+1ns/1ns

where `counter_tb.v` includes `counter.v`.

## Genus

<https://www.cadence.com/content/cadence-www/global/en_US/home/tools/digital-design-and-signoff/synthesis/genus-synthesis-solution.html>

Synthesis.

Replaces RTL Compiler.

TCL shell (LOL TCL again, it rules the EDA industry):

    genus

List help commands:

    genus -help
