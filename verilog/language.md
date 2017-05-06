# Language

Misc Verilog language topics.

## Reg vs wire

- <http://stackoverflow.com/questions/5360508/using-wire-or-reg-with-input-or-output-in-verilog>
- <http://stackoverflow.com/questions/33459048/what-is-the-difference-between-reg-and-wire-in-a-verilog-module>
- <http://electronics.stackexchange.com/questions/31624/what-is-the-difference-between-reg-and-wire-after-synthesizing>

### Net vs wire

<http://stackoverflow.com/questions/9975415/what-does-net-stand-for-in-verilog/38408675#38408675>

### logic vs reg

`logic` is the better SystemVerilog alternative to `reg`, as `reg` can be used for both sequential and combinatorial hardware.

## Operators

- <https://en.wikipedia.org/wiki/Verilog#Operators>
- <http://www.asic-world.com/verilog/operators2.html>

Most interesting non-C-like:

- reduction operators, which do things like checking all bits of a vector are one, and output a single bit as result
- concatenation <http://www.asic-world.com/verilog/operators2.html>. Forms l-values: `assign {co,sum} = a + b + ci;`.
- replication <http://www.asic-world.com/verilog/operators2.html>

## Tri-state

IEEE 1364 defines a four state, 0, 1, X, Z.

Compare that to IEEE 1164's 7-state present in VHDL.

## assign

Links wires, a.k.a combinatorial circuit.

- <https://www.quora.com/When-is-assign-statement-used-in-Verilog>
- <http://stackoverflow.com/questions/15597968/verilog-use-of-assign-and-always>

## Primitives

## Gate level modeling

## Switch level modelling

Explicitly defined subset defined in Verilog 2005 Chapter 7 "Gate- and switch-level modeling".

> There are 14 logic gates and 12 switches predefined in the Verilog HDL to provide the gate- and switch- level modeling facility. Modeling with logic gates and switches has the following advantages:

> - Gates provide a much closer one-to-one mapping between the actual circuit and the model.
> - There is no continuous assignment equivalent to the bidirectional transfer gate.

<http://www.asic-world.com/verilog/gate1.html#Introduction>

### Buffer

<https://www.cs.umd.edu/class/sum2003/cmsc311/Notes/CompOrg/tristate.html>

## Attributes

<http://covered.sourceforge.net/user/chapter.attr.html>

Yosys generates tons of them:

    (* src = "counter.v:15" *)
    wire [1:0] _00_;

## DPI

C API.

<https://en.wikipedia.org/wiki/SystemVerilog_DPI>
