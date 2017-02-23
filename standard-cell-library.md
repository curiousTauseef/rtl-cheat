# Standard cell library

<https://en.wikipedia.org/wiki/Standard_cell>

Set of basic functions pre-compiled to GDSII.

Then if you use that on the RTL, the synthesizer can use the block.

I suppose they also have pre-made masks for those.

<https://en.wikipedia.org/wiki/Full_custom> refers to a design which does not use a cell library.

The synthesis might optimize further by removing the barrier of cells, but it is likely to cost unfeasibly more. You'd also need a huge complex mask.

## Liberty file format

## Lib

Plain text!

Yosys can take a standard cell library file in `.lib` Liberty file format.

TODO find spec. Mentioned at: http://www.csee.umbc.edu/~cpatel2/links/641/slides/lect05_LIB.pdf

Contains the following information for each cell:

- delays. TODO: isn't that also contained in the `specify` directive: <http://verilog.renerta.com/source/vrg00044.htm>
- leakage
- cell area. TODO: 0.0 indicates unspecified?
- cell function: logical function they implement, in a one liner boolean expression

### Delay model

Comes in 2D tables lookup tables. TODO meaning of both dimensions?

- <http://vlsibasic.blogspot.co.uk/2014/07/library-timing-characteristics.html>

## LEF

TODO. Contains the actual cell geometry:

- width and height. Height is usually fixed to power rail height for all cells
- pin positions, and other non-understandable data
- information for each layer

Sources:

- <https://en.wikipedia.org/wiki/Library_Exchange_Format>

## Open source standard cell libraries

- <https://www.quora.com/Are-there-good-open-source-standard-cell-libraries-to-learn-IC-synthesis-with-EDA-tools>
- <http://www.vlsitechnology.org/html/libraries.html>

### Leaked libraries

These are probably unintentional leaks of libraries:

- <https://web.archive.org/web/20170212171106/http://www.utdallas.edu/~mxl095420/EE6306/Final%20project/artisan.v5.2/lib/slow.lib>

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

TODO name. I think it is what is meant by "supply rail" or "voltage rail".

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

## Net

Same as wire.

Not called wire, because it is more of a... net of wires!

## Names

Names are more or less the same across vendors.

Great 2001 Artisan manual: <http://www.utdallas.edu/~mxl095420/EE6306/Final%20project/tsmc18_component.pdf>

- XL suffix: Low Power
- DFF: D-type Flip Flop
- DFFHQ: high speed DFF. Why HQ? H for High speed, and Q is the output?
