#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# unpack_dicoms.sh
# Unpacks each subject's MPRAGE_DICOM.zip and FLAIR_DICOM.zip into folders that
# dcm2niix can read.

set -e

RAW_DIR="raw_dicoms"

expected_count() {
  SCAN="$1"
  if [ "$SCAN" = "MPRAGE_DICOM" ]; then
    echo 200
  elif [ "$SCAN" = "FLAIR_DICOM" ]; then
    echo 44
  else
    echo "Unknown scan type: $SCAN" >&2
    exit 1
  fi
}

count_dicoms() {
  OUTDIR="$1"
  find "$OUTDIR" -type f -name "*.dcm" | wc -l | tr -d ' '
}

echo "Unpacking Getting Hands-On with MRI #2: Lesion Identification in Parkinson’s Disease Research Through Brain Image Analysis DICOM ZIP files..."
echo

if [ ! -d "$RAW_DIR" ]; then
  echo "Missing raw_dicoms folder. Run this script from the main game folder."
  exit 1
fi

for SUBJECT_DIR in "$RAW_DIR"/sub-*; do
  [ -d "$SUBJECT_DIR" ] || continue

  SUBJECT=$(basename "$SUBJECT_DIR")
  echo "$SUBJECT"

  for SCAN in MPRAGE_DICOM FLAIR_DICOM; do
    ZIPFILE="$SUBJECT_DIR/${SCAN}.zip"
    OUTDIR="$SUBJECT_DIR/$SCAN"
    EXPECTED=$(expected_count "$SCAN")

    if [ ! -f "$ZIPFILE" ]; then
      echo "  Missing $ZIPFILE"
      exit 1
    fi

    mkdir -p "$OUTDIR"

    if find "$OUTDIR" -type f -name "*.dcm" | grep -q .; then
      COUNT=$(count_dicoms "$OUTDIR")
      echo "  $SCAN already unpacked ($COUNT DICOM files)"
    else
      unzip -oq "$ZIPFILE" -d "$OUTDIR"
      COUNT=$(count_dicoms "$OUTDIR")
      echo "  unpacked $SCAN ($COUNT DICOM files)"
    fi

    if [ "$COUNT" -ne "$EXPECTED" ]; then
      echo "  Expected $EXPECTED DICOM files for $SCAN, but found $COUNT."
      echo "  The ZIP may not have unpacked correctly."
      echo "  Ask your instructor before converting this subject."
      exit 1
    fi
  done

  echo
done

echo "Done. The raw DICOM folders are ready for dcm2niix."
