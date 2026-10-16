#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# fake_scp.sh
# This simulates copying files to a remote computer.
#
# Usage:
#   bash scripts/fake_scp.sh dirty_laundry/round4_remote_load remote_laundromat/incoming

if [ "$#" -ne 2 ]; then
  echo "Usage:"
  echo "  bash scripts/fake_scp.sh SOURCE_FOLDER DESTINATION_FOLDER"
  echo
  echo "Examples:"
  echo "  bash scripts/fake_scp.sh dirty_laundry/round4_remote_load remote_laundromat/incoming"
  echo "  bash scripts/fake_scp.sh dirty_laundry/round5_cluster_job remote_laundromat/incoming"
  exit 1
fi

SOURCE="$1"
DEST="$2"

if [ ! -d "$SOURCE" ]; then
  echo "Could not find source folder: $SOURCE"
  echo "Run pwd and ls to check where you are."
  exit 1
fi

mkdir -p "$DEST"

echo "Copying files from $SOURCE to $DEST..."

COUNT=0

for FILE in "$SOURCE"/*_dirty.png; do
  if [ -f "$FILE" ]; then
    cp "$FILE" "$DEST/"
    echo "Copied $(basename "$FILE")"
    COUNT=$((COUNT + 1))
  fi
done

echo "Done. Copied $COUNT item(s)."
