SHELL = /bin/bash

.PHONY: all clean

all: dist/styles.css

clean:
	rm -rf dist node_modules

dist/styles.css: tailwind.css tailwind.config.js | node_modules
	npx tailwind build tailwind.css -o dist/styles.css

node_modules: .node-version package.json package-lock.json
	npm install
	touch node_modules

# https://stackoverflow.com/a/48496716/1596013
watch:
	@while true; do $(MAKE) -q || $(MAKE); sleep 0.5; done
