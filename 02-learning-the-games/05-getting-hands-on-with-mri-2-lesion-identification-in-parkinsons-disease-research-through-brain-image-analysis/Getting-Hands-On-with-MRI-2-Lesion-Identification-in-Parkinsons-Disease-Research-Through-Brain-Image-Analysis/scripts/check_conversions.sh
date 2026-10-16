#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1
set -e

echo "Checking converted NIfTI outputs..."
echo
SUBJECTS="sub-PD01 sub-PD02 sub-PD03 sub-CON01 sub-CON02 sub-CON03"
MISSING=0

for SUBJECT in $SUBJECTS; do
  echo "$SUBJECT"
  if ls "converted_niftis/$SUBJECT/"*MPRAGE*.nii* >/dev/null 2>&1; then
    echo "  MPRAGE NIfTI found"
  else
    echo "  MPRAGE NIfTI missing"
    MISSING=$((MISSING + 1))
  fi
  if ls "converted_niftis/$SUBJECT/"*FLAIR*.nii* >/dev/null 2>&1; then
    echo "  FLAIR NIfTI found"
  else
    echo "  FLAIR NIfTI missing"
    MISSING=$((MISSING + 1))
  fi
done

echo
if ls converted_niftis/*_MPRAGE*.nii* converted_niftis/*_FLAIR*.nii* >/dev/null 2>&1; then
  echo "Warning: Some NIfTI files appear to be saved directly in converted_niftis."
  echo "Expected files should be inside subject folders, such as:"
  echo "  converted_niftis/sub-PD01/sub-PD01_MPRAGE.nii.gz"
  echo "If this happened, check the -o output folder in your dcm2niix command."
  MISSING=$((MISSING + 1))
fi

if [ "$MISSING" -ne 0 ]; then
  echo
  echo "Conversion check found $MISSING problem(s)."
  echo "Do not move to ITK-SNAP yet."
  echo "Read the dcm2niix logs in:"
  echo "  results/conversion_logs"
  exit 1
fi

echo "All expected MPRAGE and FLAIR NIfTI outputs were found."
