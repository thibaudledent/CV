TYPST ?= typst
FONTDIR = assets/fonts

.PHONY: build watch ats clean

build:
	$(TYPST) compile main.typ cv.pdf --font-path $(FONTDIR)

watch:
	$(TYPST) watch main.typ cv.pdf --font-path $(FONTDIR)

ats:
	$(TYPST) compile main-ats.typ cv-ats.pdf --font-path $(FONTDIR)

clean:
	rm -f cv.pdf cv-ats.pdf
