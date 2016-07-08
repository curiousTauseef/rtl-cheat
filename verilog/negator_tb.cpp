#include "Vnegator_tb.h"
#include "verilated.h"
int main(int argc, char **argv, char **env) {
    Verilated::commandArgs(argc, argv);
    Vnegator_tb *top = new Vnegator_tb;
    while (!Verilated::gotFinish()) { top->eval(); }
    delete top;
}
