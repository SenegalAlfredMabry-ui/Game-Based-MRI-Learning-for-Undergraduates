#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1
set -e

echo "Setting up Getting Hands-On with MRI #1: Converting DICOM to NIfTI DICOM folders..."

mkdir -p raw_dicoms/sub-001/MPRAGE_DICOM
mkdir -p raw_dicoms/sub-001/FLAIR_DICOM
mkdir -p tmp_unpack

if ! command -v unzip >/dev/null 2>&1; then
  echo "ERROR: unzip is not available on this computer."
  echo "Ask your instructor for help unzipping MPRAGE_DICOM.zip and FLAIR_DICOM.zip."
  exit 1
fi

echo "Unpacking MPRAGE_DICOM.zip..."
rm -rf tmp_unpack/MPRAGE
mkdir -p tmp_unpack/MPRAGE
unzip -q -o raw_dicoms_zipped/MPRAGE_DICOM.zip -d tmp_unpack/MPRAGE
find tmp_unpack/MPRAGE -type f -exec cp {} raw_dicoms/sub-001/MPRAGE_DICOM/ \;

echo "Unpacking FLAIR_DICOM.zip..."
rm -rf tmp_unpack/FLAIR
mkdir -p tmp_unpack/FLAIR
unzip -q -o raw_dicoms_zipped/FLAIR_DICOM.zip -d tmp_unpack/FLAIR
find tmp_unpack/FLAIR -type f -exec cp {} raw_dicoms/sub-001/FLAIR_DICOM/ \;

rm -rf tmp_unpack

mprage_count=$(find raw_dicoms/sub-001/MPRAGE_DICOM -type f | wc -l | tr -d ' ')
flair_count=$(find raw_dicoms/sub-001/FLAIR_DICOM -type f | wc -l | tr -d ' ')

echo "Done."
echo "MPRAGE DICOM files: $mprage_count"
echo "FLAIR DICOM files:  $flair_count"
echo ""
echo "Next: cat instructions/Part_1_Packages_MRIcron_GUI_Review.txt"
