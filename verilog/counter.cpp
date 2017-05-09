#include <cassert>
#include <iostream>

#include "Vcounter.h"
#include "verilated.h"

#include "common.hpp"

class CounterTestCase : public TestCase<Vcounter> {
    public:
        CounterTestCase() : TestCase("counter.cpp.vcd") {}
        virtual void init() {
            this->dut->reset = 1;
            this->dut->enable = 1;
        }
        virtual void step(bool& finish, bool& fail) {
            this->dut->reset = 0;
            this->dut->clock = this->clock;
            if (this->dut->out == this->time % 4)
                fail = true;
            finish = (time == 10);
        }
};

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    /* Simple test. */
    {
        Vcounter *dut = new Vcounter;
        dut->enable = 1;

        dut->reset = 1;
        dut->clock = 0;
        dut->eval();
        dut->clock = 1;
        dut->eval();
        assert(dut->out == 0);

        dut->reset = 0;

        dut->clock = 0;
        dut->eval();
        dut->clock = 1;
        dut->eval();
        assert(dut->out == 1);

        dut->clock = 0;
        dut->eval();
        dut->clock = 1;
        dut->eval();
        assert(dut->out == 2);

        dut->final();
        delete dut;
    }

    assert(CounterTestCase().run());
}
