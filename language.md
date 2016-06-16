# Language

## architecture

### stl

### behaviour

### test

TODO: fixed values or anything goes?

<http://electronics.stackexchange.com/questions/63682/difference-between-rtl-and-behavioral-verilog>

<http://electronics.stackexchange.com/questions/59372/vhdl-architecture-naming-and-interpretation#>

### process

`process`: says that things will be done sequentially.

## wait

Wait for some time.

If no arguments are given, stop the current simulation thread (e.g. `process`).

`ghdl` has the `--stop-time=10ns` option to limit simulation time.

<http://www.ics.uci.edu/~jmoorkan/vhdlref/waits.html>

## library ieee

TODO optional or mandatory?

## other

Sets all remaining bits of a vector to something.

If no bits have been set so far, set all bits to something.

<http://insights.sigasi.com/tech/to-downto-ranges-vhdl.html>

E.g.:

    signal cnt : unsigned(width-1 downto 0);
    cnt <= (others => '0');

## signal

A wire with a given voltage.

Somewhat like a variable in higher level languages.

Those are the things that can be output to wave files for further analysis.

## Operators

<http://www.csee.umbc.edu/portal/help/VHDL/operator.html>

`=`: comparison, not assignment

`<=`: assignment to signals, but not initialization:

    signal clk: std_logic := '0';
    clk <= not clk after 1 ns;

`:=`: assignment to `constant`, `generic`, initialization of signals

## Sequential vs concurrent

Concurrent: inside an `architecture begin`

Sequential: inside a `process`, procedure or function

## component

## entity

`component`: abstract interface

`entity`: implementation

<http://electronics.stackexchange.com/questions/16692/vhdl-component-vs-entity>

## work

Default library? <http://stackoverflow.com/questions/13414682/how-to-to-create-include-files-in-vhdl>

## Reuse entity on another file

- <http://stackoverflow.com/questions/26288447/using-entities-from-another-file-in-vhdl>
- <http://stackoverflow.com/questions/13414682/how-to-to-create-include-files-in-vhdl>

## Predefined types

VHDL 2008 5. Types:

Integer: `INTEGER`

Floating point: `REAL`. Implementation defined size.

Physical: `TIME`.

Enumeration types:

    CHARACTER, BIT, BOOLEAN, SEVERITY_LEVEL, FILE_OPEN_KIND, and FILE_OPEN_STATUS

Predefined array types

Array types:

    STRING, BOOLEAN_VECTOR, BIT_VECTOR, INTEGER_VECTOR,
    REAL_VECTOR, and TIME_VECTOR

Definitions:

    subtype POSITIVE is INTEGER range 1 to INTEGER'HIGH;
    type STRING is array (POSITIVE range <>) of CHARACTER;

    subtype NATURAL is INTEGER range 0 to INTEGER'HIGH;
    type BOOLEAN_VECTOR is array (NATURAL range <>) of BOOLEAN;
    type BIT_VECTOR is array (NATURAL range <>) of BIT;
    type INTEGER_VECTOR is array (NATURAL range <>) of INTEGER;
    type REAL_VECTOR is array (NATURAL range <>) of REAL;
    type TIME_VECTOR is array (NATURAL range <>) of TIME;

## Built-in variables

- `now`: current time

## Literals

- <http://vhdl.renerta.com/mobile/source/vhd00041.htm>

## Loops

Good intro: <http://www.ics.uci.edu/~jmoorkan/vhdlref/while.html>

## range

### to

### downto

Like Python `range()`.

`downto` is more common. TODO why?

## Standard library

### std_logic

Like `bit`, but has some extra values like `u` and `x`.

- <http://electronics.stackexchange.com/questions/51848/when-to-use-std-logic-over-bit-in-vhdl>
- <http://stackoverflow.com/questions/12504884/std-logic-in-vhdl>
- <http://www.thecodingforums.com/threads/what-are-weak-unknown-weak-zero-and-weak-1.23302/>

Values:

- `x`: two different values assigned to the same wire

#### Meta value

A value other than `'0'` and `'1'`, e.g. `'x'`.

### unsigned

### signed

Declare:

    signal cnt : unsigned(width-1 downto 0);

Convert `std_logic_vector` to it:

    data : in std_logic_vector(width-1 downto 0);
    signal cnt : unsigned(width-1 downto 0);
    cnt <= unsigned(data);
