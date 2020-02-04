CC=gcc
CFLAGS=-Wall -Wextra -std=c11 -Wpedantic -fopenmp

BARRIER_EXEC=barrier
BARRIER_SRC=omp_barrier.c
BARRIER_OBJ=$(BARRIER_SRC:%.c=%.o)

FOR_EXEC=for
FOR_SRC=omp_parallel_for.c
FOR_OBJ=$(FOR_SRC:%.c=%.o)

all: $(BARRIER_EXEC) $(FOR_EXEC)

$(BARRIER_EXEC): $(BARRIER_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

$(FOR_EXEC): $(FOR_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

clean:
	rm -f *.o
.PHONY: clean

veryclean: clean
	rm -f $(BARRIER_EXEC) $(FOR_EXEC)
.PHONY: veryclean
