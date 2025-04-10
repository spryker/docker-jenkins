#!/bin/bash

# Display previous image report
echo "📄 === Previous Image Report ==="
cat previous-image-report.txt

# Display current image report
echo ""
echo "📄 === Current Image Report ==="
cat current-image-report.txt

# Run diff and remove metadata lines (---, +++, @@) for cleaner output
echo ""
echo "🔍 Running diff..."
{
  echo "📋 === Diff Output ==="
  diff -u previous-image-report.txt current-image-report.txt | grep -vE '^(---|\+\+\+|@@)'
} > diff-output.txt

# Output the final diff
cat diff-output.txt

# Export diff output for later steps (like Slack notification)
DIFF_OUTPUT=$(cat diff-output.txt | base64)
echo "DIFF_OUTPUT=$DIFF_OUTPUT" >> $GITHUB_ENV
