# Timing

Analysis of how fast the circuit can be clocked and still work properly.

Overlaps with power dissipation, which is the current limiting factor: if you turn the clock up too high, the circuit overheats and fails.

<https://en.wikipedia.org/wiki/Static_timing_analysis>

<https://en.wikipedia.org/wiki/Dynamic_timing_verification>

<http://web.stanford.edu/class/ee183/handouts_spr2003/lecture5_spring2003.pdf> mentions that the main delay factors are:

- Combinational logic delay
- Routing delay
- Clock skew and delay
- FF setup and hold time requirements

- <http://electronics.stackexchange.com/questions/203689/figuring-out-mininum-maximum-clock-frequency-vhdl>
- <http://stackoverflow.com/questions/27253045/finding-maximum-delay-through-fpga-design-from-a-vhdl-code-written-in-xilinx-sof>
- <http://stackoverflow.com/questions/17161162/verilog-timing-analysis-for-fixed-inputs>

## Delay

Fundamental analysis of how fast clock the circuit can operate under.

### SDF

<https://en.wikipedia.org/wiki/Standard_Delay_Format>

<http://www.asic-world.com/verilog/gate1.html> says a gate level representation is the most common case for an SDF simulation.
