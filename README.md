# VHDL Cheat

1.  Theory
    1.  [Introduction](introduction.md)
    1.  [Applications](applications.md)
    1.  [Synthesis](synthesis.md)
    1.  [History](language.md)
    1.  [Standards](standards.md)
    1.  [Wave files](wave-files.md)
    1.  [Language](language.md)
1.  [Simulators](simulators.md)
    1.  [GHDL](ghdl.md)
1.  Examples
    1.  Basic
        1.  [Hello world](hello_world_tb.vhdl)
        1.  [Min](min_tb.vhdl)
        1.  [assert](assert_tb.vhdl)
        1.  [write](write_tb.vhdl)
    1.  Lexer
        1.  [Comments](comments_tb.vhdl)
        1.  [Case insensitive](case_insensitive_tb.vhdl)
        1.  [Whitespace](whitespace_tb.vhdl)
        1.  [Literals](literals_tb.vhdl)
    1.  Flow control
        1.  [procedure](procedure_tb.vhdl)
        1.  [function](function_tb.vhdl)
    1.  [Operators](operators_tb.vhdl)
    1.  Types
        1.  [Integer types](integer_types_tb.vhdl)
        1.  [Array](array_tb.vhdl)
        1.  [record](record_tb.vhdl)
    1.  Packages
        1.  [standard package](standard_package_tb.vhdl)
        1.  [std_logic](std_logic_tb.vhdl)
    1.  [--stop-delta](stop_delta_tb.vhdl)
1.  Applications
    1.  Combinatoric
        1.  [Adder](adder.vhdl)
        1.  [sqrt8](sqrt8_tb.vhdl)
        1.  TODO multiplier
    1.  Sequential
        1.  [Clock](clock_tb.vhdl)
        1.  [Counter](counter.vhdl)
1.  Helpers
    1.  [Template](template_tb.vhdl)
1.  [Bibliography](bibliography.md)

## Behavioural vs structural modeling

Behavioural:

- a component is implemented as a black box using high level constructs
- only IO matters, not how it is generated
- the component does not need to be synthesizable (?)

Structural: opposite.
