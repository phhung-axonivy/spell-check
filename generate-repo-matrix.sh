#!/bin/bash

# Assume you get REPOS as a newline-separated list (for example, as input or from a file)
REPO_LIST="${1:-repos.txt}"

# Read repo list (from file or variable)
if [ -f "$REPO_LIST" ]; then
  REPOS=$(cat "$REPO_LIST")
else
  REPOS="$REPO_LIST"
fi

# Convert NEWLINE separated to JSON array
MATRIX=$(echo "$REPOS" | jq -Rs 'split("\n")[:-1]')

# Output result to workflow output variable
echo "matrix=$MATRIX" >> $GITHUB_OUTPUT