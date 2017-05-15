#include <bitset>
#include <cassert>
#include <cstdint>
#include <iostream>

#include "Vsubleq.h"
#include "verilated.h"

#include "common.hpp"

#define BITS 4

template<typename ADDRESS_TYPE, int ADDRESS_BITS, typename DATA_TYPE, int DATA_BITS>
class Ram {
    private:
        std::bitset<(1 << ADDRESS_BITS) * DATA_BITS> bits;

        /* http://stackoverflow.com/questions/17857596/how-to-convert-a-range-subset-of-bits-in-a-c-bitset-to-a-number?noredirect=1&lq=1
         * http://stackoverflow.com/questions/2177186/in-bitset-can-i-use-to-ulong-for-a-specific-range-of-bits */
        DATA_TYPE get(ADDRESS_TYPE address) {
            DATA_TYPE ret = 0;
            DATA_TYPE mask = 1;
            for (std::size_t i = 0; i < BITS; ++i) {
                if (this->bits[address + i])
                    ret |= mask;
                mask <<= 1;
            }
            return ret;
        }

        void set(ADDRESS_TYPE address, DATA_TYPE data) {
            DATA_TYPE ret = 0;
            DATA_TYPE mask = 1;
            for (std::size_t i = 0; i < BITS; ++i) {
                if (mask & data)
                    this->bits.set(address + i);
                mask <<= 1;
            }
        }

    public:

        void update(
            ADDRESS_TYPE &address,
            DATA_TYPE &data,
            bool write
        ) {
            if (write) {
                this->set(address, data);
            } else {
                data = this->get(address);
            }
        }
};

class SubleqTestCase : public TestCase<Vsubleq> {
    private:
        Ram<decltype(Vsubleq::address), BITS, decltype(Vsubleq::data), BITS> ram;
    public:
        SubleqTestCase() : TestCase("subleq.cpp.vcd") {}
        virtual bool check() {
            return true;
        }
        virtual void step(bool& finish) {
            if (this->time == 0) {
                this->dut->reset = 1;
            } else if (this->time == 2) {
                this->dut->reset = 0;
            }
            ram.update(
                this->dut->address,
                this->dut->data,
                write
            );
            this->dut->clock = this->clock;
            finish = (time == 60);
        }
};

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    assert(SubleqTestCase().run());
}
