# 🚀 Lab Assignment 2 — Functions &amp; Arrays

Welcome to **Lab 2**!
This lab has **5 questions**. You will implement **5 functions** in a single file, `MainProgram.cpp`, so that the provided automated tests pass ✅.

All the other files are part of the testing & build system.
⚠️ **Do not edit any other files** — your grade depends on this!

---

## 📂 Project Structure

```text
.
├── README.md              # This file
├── Makefile               # Builds & runs tests (don't touch)
├── functions.hpp          # Function prototypes you must implement (don't touch)
├── catch_amalgamated.hpp  # Catch2 testing library (don't touch)
├── catch_amalgamated.cpp  # Catch2 testing library (don't touch)
├── test_lab2.cpp          # Automated tests (don't touch)
├── grade.sh               # Per-question grading script (don't touch)
└── MainProgram.cpp        # ← ✍️ YOU WRITE THIS FILE
```

---

## 🧑‍💻 Your Task

Complete the supplied starter file named:

```text
MainProgram.cpp
```

At the top, include the provided header:

```cpp
#include "functions.hpp"
```

Then implement the following **5 functions**, in order. Later questions build on the ideas (and sometimes the code) of earlier ones, so implement them in sequence.

### Q1 — `int sumArray(const int arr[], int n)`
Return the sum of the first `n` elements of `arr`. An empty array (`n == 0`) sums to `0`.

### Q2 — `int findMax(const int arr[], int n)`
Return the largest value among the first `n` elements of `arr`. You may assume `n >= 1`.

### Q3 — `void reverseArray(int arr[], int n)`
Reverse the first `n` elements of `arr` **in place** (no return value).

### Q4 — `bool isSorted(const int arr[], int n)`
Return `true` if the first `n` elements are sorted in non-decreasing (ascending, duplicates allowed) order, `false` otherwise. Arrays with 0 or 1 elements are always sorted.

### Q5 — `int countGreaterThanAverage(const int arr[], int n)`
Return how many of the first `n` elements are **strictly greater** than the average of all `n` elements.

* Compute the average using the sum from **Q1** (reuse `sumArray`!).
* Avoid floating point: to test `arr[i] > average`, compare `arr[i] * n > sum` instead of dividing.

---

## 🧪 How It Will Be Tested

* The tests are written using [Catch2](https://github.com/catchorg/Catch2).
* Each question has its own `TEST_CASE` in `test_lab2.cpp` with several checks (typical cases, edge cases, negative numbers, duplicates, etc.).
* Your functions are linked directly against the tests — the **exact signatures** in `functions.hpp` must match. Do not rename parameters' types or add default arguments.

### Build & run locally

```bash
make        # cleans, builds, and runs ALL tests
make test   # builds (if needed) and runs ALL tests
make clean  # removes build artifacts
```

A passing run prints something like:

```text
===============================================================================
All tests passed (21 assertions in 5 test cases)
```

If a test fails, Catch2 will show you exactly which `REQUIRE` failed, with the expected vs. actual value.

### Running / grading each question separately

Each question's `TEST_CASE` is tagged `[q1]` through `[q5]` in `test_lab2.cpp`, so you (or your instructor) can run — and grade — one question at a time, independent of the others:

```bash
make test-q1   # only Q1: sumArray
make test-q2   # only Q2: findMax
make test-q3   # only Q3: reverseArray
make test-q4   # only Q4: isSorted
make test-q5   # only Q5: countGreaterThanAverage
```

For a full per-question PASS/FAIL breakdown with a partial-credit score out of 100 (20 points per question), run:

```bash
make grade
```

This is what will be used to assign **partial credit**: you can pass some questions and fail others, and only the failing ones cost you points. A failure in a later question (e.g. Q5) never affects the score of an earlier one (e.g. Q1), even though Q5 reuses `sumArray` internally — each `make test-qN` run only evaluates that question's own `REQUIRE`s.

---

## ⚠️ Rules & Grading

* ✅ **Only edit `MainProgram.cpp`.**
* ❌ **Do not modify**: `Makefile`, `functions.hpp`, `test_lab2.cpp`, `grade.sh`, or any `catch_*.cpp/.hpp` files.
* 🔍 Your submission will be automatically tested.
  Changing other files can result in **zero points**.
* Partial credit is per test case — passing 3/5 questions earns credit for those 3.

---

<p align="center">
  <sub>
    🎓 <strong>Bahçeşehir University</strong> — CMP2003 Data Structures &amp; Algorithms (C++) · 2026–2027<br>
    Prepared by <strong>Ismail Taha Samed ÖZKAN</strong>
  </sub>
</p>


## Classroom50 grading

Q1–Q5 are graded separately, 20 points each, total 100. Each question is all-or-nothing across its checks; individual assertions do not earn fractional points.
The teacher's published copies of the header, Catch2 and tests are used for grading. Editing your local tests does not change those checks.
Only MainProgram.cpp is taken from your submission by the grader. Do not add main(). Keep unfinished function stubs so the translation unit compiles.
A syntax error anywhere in MainProgram.cpp prevents grading every question. Q5 may also fail if its call to sumArray uses an incorrect Q1 implementation.
These tests check results; they do not prove that Q5 reused sumArray or avoided floating point. Those source-code requirements may be reviewed separately.
