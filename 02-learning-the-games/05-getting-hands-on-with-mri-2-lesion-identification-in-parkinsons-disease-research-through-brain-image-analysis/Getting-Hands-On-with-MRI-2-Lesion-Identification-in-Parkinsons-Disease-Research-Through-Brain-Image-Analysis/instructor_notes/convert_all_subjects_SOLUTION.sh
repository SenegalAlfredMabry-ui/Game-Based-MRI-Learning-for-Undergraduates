#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1
set -e

SUBJECTS="sub-PD01 sub-PD02 sub-PD03 sub-CON01 sub-CON02 sub-CON03"

RAW_DIR="raw_dicoms"
OUT_DIR="converted_niftis"
LOG_DIR="results/conversion_logs"

expected_count() {
  SCAN="$1"
  if [ "$SCAN" = "MPRAGE" ]; then
    echo 200
  elif [ "$SCAN" = "FLAIR" ]; then
    echo 44
  else
    echo "Unknown scan type: $SCAN" >&2
    exit 1
  fi
}

count_dicoms() {
  INPUT_DIR="$1"
  find "$INPUT_DIR" -type f -name "*.dcm" | wc -l | tr -d ' '
}

check_scan_folder() {
  SUBJECT="$1"
  SCAN="$2"
  INPUT_DIR="$RAW_DIR/$SUBJECT/${SCAN}_DICOM"
  EXPECTED=$(expected_count "$SCAN")

  if [ ! -d "$INPUT_DIR" ]; then
    echo "Missing ${SCAN} DICOM folder:"
    echo "  $INPUT_DIR"
    echo "Run:"
    echo "  bash scripts/unpack_dicoms.sh"
    exit 1
  fi

  COUNT=$(count_dicoms "$INPUT_DIR")
  if [ "$COUNT" -ne "$EXPECTED" ]; then
    echo "Wrong number of ${SCAN} DICOM files for $SUBJECT."
    echo "  Found: $COUNT"
    echo "  Expected: $EXPECTED"
    echo "Run:"
    echo "  bash scripts/unpack_dicoms.sh"
    exit 1
  fi
}

convert_scan() {
  SUBJECT="$1"
  SCAN="$2"
  INPUT_DIR="$RAW_DIR/$SUBJECT/${SCAN}_DICOM"
  SUBJECT_OUT="$OUT_DIR/$SUBJECT"
  PREFIX="${SUBJECT}_${SCAN}"
  LOG_FILE="$LOG_DIR/${PREFIX}_dcm2niix.log"

  check_scan_folder "$SUBJECT" "$SCAN"
  mkdir -p "$SUBJECT_OUT" "$LOG_DIR"

  echo
  echo "Converting $SUBJECT $SCAN"
  dcm2niix -z y -b y -f "$PREFIX" -o "$SUBJECT_OUT" "$INPUT_DIR" > "$LOG_FILE" 2>&1 || {
    cat "$LOG_FILE"
    echo "dcm2niix failed for $SUBJECT $SCAN."
    exit 1
  }

  cat "$LOG_FILE"

  if grep -E "Error:|Unable to find any DICOM|Missing images|Problem reading ECAT7|Check sorted order|Interslice distance varies|Unable to rotate 3D volume" "$LOG_FILE" >/dev/null 2>&1; then
    echo
    echo "dcm2niix reported a problem for $SUBJECT $SCAN."
    echo "Check that the input folder is:"
    echo "  $INPUT_DIR"
    echo "Then rerun scripts/unpack_dicoms.sh before converting again."
    exit 1
  fi

  if [ ! -f "$SUBJECT_OUT/${PREFIX}.nii.gz" ] && [ ! -f "$SUBJECT_OUT/${PREFIX}.nii" ]; then
    echo "Missing expected NIfTI output for $SUBJECT $SCAN."
    exit 1
  fi

  if [ ! -f "$SUBJECT_OUT/${PREFIX}.json" ]; then
    echo "Missing expected JSON sidecar for $SUBJECT $SCAN."
    exit 1
  fi
}

if ! command -v dcm2niix >/dev/null 2>&1; then
  echo "dcm2niix was not found."
  echo "Install dcm2niix, load it as a module, or read SOFTWARE_SETUP.txt."
  exit 1
fi

for SUBJECT in $SUBJECTS; do
  convert_scan "$SUBJECT" "MPRAGE"
  convert_scan "$SUBJECT" "FLAIR"
done

echo
echo "All requested conversions finished and expected output files were found."
echo "Now check the outputs:"
echo "  bash scripts/check_conversions.sh"
