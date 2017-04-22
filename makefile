.PHONY: docs

default:
	idris -p idrisscript -i src

deps:
	cd lib/IdrisScript;               \
	idris --install idrisscript.ipkg; \
	cd -;                             \

docs:
	rm -rf docs;            \
	idris --mkdoc xhr.ipkg; \
	mv xhr_doc docs

test:
	idris --checkpkg xhr.ipkg
