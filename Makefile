SHELL = /bin/bash

.PHONY: all clean

all: dist/styles.css

clean:
	rm -rf dist node_modules

dist/styles.css: tailwind.css tailwind.js | node_modules
	npx tailwind build tailwind.css -c tailwind.js -o dist/styles.css

node_modules: .node-version package.json package-lock.json
	npm install

# https://stackoverflow.com/a/48496716/1596013
watch:
	@while true; do $(MAKE) -q || $(MAKE); sleep 0.5; done
