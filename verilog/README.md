# Verilog

1.  [Getting started](getting-started.md)
1.  Theory
    1. [Standards](standards.md)
    1. [Vs VHDL](vs-vhdl.md)
    1.  Simulators
        1. [Verilator](verilator.md)
        1. [Icarus](icarus.md)
1.  Examples
    1. [Hello world](hello.v)
    1. [Negator](negator.v)
    1. [Counter](counter.v)
1.  [Bibliography](bibliography.md)

## Logic synthesis

- <http://www.clifford.at/yosys/>
- <http://opencircuitdesign.com/qflow/>

TODO output format?

## SystemVerilog

<https://en.wikipedia.org/wiki/SystemVerilog>

TODO vs Verilog?

Is also a: <https://en.wikipedia.org/wiki/Hardware_verification_language>

### DPI

C API.

<https://en.wikipedia.org/wiki/SystemVerilog_DPI>

## Reg vs wire

- <http://stackoverflow.com/questions/5360508/using-wire-or-reg-with-input-or-output-in-verilog>
- <http://stackoverflow.com/questions/33459048/what-is-the-difference-between-reg-and-wire-in-a-verilog-module>
- <http://electronics.stackexchange.com/questions/31624/what-is-the-difference-between-reg-and-wire-after-synthesizing>

## Operators

<https://en.wikipedia.org/wiki/Verilog#Operators>

Most interesting non-C-like: reduction operators, which do things like checking all bits of a vector are one, and output a single bit as result.

## Tri-state

IEEE 1364 defines a four state, 0, 1, X, Z.

Compare that to IEEE 1164's 7-state present in VHDL.
