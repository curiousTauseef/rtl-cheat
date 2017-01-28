# Cadence

Major tools:

- Incisive
- Genus
- Allegro: PCB
- Virtuoso: Analog
- Innovus: implementation (PnR)
- Tempus: timing sign-off <https://www.cadence.com/content/cadence-www/global/en_US/home/tools/digital-design-and-signoff/silicon-signoff/tempus-timing-signoff-solution.html>
- Stratus: TODO high level wrapper over everything? But not Verilog?
- Encounter: TODO.

## Flexera

Uses Flexera license manager: <https://www.flexerasoftware.com/enterprise/products/software-license-management/flexnet-manager-engineering-apps/tab/features>

## Documentation

<https://support.cadence.com>

Rapid adoption kits (RAK) are good single PDF + sample code with dummy cell libraries getting started guides. Some good ones:

- Innovus 1801 Flow

Manuals: <https://support.cadence.com/apex/ProductManuals>

Docs also locally under:

    which <some-tool>
    cd ../../../docs

But they have terrible names..... e.g. you're expected to know that `TCR` is TCL Command Reference, `UG` is User Guide. Obvious right?

<https://community.cadence.com> is an open blog, with links to internal sources. Lol.

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

Run `tcl` synthesis script:

    genus -files a.tcl

After running the scripts, you can visualize the synthesis from inside genus with:

    gui_show

TODO: is that just a viewer, or can you edit anything in it?

## Innovus

Run script:

    innovus -files a.tcl

After you run scripts, open GUI to see:

    win
