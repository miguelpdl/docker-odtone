# Build a container via the command "make build"

all:: build

build:
		git submodule update --init
		docker build --rm -t odtone/80221 .
