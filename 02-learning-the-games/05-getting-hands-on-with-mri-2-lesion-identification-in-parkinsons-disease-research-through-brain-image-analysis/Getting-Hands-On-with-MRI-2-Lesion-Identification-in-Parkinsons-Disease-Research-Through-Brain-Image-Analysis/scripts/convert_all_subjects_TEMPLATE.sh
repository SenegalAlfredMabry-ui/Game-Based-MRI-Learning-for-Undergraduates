#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1
set -e

# convert_all_subjects_TEMPLATE.sh
# Student task:
# Use nano to complete the TODO lines below.

# TODO 1:
# Add all six subjects between the quotes.
# Example:
# SUBJECTS="sub-PD01 sub-PD02 ..."
SUBJECTS=""

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
    if [ -f "$RAW_DIR/$SUBJECT/${SCAN}_DICOM.zip" ]; then
      echo
      echo "The ZIP is present. Run this first:"
      echo "  bash scripts/unpack_dicoms.sh"
    fi
    exit 1
  fi

  COUNT=$(count_dicoms "$INPUT_DIR")
  if [ "$COUNT" -ne "$EXPECTED" ]; then
    echo "Wrong number of ${SCAN} DICOM files for $SUBJECT."
    echo "  Found: $COUNT"
    echo "  Expected: $EXPECTED"
    echo
    echo "Run this again before converting:"
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
  echo "Input folder:"
  echo "  $INPUT_DIR"
  echo "Output folder:"
  echo "  $SUBJECT_OUT"

  dcm2niix -z y -b y -f "$PREFIX" -o "$SUBJECT_OUT" "$INPUT_DIR" > "$LOG_FILE" 2>&1 || {
    cat "$LOG_FILE"
    echo
    echo "dcm2niix failed for $SUBJECT $SCAN."
    echo "Read the log:"
    echo "  cat $LOG_FILE"
    exit 1
  }

  cat "$LOG_FILE"

  if grep -E "Error:|Unable to find any DICOM|Missing images|Problem reading ECAT7|Check sorted order|Interslice distance varies|Unable to rotate 3D volume" "$LOG_FILE" >/dev/null 2>&1; then
    echo
    echo "dcm2niix reported a problem for $SUBJECT $SCAN."
    echo "This usually means the script used the wrong input folder or the DICOMs were not unpacked cleanly."
    echo "Check that the command uses this exact input folder:"
    echo "  $INPUT_DIR"
    echo
    echo "Then rerun:"
    echo "  bash scripts/unpack_dicoms.sh"
    echo "  bash scripts/convert_all_subjects_TEMPLATE.sh"
    exit 1
  fi

  if [ ! -f "$SUBJECT_OUT/${PREFIX}.nii.gz" ] && [ ! -f "$SUBJECT_OUT/${PREFIX}.nii" ]; then
    echo
    echo "Conversion did not create the expected NIfTI file for $SUBJECT $SCAN."
    echo "Expected:"
    echo "  $SUBJECT_OUT/${PREFIX}.nii.gz"
    echo "or:"
    echo "  $SUBJECT_OUT/${PREFIX}.nii"
    echo
    echo "Read the log:"
    echo "  cat $LOG_FILE"
    exit 1
  fi

  if [ ! -f "$SUBJECT_OUT/${PREFIX}.json" ]; then
    echo
    echo "Conversion did not create the expected JSON sidecar for $SUBJECT $SCAN."
    echo "Expected:"
    echo "  $SUBJECT_OUT/${PREFIX}.json"
    echo
    echo "Read the log:"
    echo "  cat $LOG_FILE"
    exit 1
  fi

  echo "Finished $SUBJECT $SCAN"
}

if [ -z "$SUBJECTS" ]; then
  echo "SUBJECTS is empty."
  echo "Open this script in nano and add all six subjects before running it."
  echo
  echo "Example:"
  echo '  SUBJECTS="sub-PD01 sub-PD02 sub-PD03 sub-CON01 sub-CON02 sub-CON03"'
  exit 1
fi

if ! command -v dcm2niix >/dev/null 2>&1; then
  echo "dcm2niix was not found."
  echo "Install dcm2niix or load the module your instructor provides before converting."
  echo "Read:"
  echo "  cat SOFTWARE_SETUP.txt"
  exit 1
fi

for SUBJECT in $SUBJECTS; do

  echo
  echo "Subject: $SUBJECT"

  # TODO 2:
  # Convert this subject's MPRAGE.
  # Use the helper function above so the script checks the input folder and log.
  # Write the MPRAGE line below this comment:


  # TODO 3:
  # Convert this subject's FLAIR.
  # Write the FLAIR line below this comment:


done

echo
echo "All requested conversions finished and expected output files were found."
echo "Now check the outputs:"
echo "  bash scripts/check_conversions.sh"
