.PHONY: all test test-q1 test-q2 test-q3 test-q4 test-q5 grade clean

all: clean test

lab2Test: test_lab2.o MainProgram.o catch_amalgamated.o
	g++ -Wall --std=c++17 test_lab2.o MainProgram.o catch_amalgamated.o -o lab2Test

test_lab2.o: test_lab2.cpp functions.hpp
	g++ -Wall --std=c++17 -c test_lab2.cpp -o test_lab2.o

MainProgram.o: MainProgram.cpp functions.hpp
	g++ -Wall --std=c++17 -c MainProgram.cpp -o MainProgram.o

# Compile Catch2 implementation (this TU provides Catch's symbols AND its main)
catch_amalgamated.o: catch_amalgamated.cpp
	g++ -Wall --std=c++17 -c catch_amalgamated.cpp -o catch_amalgamated.o

test: lab2Test
	./lab2Test

# Run a single question's test case in isolation, e.g. `make test-q1`.
# Each question is tagged [q1]..[q5] in test_lab2.cpp.
test-q1: lab2Test
	./lab2Test "[q1]"

test-q2: lab2Test
	./lab2Test "[q2]"

test-q3: lab2Test
	./lab2Test "[q3]"

test-q4: lab2Test
	./lab2Test "[q4]"

test-q5: lab2Test
	./lab2Test "[q5]"

# Print a per-question PASS/FAIL summary for partial-credit grading.
grade: lab2Test
	@bash grade.sh

clean:
	rm -f lab2Test *.o
