.POSIX:

-include params.makefile

# Icarus.
ICARUS_CC ?= iverilog -g2012
ICARUS_IN_EXT ?= _tb.v
ICARUS_OUT_EXT ?= .vvp
ICARUS_OUTS := $(addsuffix $(ICARUS_OUT_EXT), $(basename $(wildcard *$(ICARUS_IN_EXT))))

# Verilator.
VERILATOR_IN_EXT ?= .cpp
VERILATOR_OUT_DIR ?= obj_dir/
VERILATOR_OUTS := $(addprefix $(VERILATOR_OUT_DIR)V, $(basename $(wildcard *$(VERILATOR_IN_EXT))))

.PHONY: all all-icarus all-verilator clean run run-icarus run-verilator

all: all-icarus all-verilator

all-icarus: $(ICARUS_OUTS)

all-verilator: $(VERILATOR_OUTS)

# Some _tb.v only test behavioral concepts, and don't have corresponding .v
# However, we sill want those that do have .v to recompile if the .v changes.
# http://stackoverflow.com/questions/8175653/marking-a-makefile-dependency-as-optional-or-otherwise-unimportant/43956926#43956926
.SECONDEXPANSION:
%_tb$(ICARUS_OUT_EXT): %$(ICARUS_IN_EXT) $$(wildcard $$*.v)
	$(ICARUS_CC) -o '$@' '$<'

# -f is mainly for -G parameters, which must be known at compile time and cannot be set from C:
# https://www.veripool.org/boards/2/topics/276-Verilator-Efficient-Usage-of-Verilog-Parameters
$(VERILATOR_OUT_DIR)V%: %$(VERILATOR_IN_EXT) %.v
	verilator -CFLAGS "-ggdb3 --std=c++11" --cc '$(basename $<)'.v --exe -f $(basename $<).params --trace '$<'
	make -C '$(VERILATOR_OUT_DIR)' -f V$(basename $<).mk -j"$$(($$(nproc) - 2))" V$(basename $<)

clean:
	git clean -Xdf

run: run-icarus run-verilator

run-icarus: $(ICARUS_OUTS)
	./run-many run-icarus-one $^

run-icarus-%: %_tb$(ICARUS_OUT_EXT)
	./run-icarus-one '$<'

run-verilator: $(VERILATOR_OUTS)
	./run-many run-verilator-one $^

run-verilator-%: $(VERILATOR_OUT_DIR)V%
	./run-verilator-one '$<'

# Cadence Incisive.
run-incisive-%: %$(ICARUS_IN_EXT)
	irun -access +rwc -sysv2009 -sv '$<'
