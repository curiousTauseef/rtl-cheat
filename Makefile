all:
	ghdl -a hello.vhdl
	ghdl -e hello_world
	ghdl -r hello_world
