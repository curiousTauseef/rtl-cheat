#include <iostream>

#include "Vnegator.h"
#include "verilated.h"

int main(int argc, char **argv, char **env) {
    Verilated::commandArgs(argc, argv);
    vluint64_t main_time = 0;
    Vnegator *top = new Vnegator;
    top->in = 0;
    std::cout << "in out" << std::endl;
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
