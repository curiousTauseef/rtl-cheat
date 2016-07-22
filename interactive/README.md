# Interactive

Interactive Verilog Verilator demos, to:

- make Verilog more fun
- simulate simple interactive circuits in real time to test them out. This is only feasible for simple designs, as the cost of RTL simulation is prohibitive for more complex ones, specially in real time.

<http://stackoverflow.com/questions/38108243/is-it-possible-to-do-interactive-user-input-and-output-simulation-in-vhdl-or-ver>

Ubuntu 16.04:

    make run
    make run RUN=move

The more interesting application specific logic is delegated to Verilog, while timing and display can be handled by C++.

1. [main.cpp](main.cpp) [main.v](main.v)
1. [move.cpp](move.cpp) [move.v](move.v)
1. [display.cpp](display.cpp)
