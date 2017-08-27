SHELL=C:/Windows/System32/cmd.exe
CC=em++
CFLAGS=-O3 -Wno-tautological-constant-out-of-range-compare
LDFLAGS=-O3 -s ALLOW_MEMORY_GROWTH=1 --llvm-lto 1 -s DISABLE_EXCEPTION_CATCHING=0 
INCLUDES=-I../source/rapidjson -I../include -I../source -I../source/bwapidata/include
SOURCES=$(wildcard ../source/*.cpp ../source/bwapidata/include/*.cpp) 
OBJECTS=$(SOURCES:.cpp=.o)

HTMLFLAGS=-s EXPORTED_FUNCTIONS="['_main', '_ResetExperiment']" --preload-file asset -s LEGACY_GL_EMULATION=1

all:scripts/BOSS.html

emscripten/BOSS.html:$(OBJECTS) Makefile
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS) $(HTMLFLAGS)

.cpp.o:
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	rm $(OBJECTS)
    