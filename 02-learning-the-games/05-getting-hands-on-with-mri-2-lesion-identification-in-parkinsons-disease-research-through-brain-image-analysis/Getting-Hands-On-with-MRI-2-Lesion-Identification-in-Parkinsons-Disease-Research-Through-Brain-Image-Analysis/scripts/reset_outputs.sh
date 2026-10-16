#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# reset_outputs.sh
# Clears generated files so students can replay the Getting Hands-On with MRI #2: Lesion Identification in Parkinson’s Disease Research Through Brain Image Analysis workflow.

echo "Cleaning Getting Hands-On with MRI #2: Lesion Identification in Parkinson’s Disease Research Through Brain Image Analysis generated outputs..."

find converted_niftis -type f ! -name '.gitkeep' -delete
find lesion_masks -type f ! -name 'README_SAVE_MASKS_HERE.txt' -delete
find results -type f ! -name '.gitkeep' -delete

echo "Outputs cleaned."
echo "The included raw DICOM files were not changed."
echo "Start again with:"
echo "  cat README.txt"
