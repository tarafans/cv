LATEX=pdflatex
LATEXMK=latexmk

MAIN=cv
SOURCES=$(MAIN).tex Makefile c.bib j.bib plainyr.bst

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(SOURCES)
	$(LATEXMK) -pdf $(MAIN).tex

clean:
	$(LATEXMK) -C $(MAIN).tex
	rm -f $(MAIN).synctex.gz
	rm -rf *.fls $~ *.tmp *.bbl *.bak
