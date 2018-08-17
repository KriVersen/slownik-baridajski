LATEX = pdflatex
LINT = chktex

all: slownik.pdf

slownik.pdf: slownik.tex vocab.tex
	$(LATEX) $<

vocab.tex: generate.awk vocab_sorted.csv
	./generate.awk < vocab_sorted.csv > $@

vocab_sorted.csv: vocab.csv
	sort -t ";" -k 2,2 $< > $@

%.awk:
	chmod +x $@

check:
	$(LINT) slownik.tex

clean:
	rm *.pdf *.out *.log *.aux vocab.tex vocab_sorted.csv

.PHONY: all clean check generate.awk
