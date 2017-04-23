# Cadence

Major tools:

- Incisive
- Genus
- Allegro: PCB
- Virtuoso: Analog. Demo for cell library creation: <https://www.youtube.com/watch?v=DPCu822wXPQ>
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

### GPDK

Generic Process Design Kits.

Dummy cell libraries by cadence to learn their tools.

Does not represent any manufacturable silicon precisely, but the general concepts should be similar.

<https://wiki.cse.buffalo.edu/services/content/cadence-gpdk>

## Incisive

## ncsim

## ncverilog

## irun

`irun` is a more convenient front-end. `ncverilog` is deprecated for `irun`, which has basically the same options.

Logic simulator.

<https://en.wikipedia.org/wiki/NCSim>

<http://hdvacademy.blogspot.co.uk/2014/07/simulation-using-cadence-ncsimncverilog.html> teaches the usage of `ncverilog`.

<https://community.cadence.com/cadence_technology_forums/f/30/t/11942>

    irun counter_tb.v +nctimescale+1ns/1ns

where `counter_tb.v` includes `counter.v`.

TODO compile to ELF executable.

## Innovus

Run script:

    innovus -files a.tcl

After you run scripts, open GUI to see:

    win

### saveDesign

The save design command does two things:

- creates the design folder
- creates a minuscule Tcl script that uses `restoreDesign` and loads that folder, and gives it the `.enc` extension...

So to pick up from where you left, you can just source that:

    innovus -files my.enc

### restoreDesign

Restore design on the Innovus 1008 RAK:

    restoreDesign place.enc.dat dma_mac

where `dma_mac` is the name of the top-level element.

Those directories were created with `saveDesign`.

From the GUI:

-   File

-   Restore Design

-   Point to `.enc` file (next to the `.enc.dat` directory)

    I think this is just any Tcl script file to source.

TODO: does not look as nice as after running all the commands (can't see the cells properly?) Why? Did try to enable all layers on GUI manually.

GUI is also an editor, as it has an ECO menu. But you shouldn't do that often of course.

---

TODO: generate GDSII.

## Jasper

Formal verification.

Implements SystemVerilog Assertions (SVA), which are now part of the Verilog standard (which is *both* a hardware description *and* verification language): <https://en.wikipedia.org/wiki/SystemVerilog#Assertions>
