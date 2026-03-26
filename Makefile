FOLDERS := 1_intro 2_ibm 3_iqm 4_bluequbit 5_dwave 6_quantinuum 7_outro

.PHONY: all render clean $(FOLDERS)

all: render

render: $(FOLDERS)
	@echo "Done rendering"

$(FOLDERS):
	@if [ -d "$@" ]; then \
		echo "Module: $@"; \
		cd "$@" && uv run quarto render $@.qmd --log-level warn --output-dir ../docs; \
	fi

clean:
	@for dir in $(FOLDERS); do \
		if [ -d "$$dir/.venv" ]; then \
			rm -rf "$$dir/.venv"; \
		fi \
	done
	@echo "Done cleaning"