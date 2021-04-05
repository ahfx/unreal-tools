.PHONY: env

env: env/Scripts/activate

env/Scripts/activate:
	python -m virtualenv -p python3 env

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
	pip install --target ${VP_TOOLS_INST_PATH}/unreal-tools/${VP_TOOLS_SITE_SUFFIX} -r requirements.txt

clean-env:
	rm -fr env

clean: 
	rm -fr ${VP_TOOLS_INST_PATH}/unreal-tools