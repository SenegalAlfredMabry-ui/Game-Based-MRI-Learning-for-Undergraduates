#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1
echo "Checking Getting Hands-On with MRI #2: Lesion Identification in Parkinson’s Disease Research Through Brain Image Analysis folder structure..."
echo
for D in raw_dicoms converted_niftis lesion_masks scripts student_notes results; do
  if [ -d "$D" ]; then
    echo "Found folder: $D"
  else
    echo "Missing folder: $D"
  fi
done
echo
echo "Subjects:"
cat subject_groups.csv
echo
echo "DICOM ZIP check:"
for SUBJECT_DIR in raw_dicoms/sub-*; do
  [ -d "$SUBJECT_DIR" ] || continue
  SUBJECT=$(basename "$SUBJECT_DIR")
  for SCAN in MPRAGE_DICOM FLAIR_DICOM; do
    if [ -f "$SUBJECT_DIR/${SCAN}.zip" ]; then
      echo "Found ZIP: $SUBJECT/${SCAN}.zip"
    else
      echo "Missing ZIP: $SUBJECT/${SCAN}.zip"
    fi
  done
done
echo
echo "Command-line tool check:"
for TOOL in dcm2niix python3; do
  if command -v "$TOOL" >/dev/null 2>&1; then
    echo "Found command: $TOOL"
  else
    echo "Missing command: $TOOL"
  fi
done
echo
echo "ITK-SNAP check:"
echo "  Open ITK-SNAP as a regular app. It may not appear in command -v."
echo
echo "If the DICOM folders have not been unpacked yet, run:"
echo "  bash scripts/unpack_dicoms.sh"
