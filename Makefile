MAIN=cv

all: $(MAIN).pdf

$(MAIN).pdf: rev.tex
	pdflatex $(MAIN).tex
	bibtex conf.aux
	pdflatex $(MAIN).tex
	pdflatex $(MAIN).tex

rev.tex: FORCE
	@printf '\\gdef\\therev{%s}\n\\gdef\\thedate{%s}\n' \
	   "$(shell git rev-parse --short HEAD)"            \
	   "$(shell git log -1 --format='%ci' HEAD)" > $@

upload:
	scp $(MAIN).pdf slee3036@killerbee1.cc.gatech.edu:~/www/

clean:
	rm -f *.out *.log *.aux *.pdf *.bbl *.blg

.PHONY: clean FORCE

