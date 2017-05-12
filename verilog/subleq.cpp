#include <cassert>
#include <iostream>

#include "Vsubleq.h"
#include "verilated.h"

#include "common.hpp"

#define BITS 4
#define NVALS (1 << BITS)

class SubleqTestCase : public TestCase<Vsubleq> {
    private:
       uint8_t ram[NVALS];
    public:
        SubleqTestCase() : TestCase("subleq.cpp.vcd") {}
        virtual bool check() {
        }
        virtual void step(bool& finish) {
            if (this->time == 0) {
                this->dut->enable = 1;
                this->dut->reset = 1;
            } else if (this->time == 2) {
                this->dut->reset = 0;
            }
            if (this->dut->write) {
                ram[this->dut->address] = this->dut->data;
            } else {
                this->dut->data = ram[this->dut->address];
            }
            this->dut->clock = this->clock;
            finish = (time == 10);
        }
};

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    assert(SubleqTestCase().run());
}
