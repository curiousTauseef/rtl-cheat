# Genus

<https://www.cadence.com/content/cadence-www/global/en_US/home/tools/digital-design-and-signoff/synthesis/genus-synthesis-solution.html>

Synthesis.

Examples: just get the RAKs:

- "Genus Common user interface (UI) MMMC RAK(26 Oct 2016)", simple minimal example, no routing, reports contain PPA. I recommend using this one.
- "Genus Synthesis Solution:Genus RAK for Beginners with Legacy UI", this also contains Innovus commands, and so goes up to PnR.

Replaces RTL Compiler.

TCL shell (LOL TCL again, it rules the EDA industry):

    genus

List help commands:

    genus -h

Run `tcl` synthesis script:

    genus -f a.tcl

This leaves you in an interactive shell. To avoid that:

    genus -b -f a.tcl

After running the scripts, from the interactive shell, you can visualize the synthesis from inside genus with:

    gui_show

The GUI is the same as used by Innovus.

You can create new tabs with the `+` button, the most important tab at this point are:

-   the "Schematic" tab, which is what we have actually generated on the synthesis step
-   "Design browser" tab: a list of:
    - nets: wires
    - cells
    - terms: external inputs and outputs
    - modules: sub-modules, for which we can again see nets, cells and terms

TODO: GUI is just a viewer, or can you edit anything in it?

Generated `.cmd` files list every command that was run, including GUI commands, all of which have a text counterpart.

To restore the synthesis later, you can do either of:

    read_db design_phase.db

after a `write_db`.

Output is ready to go into Innovus with:

    write_design -innovus -gzip_files -basename mydesign

you just need to sourcing the `DESIGN.invs_setup.tcl` script.

## report

## generate_reports

`generate_reports` appears to do multiple `report XXX` at once:

Get PPA metrics:

    generate_reports -outdir out -tag phase

now directory `out` appears containing the following interesting files:

    phase_area.rpt
    phase_gates.rpt
    phase_qor.rpt
    phase_time.rp

`placed_qor.rpt` contains a high level overview of the implementation quality (Quality Of Results: <https://en.wikipedia.org/wiki/Quality_of_results>). Things like slack of most critical path and timing violation counts.

`phase_area.rpt` contains a list of the top N most critical paths, from most critical to least.

At the end of each path we can see how much time we have left there:

    Timing slack :     117ps

Other files contain things like cell count, total area of those cells and total leak in nW.

## Hack RAK for random project

This repo is sedding the RAK to adapt it to their own project: <https://github.com/ucb-bar/plsi/tree/20f371c2c4e8607aaa4365a39f3119f41d7cd7e9/src/addons/synthesis/genus>

Basically convert:

-   `set DESIGN` to your toplevel
-   `read_hdl` to your `.v` file list
-   remove extra pin mentions:
    - `DEF/dtmf.def` (TODO looks like output)
    - `Constraints/mmmc/dtmf_recvr_core_gate.sdc` (TODO looks like output)
    - `LEF/macro_lefs/pllclk.lef`
    - `LIB/macro_libs/pllclk_slow.lib`
    - TODO: which IO pins do I need in those or not? Not all IO pins of the original are there.
