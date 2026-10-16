#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1
set -e

SUBJECT="sub-001"
DICOM_ROOT="raw_dicoms/${SUBJECT}"
OUT_DIR="script_niftis"

mkdir -p "$OUT_DIR"

if ! command -v dcm2niix >/dev/null 2>&1; then
  echo "ERROR: dcm2niix was not found."
  echo "Try running: dcm2niix -h"
  echo "If that says 'command not found', ask your instructor for help."
  exit 1
fi

echo "Starting dcm2niix conversion for $SUBJECT..."

echo "Converting MPRAGE..."
dcm2niix -z y -b y -f "${SUBJECT}_MPRAGE" -o "$OUT_DIR" "$DICOM_ROOT/MPRAGE_DICOM"

echo "Converting FLAIR..."
dcm2niix -z y -b y -f "${SUBJECT}_FLAIR" -o "$OUT_DIR" "$DICOM_ROOT/FLAIR_DICOM"

echo "Done."
echo "Check your outputs with:"
echo "  ls script_niftis"
echo "  bash scripts/check_conversion.sh"
