#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/../.." || exit 1

# remote_washer.sh
# Cleans every *_dirty.png file inside remote_laundromat/incoming/
# and creates matching *_clean.png files inside remote_laundromat/clean_laundry/.

echo "Starting the PI Laundromat remote washer..."

mkdir -p remote_laundromat/clean_laundry
mkdir -p remote_laundromat/processed_dirty

COUNT=0

for DIRTY in remote_laundromat/incoming/*_dirty.png; do
  if [ ! -f "$DIRTY" ]; then
    continue
  fi

  NAME=$(basename "$DIRTY" _dirty.png)
  TEMPLATE="clean_templates/${NAME}_clean.png"
  OUTPUT="remote_laundromat/clean_laundry/${NAME}_clean.png"

  if [ -f "$TEMPLATE" ]; then
    cp "$TEMPLATE" "$OUTPUT"
    mv "$DIRTY" remote_laundromat/processed_dirty/
    echo "Remote cleaned ${NAME}"
    COUNT=$((COUNT + 1))
  else
    echo "No clean template found for ${NAME}"
  fi
done

if [ "$COUNT" -eq 0 ]; then
  echo "No dirty clothes found in remote_laundromat/incoming/."
else
  echo "Done. Remote cleaned $COUNT item(s)."
fi
