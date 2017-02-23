# Memory model

Modern chips are memory bound. So they need caches. So designers need memory models.

SRAM is just a bunch of flip-flops, so can it be directly embedded into Verilog?

But I've also heard that because caches are so important and regular, they are highly optimized, and put into big rectangular chunks into the design. E.g.: <https://www.arm.com/products/physical-ip/embedded-memory-ip/index.php>

- <http://stackoverflow.com/questions/7630797/better-way-of-coding-a-ram-in-verilog>
- <http://electronics.stackexchange.com/questions/137704/ram-memory-modelling-in-verilog>
