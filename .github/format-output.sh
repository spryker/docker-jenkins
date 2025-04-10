#!/bin/bash

set -e

CURRENT_REPORT="current-image-report.txt"
PREVIOUS_REPORT="previous-image-report.txt"
DIFF_OUTPUT="diff-output.txt"

echo "=== Diff Between Jenkins Images ===" > "$DIFF_OUTPUT"
echo "" >> "$DIFF_OUTPUT"

if [ ! -f "$CURRENT_REPORT" ] || [ ! -f "$PREVIOUS_REPORT" ]; then
  echo "Missing report files." >> "$DIFF_OUTPUT"
else
  diff -u "$PREVIOUS_REPORT" "$CURRENT_REPORT" >> "$DIFF_OUTPUT" || true
fi

cat "$DIFF_OUTPUT"
echo "DIFF_OUTPUT=$(cat "$DIFF_OUTPUT" | base64 -w 0)" >> $GITHUB_ENV
