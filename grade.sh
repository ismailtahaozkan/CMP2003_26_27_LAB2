#!/usr/bin/env bash
# Runs each question's tests in isolation against the compiled ./lab2Test
# binary and prints a PASS/FAIL summary for partial-credit grading.
# Usage: make grade   (builds lab2Test first, then runs this script)

set -u

BIN="./lab2Test"
QUESTIONS=(q1 q2 q3 q4 q5)
POINTS_PER_Q=$((100 / ${#QUESTIONS[@]}))

if [[ ! -x "$BIN" ]]; then
    echo "error: $BIN not found — run 'make lab2Test' first" >&2
    exit 1
fi

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

total=0
echo "==================== LAB 2 — Per-question grading ===================="
for q in "${QUESTIONS[@]}"; do
    if "$BIN" "[$q]" > "$TMPDIR/lab2_${q}.log" 2>&1; then
        status="PASS"
        total=$((total + POINTS_PER_Q))
    else
        status="FAIL"
    fi
    printf "%-4s : %-4s (%s pts)\n" "$q" "$status" "$POINTS_PER_Q"
done
echo "-------------------------------------------------------------------"
echo "Total: ${total} / 100"
echo "======================================================================="
