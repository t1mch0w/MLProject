.Phony:: all view 

all: pdf

ps: Template.tex 
	latex Template.tex
	bibtex Template
	latex Template.tex
	latex Template.tex
	dvips -q Template.dvi -o Template.ps
	ps2pdf Template.ps draft.pdf
	#dvips -h draft.pro Template.dvi -o draftTemplate.ps

pdf: Template.tex 
	pdflatex Template.tex
	bibtex Template
	pdflatex Template.tex
	pdflatex Template.tex
	#dvips -h draft.pro Template.dvi -o draftTemplate.ps

view:
	gv Template.ps &

pspdf:
	ps2pdf Template.ps 
	acroread Template.pdf &

clean:
	-rm -rf *~ *.bak Template.ps Template.pdf Template.out
	-rm -rf Template.aux Template.blg Template.bbl Template.dvi Template.log  
	-find . -name "*.bak" | xargs rm -rf

