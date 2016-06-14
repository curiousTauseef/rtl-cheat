all:
	ghdl -a hello_world.vhdl
	ghdl -e hello_world
	ghdl -r hello_world
	ghdl -a adder.vhdl
	ghdl -a adder_tb.vhdl
	ghdl -e adder_tb
	ghdl -r adder_tb --vcd=adder.vcd
	ghdl -a clock_tb.vhdl
	ghdl -e clock_tb
	ghdl -r clock_tb --stop-time=10ns --vcd=clock.vcd
