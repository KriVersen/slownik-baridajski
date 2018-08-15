LATEX = pdflatex
LINT = chktex

all: slownik.pdf

slownik.pdf: slownik.tex
	$(LATEX) $^

clean:
	rm *.pdf *.out *.log *.aux

check:
	$(LINT) slownik.tex

.PHONY: all clean check
