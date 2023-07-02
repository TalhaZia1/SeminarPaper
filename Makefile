FILE = main
BUILD_DIR = build

all: $(BUILD_DIR)/$(FILE).pdf

$(BUILD_DIR)/$(FILE).pdf: $(FILE).tex $(BUILD_DIR)/$(FILE).bib | $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) $(FILE).tex
	bibtex $(BUILD_DIR)/$(FILE)
	pdflatex -output-directory=$(BUILD_DIR) $(FILE).tex
	pdflatex -output-directory=$(BUILD_DIR) $(FILE).tex

$(BUILD_DIR)/$(FILE).bib: references.bib | $(BUILD_DIR)
	cp references.bib $(BUILD_DIR)/$(FILE).bib

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

clean:
	rm -rf build

bib: $(BUILD_DIR)/$(FILE).bib
	bibtex $(BUILD_DIR)/$(FILE)
