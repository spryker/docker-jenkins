#!/bin/bash

# Only print the diff — the reports are already printed in the workflow steps
echo "🔍 Running diff..."
{
  echo "📋 === Diff Output ==="
  diff -u previous-image-report.txt current-image-report.txt | grep -vE '^(---|\+\+\+|@@)'
} > diff-output.txt

cat diff-output.txt

# Export base64-encoded diff output for further use (Slack etc.)
DIFF_OUTPUT=$(base64 -w 0 diff-output.txt)
echo "DIFF_OUTPUT=$DIFF_OUTPUT" >> "$GITHUB_ENV"
