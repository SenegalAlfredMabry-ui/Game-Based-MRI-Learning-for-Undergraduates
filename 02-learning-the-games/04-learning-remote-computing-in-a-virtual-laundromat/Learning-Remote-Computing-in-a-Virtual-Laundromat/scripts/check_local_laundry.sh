#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

echo "Checking local clean_laundry/..."
COUNT=$(find clean_laundry -maxdepth 1 -name '*_clean.png' | wc -l | tr -d ' ')
echo "$COUNT clean item(s) found."

if [ "$COUNT" -eq 0 ]; then
  echo "No clean outputs yet. Try running:"
  echo "  bash scripts/local_washer.sh"
fi
