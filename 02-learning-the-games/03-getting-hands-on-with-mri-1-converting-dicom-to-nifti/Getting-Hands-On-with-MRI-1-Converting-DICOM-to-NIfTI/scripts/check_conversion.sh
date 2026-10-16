#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

echo "Checking Getting Hands-On with MRI #1: Converting DICOM to NIfTI outputs..."
echo ""

if [ ! -d script_niftis ]; then
  echo "script_niftis folder is missing."
  echo "Create it with:"
  echo "  mkdir -p script_niftis"
  exit 1
fi

found_any="no"

check_pattern () {
  label="$1"
  pattern="$2"
  if compgen -G "$pattern" >/dev/null; then
    echo "Found $label output:"
    ls $pattern
    found_any="yes"
  else
    echo "Missing $label output matching: $pattern"
  fi
  echo ""
}

check_pattern "MPRAGE NIfTI" "script_niftis/*MPRAGE*.nii*"
check_pattern "MPRAGE JSON"  "script_niftis/*MPRAGE*.json"
check_pattern "FLAIR NIfTI"  "script_niftis/*FLAIR*.nii*"
check_pattern "FLAIR JSON"   "script_niftis/*FLAIR*.json"

if [ "$found_any" = "yes" ]; then
  echo "Some outputs were found. Review the list above."
else
  echo "No expected outputs were found yet."
  echo "Try Part 2 command-line conversion first:"
  echo "  bash scripts/convert_one_subject.sh"
fi
