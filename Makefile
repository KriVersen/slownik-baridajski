LATEX = pdflatex
LINT = chktex

all: slownik.pdf

slownik.pdf: slownik.tex vocab.tex
	$(LATEX) $^

check:
	$(LINT) slownik.tex

vocab.tex: generate.awk vocab.csv
	sort -t ";" -k 2,2 vocab.csv | ./generate.awk > $@

%.awk:
	chmod +x $@

clean:
	rm *.pdf *.out *.log *.aux vocab.tex

.PHONY: all clean check generate.awk
