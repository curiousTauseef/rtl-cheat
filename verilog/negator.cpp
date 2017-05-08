#include <cassert>
#include <iostream>

#include "Vnegator.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vnegator *top = new Vnegator;

    /*
    Since this is a sequential circuit, we only need to test
    each input once, history does not matter.
    */
    {
        top->in = 0;
        top->eval();
        assert(top->out == 1);

        top->in = 1;
        top->eval();
        assert(top->out == 0);
    }

    /* VCD. */
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("negator.cpp.vcd");

    vluint64_t main_time = 0;
    top->in = 0;
    while (main_time < 10 && !Verilated::gotFinish()) {
        top->eval();
        tfp->dump(main_time);
        top->in = !top->in;
        main_time++;
    }
    tfp->close();
    delete tfp;
    top->final();
    delete top;
}
