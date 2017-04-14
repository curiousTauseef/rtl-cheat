# About

Interactive Verilog Verilator demos, to:

- make Verilog more fun
- simulate simple interactive circuits in real time to test them out. This is only feasible for simple designs, as the cost of RTL simulation is prohibitive for more complex ones, specially in real time.

Inspiration: <http://stackoverflow.com/questions/38108243/is-it-possible-to-do-interactive-user-input-and-output-simulation-in-vhdl-or-ver>

The more interesting application specific logic is delegated to Verilog (e.g.: move game character on map), while boring timing and display matters can be handled by SDL and C++.

SDL-only example that explain the SDL part can be found at: <https://github.com/cirosantilli/cpp-cheat/tree/23013e7032556c6bc614b55d6cf66bedf4c9555e/sdl>
