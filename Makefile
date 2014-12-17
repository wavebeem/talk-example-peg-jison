all: parsers run

parsers:
	pegjs ini-pegjs.pegjs
	jison ini-jison.jison

watch:
	ls $(WATCH_FILES) | entr -c make parsers run

run:
	node test.js

.PHONY: parser watch run
