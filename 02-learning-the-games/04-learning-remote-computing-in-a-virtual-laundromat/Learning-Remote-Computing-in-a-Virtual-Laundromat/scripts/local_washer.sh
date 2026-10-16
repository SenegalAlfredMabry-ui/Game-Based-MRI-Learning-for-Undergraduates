#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# local_washer.sh
# Cleans every *_dirty.png file inside washer/
# and creates matching *_clean.png files inside clean_laundry/.

echo "Starting the local washer..."

mkdir -p clean_laundry
mkdir -p washer/processed_dirty

COUNT=0

for DIRTY in washer/*_dirty.png; do
  if [ ! -f "$DIRTY" ]; then
    continue
  fi

  NAME=$(basename "$DIRTY" _dirty.png)
  TEMPLATE="clean_templates/${NAME}_clean.png"
  OUTPUT="clean_laundry/${NAME}_clean.png"

  if [ -f "$TEMPLATE" ]; then
    cp "$TEMPLATE" "$OUTPUT"
    mv "$DIRTY" washer/processed_dirty/
    echo "Cleaned ${NAME}"
    COUNT=$((COUNT + 1))
  else
    echo "No clean template found for ${NAME}"
  fi
done

if [ "$COUNT" -eq 0 ]; then
  echo "No dirty clothes found in washer/."
  echo "Move *_dirty.png files into washer/ first."
else
  echo "Done. Cleaned $COUNT item(s)."
fi
