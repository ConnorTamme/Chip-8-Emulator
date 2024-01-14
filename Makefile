SRC=./src
BIN=./bin
BD=./build
SDLH=./SDL3/include
SDLL=./SDL3/lib

all: mkdir ${BD}/test

mkdir:
	if [ ! -d "./bin" ]; then mkdir bin; fi
	if [ ! -d "./build" ]; then mkdir build; fi

${BIN}/test.o: ${SRC}/test.c ${SDLH}/SDL3/SDL.h
	gcc -fno-use-linker-plugin -c -o ${BIN}/test.o ${SRC}/test.c -I${SDLH}/

${BD}/test: ${BIN}/test.o
	gcc -fno-use-linker-plugin -o ${BD}/test ${BIN}/test.o -L${SDLL} -lSDL3

clean:
	rm -rf ./bin ./build
