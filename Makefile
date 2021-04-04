.PHONY: venv

venv: venv/Scripts/activate

venv/Scripts/activate:
	python -m virtualenv -p python3 venv

install-std-deps:
	pip install -U pip

install-local-deps: install-std-deps
	# update remote packages to local installation
	# used when doing local development
	pip install --force-reinstall --editable .
	pip install --force-reinstall --editable ${VP_TOOLS_SRC_PATH}/dcc-tools

install-remote-deps: install-std-deps
	# update local packages to remote address
	# used to prep install for package
	pip install --force-reinstall . 
	pip install --force-reinstall git+https://github.com/ahfx/dcc-tools.git
	pip freeze --exclude-editable > requirements.txt

install:
	pip install --install-option="--prefix=${VP_TOOLS_INST_PATH}" -r requirements.txt

clean-venv:
	rm -fr venv

clean: 
	rm -fr ${VP_TOOLS_INST_PATH}/unreal-tools