update-deps:
	pip-compile --upgrade --generate-hashes
	pip-compile --upgrade --generate-hashes --output-file ${ENV}-requirements.txt
	pip install --upgrade -r ${ENV}-requirements.txt

install:
	pip install --editable .

init:
	pip install pip-tools
	rm -rf .tox

update: init update-deps install

.PHONY: update-deps init update install