CC = g++
CFLAGS = -std=c++11 -c -g
OBJ = float_Addition.o
DEPS =
LIBS =
EXE = float_Addition

all: $(OBJ)
	$(CC) $(OBJ) -o $(EXE) $(LIBS)

%.o: %.cpp $(DEPS)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(OBJ) $(EXE)
