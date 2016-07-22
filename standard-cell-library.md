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
