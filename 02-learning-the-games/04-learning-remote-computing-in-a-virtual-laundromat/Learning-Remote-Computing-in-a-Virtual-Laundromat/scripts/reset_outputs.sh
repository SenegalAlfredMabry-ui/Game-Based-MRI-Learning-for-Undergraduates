#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# reset_outputs.sh
# Cleans generated outputs. With --full, also restores the starting dirty files.

FULL_RESET="no"
if [ "${1:-}" = "--full" ]; then
  FULL_RESET="yes"
fi

echo "Cleaning output folders..."

rm -f washer/*_dirty.png
rm -f washer/processed_dirty/*_dirty.png
rm -f clean_laundry/*_clean.png
rm -f remote_laundromat/incoming/*_dirty.png
rm -f remote_laundromat/processed_dirty/*_dirty.png
rm -f remote_laundromat/clean_laundry/*_clean.png
rm -f remote_laundromat/logs/*.log
rm -f remote_laundromat/jobs/*.sh

if [ "$FULL_RESET" = "yes" ]; then
  if [ ! -d original_dirty_laundry ]; then
    echo "Could not find original_dirty_laundry."
    echo "For a full reset, unzip a fresh copy of the game."
    exit 1
  fi

  echo "Restoring original dirty laundry folders..."
  rm -rf dirty_laundry
  mkdir -p dirty_laundry
  cp -R original_dirty_laundry/. dirty_laundry/

  echo "Full reset complete."
  echo "Start again with:"
  echo "  cat README.txt"
else
  echo "Outputs cleaned."
  echo "Note: this did not restore dirty files moved out of dirty_laundry/."
  echo "For a full reset, run:"
  echo "  bash scripts/reset_outputs.sh --full"
fi
