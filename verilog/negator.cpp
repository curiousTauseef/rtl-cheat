#include <cassert>
#include <iostream>

#include "Vnegator.h"
#include "verilated.h"

int main(int argc, char **argv, char **env) {
    Verilated::commandArgs(argc, argv);
    Vnegator *top = new Vnegator;

    /*
    Since this is sequential, we only need to teach each input once,
    history does not matter.
    */
    {
        top->in = 0;
        top->eval();
        assert(top->out == 1);

        top->in = 1;
        top->eval();
        assert(top->out == 0);
    }

    /* Set a clock as input and print output. Just for fun. */
    vluint64_t main_time = 0;
    std::cout << "in out" << std::endl;
    top->in = 0;
    while (main_time < 10 && !Verilated::gotFinish()) {
        top->eval();
        if (top->in == 0)
            std::cout << '0';
        else
            std::cout << '1';
        std::cout << ' ';
        if (top->out == 0)
            std::cout << '0' << std::endl;
        else
            std::cout << '1' << std::endl;
        top->in = !top->in;
        main_time++;
    }

    top->final();
    delete top;
}
