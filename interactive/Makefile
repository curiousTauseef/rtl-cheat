.POSIX:

.PHONY: clean

RUN = main

all: ./obj_dir/Vmain ./obj_dir/Vmove display.out

./obj_dir/Vmain: main.v main.cpp fps.hpp
	verilator -Wall --cc main.v --exe main.cpp
	make -C obj_dir -f Vmain.mk Vmain LIBS='-lSDL2'

./obj_dir/Vmove: move.v move.cpp fps.hpp
	verilator -Wall --cc move.v --exe move.cpp
	make -C obj_dir -f Vmove.mk Vmove CXXFLAGS='--std=c++11 -Wall' LIBS='-lSDL2'

display.out: display.cpp
	g++ -o display.out display.cpp -lm -lSDL2

clean:
	rm -rf obj_dir *.out

run: all
	./obj_dir/V$(RUN)
