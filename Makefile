
SRC := main.tex
OUTPUT := main.pdf
BASENAME := cv-ricardo-erikson
TMP := aux log out
LANG := $(shell [ `git branch --show-current` = "main" ] && echo en || echo `git branch --show-current`)
TARGET = $(BASENAME)-$(LANG).pdf

show-lang:
	@echo $(TARGET)	

build-image:
	docker build -t ricardoerikson/cv:latest .

build: clean
	echo "building target pdf..."
	(cd src && \
		xelatex $(SRC))
	mkdir -p dist
	rm -f dist/$(TARGET)
	mv src/$(OUTPUT) dist/$(TARGET)
	$(MAKE) clean

clean:
	echo "cleaning temp files..."
	for ext in $(TMP); do \
		rm -f src/*.$$ext; \
	done

.PHONY: build build-image clean