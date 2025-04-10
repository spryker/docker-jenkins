#!/bin/bash

# Display previous image report
echo "📄 === Previous Image Report ==="
cat previous-image-report.txt

# Display current image report
echo ""
echo "📄 === Current Image Report ==="
cat current-image-report.txt

# Run diff and remove metadata lines
echo ""
echo "🔍 Running diff..."
{
  echo "📋 === Diff Output ==="
  diff -u previous-image-report.txt current-image-report.txt | grep -vE '^(---|\+\+\+|@@)'
} > diff-output.txt

cat diff-output.txt

# Export base64-encoded diff output (one line, no line breaks)
DIFF_OUTPUT=$(base64 -w 0 diff-output.txt)
echo "DIFF_OUTPUT=$DIFF_OUTPUT" >> "$GITHUB_ENV"
