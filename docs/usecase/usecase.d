# vim: ft=make
.PHONY: usecase._graphics
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,/usr/share/texmf-dist/tex/latex/base/report.cls)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/header.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/introduction.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/preamble.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/usecase1.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/usecase2.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/usecase3.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/usecase4.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/usecase5.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,sections/usecase6.tex)
usecase.aux usecase.aux.make usecase.d usecase.pdf: $(call path-norm,usecase.tex)
.SECONDEXPANSION:
usecase.bbl usecase.aux usecase.aux.make: $(call path-norm,./usecase.bib)
