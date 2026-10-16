#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

echo "Checking remote_laundromat/clean_laundry/..."
COUNT=$(find remote_laundromat/clean_laundry -maxdepth 1 -name '*_clean.png' | wc -l | tr -d ' ')
echo "$COUNT remote clean item(s) found."

if [ "$COUNT" -eq 0 ]; then
  echo "No remote clean outputs yet."
  echo "Try:"
  echo "  bash remote_laundromat/bin/remote_washer.sh"
fi
