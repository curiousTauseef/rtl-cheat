.POSIX:

-include params.makefile

CCC ?= iverilog -g2012
IN_EXT ?= _tb.v
OUT_EXT ?= .vvp
RUN ?= vvp

OUTS := $(addsuffix $(OUT_EXT), $(basename $(wildcard *$(IN_EXT))))

.PHONY: all clean run

all: $(OUTS)

%_tb$(OUT_EXT): %$(IN_EXT)
	$(CCC) -o '$@' '$<'

clean:
	git clean -Xdf

run-%: %_tb$(OUT_EXT)
	$(RUN) ./'$<'

run: all
	@\
	  fail=false;\
	  for t in *"$(OUT_EXT)"; do\
	    if ! $(RUN) ./"$$t"; then\
	      fail=true;\
	      break;\
	    fi;\
	  done;\
	  if $$fail; then\
	    echo "ERROR: $$t";\
	    exit 1;\
	  fi;\
