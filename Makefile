LATEX = pdflatex

all: slownik.pdf

slownik.pdf: slownik.tex
	$(LATEX) $^

clean:
	rm *.pdf *.out *.log *.aux

.PHONY: all clean
