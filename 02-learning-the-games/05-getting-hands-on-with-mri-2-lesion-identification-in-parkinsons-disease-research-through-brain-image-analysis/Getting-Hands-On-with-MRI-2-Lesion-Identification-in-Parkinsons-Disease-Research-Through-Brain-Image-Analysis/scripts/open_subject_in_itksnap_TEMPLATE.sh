#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1
set -e

SUBJECT="$1"

if [ -z "$SUBJECT" ]; then
  echo "Usage: bash scripts/open_subject_in_itksnap_TEMPLATE.sh sub-PD01"
  echo "Example: bash scripts/open_subject_in_itksnap_TEMPLATE.sh sub-PD01"
  exit 1
fi

MPRAGE="converted_niftis/${SUBJECT}/${SUBJECT}_MPRAGE.nii.gz"
FLAIR="converted_niftis/${SUBJECT}/${SUBJECT}_FLAIR.nii.gz"

echo "Preparing $SUBJECT for ITK-SNAP..."

if [ ! -f "$MPRAGE" ]; then
  echo "Missing MPRAGE file:"
  echo "  $MPRAGE"
  echo "Go back to Part 2 and check your conversion output names."
  exit 1
fi

if [ ! -f "$FLAIR" ]; then
  echo "Missing FLAIR file:"
  echo "  $FLAIR"
  echo "Go back to Part 2 and check your conversion output names."
  exit 1
fi

echo
echo "Open ITK-SNAP from your Applications folder."
echo
echo "Use this FLAIR as the main image:"
echo "  $FLAIR"
echo
echo "Use this MPRAGE as the anatomical comparison image:"
echo "  $MPRAGE"
echo
echo "If your ITK-SNAP command-line launcher is available, you can try:"
echo "  itksnap -g \"$FLAIR\" -o \"$MPRAGE\""
echo

if command -v itksnap >/dev/null 2>&1; then
  echo "Terminal found an itksnap command. Opening the subject now..."
  itksnap -g "$FLAIR" -o "$MPRAGE" || true
else
  echo "Terminal did not find an itksnap command. That is okay."
  echo "Most students should open ITK-SNAP as a regular app and load the files manually."
fi
