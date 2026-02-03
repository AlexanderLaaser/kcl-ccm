# kcl-factory Makefile
# Install kcl-factory to /usr/local/bin (or PREFIX/bin)

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

.PHONY: install uninstall test help

install:
	install -d "$(BINDIR)"
	install -m 755 01_scripts/kcl-factory "$(BINDIR)/kcl-factory"

uninstall:
	rm -f "$(BINDIR)/kcl-factory"

test:
	./01_scripts/kcl-factory --manifest-root ./02_example/kcl --output-kustomize ./02_example/kcl --output-runtime-config ./02_example/crossplane --namespace default
	@echo "Generated files:"
	@ls -la 02_example/kcl/kustomization.yaml 02_example/crossplane/runtime-config.yaml

help:
	@echo "kcl-factory Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  make install   - Install kcl-factory to $(BINDIR)"
	@echo "  make uninstall - Remove kcl-factory from $(BINDIR)"
	@echo "  make test      - Run kcl-factory on 02_example/kcl"
	@echo "  make help      - Show this help"
