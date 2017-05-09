#ifndef COMMON_H
#define COMMON_H

#include <cstdint>
#include <string>

#include "Vnegator.h"
#include "verilated_vcd_c.h"

template<class Vdut>
class TestCase {
    protected:
        Vdut *dut;
        std::string vcdPath;
        uint64_t clock;
        uint64_t time;
    public:
        TestCase(std::string vcdPath) {
            this->dut = new Vdut;
            this->vcdPath = vcdPath;
            this->clock = 0;
            this->time = 0;
        }
        ~TestCase() {
            this->dut->final();
            delete this->dut;
        }
        virtual void init() = 0;
        virtual void step(bool& finish, bool& fail) = 0;
        bool run() {
            bool finish, fail, ret;
            Verilated::traceEverOn(true);
            VerilatedVcdC *vcd = new VerilatedVcdC;
            this->dut->trace(vcd, 99);
            vcd->open(vcdPath.c_str());
            ret = true;
            this->init();
            do {
                fail = false;
                this->step(finish, fail);
                this->dut->eval();
                vcd->dump(this->time);
                this->time++;
                this->clock = !this->clock;
                if (fail) {
                    ret = false;
                    finish = true;
                }
            } while(!finish && !Verilated::gotFinish());
            vcd->dump(this->time);
            vcd->close();
            delete vcd;
            return ret;
        }
};

#endif
