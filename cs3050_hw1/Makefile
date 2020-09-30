CC = g++
CFLAGS = -std=c++11 -c -g
OBJ = convert_float_to_bits.o
DEPS =
LIBS =
EXE = convert_float_to_bits 

all: $(OBJ)
	$(CC) $(OBJ) -o $(EXE) $(LIBS)

%.o: %.cpp $(DEPS)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(OBJ) $(EXE)
