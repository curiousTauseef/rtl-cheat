#include <cassert>
#include <iostream>
#include <typeinfo>

#include "Vcounter.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vcounter *top = new Vcounter;

#if 0
    /* Rolled out prototype. */

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
#else
    /* VCD. */
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("counter.cpp.vcd");

    top->enable = 1;
    vluint64_t main_time = 0;
    enum {max_time = 10};
    while (main_time < max_time && !Verilated::gotFinish()) {
        /* Clock down. Nothing happens. */
        top->clock = 0;
        top->eval();
        tfp->dump(main_time);

        /* Clock up. Changes may happen. */
        if (main_time == 0)
            top->reset = 1;
        else
            top->reset = 0;
        top->clock = 1;
        top->eval();

        /* Assert changes that happened. */
        assert(top->out == main_time % 4);

        main_time++;
    }
#endif
    tfp->close();
    delete tfp;
    top->final();
    delete top;
}
