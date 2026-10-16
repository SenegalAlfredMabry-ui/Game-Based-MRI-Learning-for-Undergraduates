#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# robot_move_to_washer.sh
# This script moves every *_dirty.png file from a folder into washer/.
#
# Usage:
#   bash scripts/robot_move_to_washer.sh dirty_laundry/round3_loop_challenge

if [ "$#" -ne 1 ]; then
  echo "Usage:"
  echo "  bash scripts/robot_move_to_washer.sh SOURCE_FOLDER"
  echo
  echo "Example:"
  echo "  bash scripts/robot_move_to_washer.sh dirty_laundry/round3_loop_challenge"
  exit 1
fi

SOURCE_FOLDER="$1"

if [ ! -d "$SOURCE_FOLDER" ]; then
  echo "Could not find source folder: $SOURCE_FOLDER"
  echo "Run pwd and ls to check where you are."
  exit 1
fi

mkdir -p washer

echo "Moving dirty files from $SOURCE_FOLDER into washer/..."

for FILE in "$SOURCE_FOLDER"/*_dirty.png; do
  if [ -f "$FILE" ]; then
    echo "Moving $(basename "$FILE")"
    mv "$FILE" washer/
  fi
done

echo "Done. Check washer/ with:"
echo "  ls washer"
