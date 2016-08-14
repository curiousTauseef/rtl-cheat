#include <cassert>
#include <iostream>

#include <typeinfo>

#include "Vcounter.h"
#include "verilated.h"

int main(int argc, char **argv, char **env) {
    Verilated::commandArgs(argc, argv);
    Vcounter *top = new Vcounter;

    /* Rolled out prototype. */
    /*
    top->enable = 1;

    top->reset = 1;
    top->clock = 0;
    top->eval();
    top->clock = 1;
    top->eval();
    assert(top->out == 0);

    top->reset = 0;

    top->clock = 0;
    top->eval();
    top->clock = 1;
    top->eval();
    assert(top->out == 1);

    top->clock = 0;
    top->eval();
    top->clock = 1;
    top->eval();
    assert(top->out == 2);
    */

    top->enable = 1;
    vluint64_t main_time = 0;
    enum Constexpr { max_time = 3 };
    while (main_time < max_time && !Verilated::gotFinish()) {
        /* Clock down. Nothing happens. */
        top->clock = 0;
        top->eval();

        /* Clock up. Changes may happen. */
        if (main_time == 0)
            top->reset = 1;
        else
            top->reset = 0;
        top->clock = 1;
        top->eval();

        /* Assert changes that happened. */
        assert(top->out == main_time);

        main_time++;
    }

    top->final();
    delete top;
}
