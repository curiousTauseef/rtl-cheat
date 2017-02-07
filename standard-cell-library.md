# Standard cell library

<https://en.wikipedia.org/wiki/Standard_cell>

Set of basic functions pre-compiled to GDSII.

Then if you use that on the RTL, the synthesizer can use the block.

I suppose they also have pre-made masks for those.

<https://en.wikipedia.org/wiki/Full_custom> refers to a design which does not use a cell library.

The synthesis might optimize further by removing the barrier of cells, but it is likely to cost unfeasibly more. You'd also need a huge complex mask.

## Liberty file format

Yosys can take a standard cell library file in `.lib` Liberty file format.

TODO find spec. Mentioned at: http://www.csee.umbc.edu/~cpatel2/links/641/slides/lect05_LIB.pdf

## Open source standard cell libraries

<http://www.vlsitechnology.org/html/libraries.html>

## Technology mapping

Mapping of the netlist cell libraries.

## Double width cells

## INVX2

TODO: what is the point of such cells?

## Constraints

### Fixed VCC and VDD

Every cell needs VCC and VDD, and so chips look globally like this:

    -----+-----------+----- VCC
         |           |
     +---+----+  +---+----+
     | cell 1 |  | cell 2 |
     +---+----+  +---+----+
         |           |
    -----+------+----+----- VDD
                |
            +---+----+
            | cell 3 |
            +---+----+
                |
    --------+---+---------- VCC
            |
        +---+----+
        | cell 4 |
        +---+----+
            |
    --------+-------------- VDD

So you have to design cells with that in mind.

Shown at: <https://www.youtube.com/watch?v=jZT4kcMQagI>

### Fixed height

You design cells in 2D. The height of each part is fixed. But widths vary, and you can control electrical properties with that.

TODO: how are simulations for cell libraries done?

## Tools

Create cell libraries:

- <https://www.youtube.com/watch?v=DPCu822wXPQ> Cadence tutorial - CMOS Inverter Layout
- <https://www.csee.umbc.edu/~tinoosh/cmpe641/slides/lect02_std_cells.pdf> shows tool set and formats

## SVT

## LVT

## HVT

## Vt

Vt is the threshold voltage: <https://en.wikipedia.org/wiki/Threshold_voltage>

<http://www.edaboard.com/thread101239.html>
