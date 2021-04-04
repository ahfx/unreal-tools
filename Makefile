.PHONY: venv

venv: venv/Scripts/activate

venv/Scripts/activate:
	python -m virtualenv -p python3 venv

install-local:
	# update remote packages to local installation
	pip install --editable .
	pip install --editable ${VP_TOOLS_PATH}/dcc-tools

install-remote:
	# update local packages to remote address
	pip install git+https://github.com/ahfx/dcc-tools.git -t ${VP_TOOLS_INST_PATH}/unreal-tools
	pip install . -t ${VP_TOOLS_INST_PATH}/unreal-tools

clean-venv:
	rm -fr venv

clean: 
	rm -fr ${VP_TOOLS_INST_PATH}/unreal-tools