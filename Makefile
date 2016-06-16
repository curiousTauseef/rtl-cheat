CC := ghdl
CFLAGS := --std=93 --ieee=synopsys
IN_EXT ?= _tb.vhdl

test:
	set -e; \
	for f in *$(IN_EXT); do \
		prefix="$${f%$(IN_EXT)}"; \
		echo "#$${prefix}"; \
		if [ -r "$${prefix}.vhdl" ]; then \
			$(CC) -a $(CFLAGS) "$${prefix}.vhdl"; \
		fi; \
		$(CC) -a $(CFLAGS) "$$f"; \
		$(CC) -e $(CFLAGS) "$${prefix}_tb"; \
		$(CC) -r $(CFLAGS) "$${prefix}_tb" --assert-level=error --vcd="$${prefix}.vcd"; \
	done
