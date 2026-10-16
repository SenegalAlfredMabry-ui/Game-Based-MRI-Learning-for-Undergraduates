#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

mkdir -p results

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 was not found."
  echo "This script measures ITK-SNAP masks with scripts/measure_nifti_label1.py."
  echo "Install python3 or ask your instructor which Python setup to use."
  exit 1
fi

if [ ! -f scripts/measure_nifti_label1.py ]; then
  echo "Missing helper script: scripts/measure_nifti_label1.py"
  echo "Check that you are in the main Lesson 5 game folder."
  exit 1
fi

INITIALS="${1:-}"
if [ -z "$INITIALS" ]; then
  printf "Enter the initials used in your mask filenames, or press Enter to auto-detect: "
  read -r INITIALS
fi

OUT="results/lesion_voxel_counts.csv"
echo "subject,group,mask_file,label_1_voxels,label_1_volume_mm3,measurement_method,status" > "$OUT"

echo
echo "Measuring masks saved from ITK-SNAP..."

find_mask() {
  local SUBJECT="$1"
  local CANDIDATES=()
  local FILE
  if [ -n "$INITIALS" ]; then
    for FILE in "lesion_masks/lesion_ROI_${INITIALS}_${SUBJECT}.nii" "lesion_masks/lesion_ROI_${INITIALS}_${SUBJECT}.nii.gz"; do
      [ ! -f "$FILE" ] || CANDIDATES+=("$FILE")
    done
  else
    for FILE in lesion_masks/*"${SUBJECT}".nii lesion_masks/*"${SUBJECT}".nii.gz; do
      [ ! -f "$FILE" ] || CANDIDATES+=("$FILE")
    done
  fi
  if [ "${#CANDIDATES[@]}" -gt 1 ]; then
    echo AMBIGUOUS
  elif [ "${#CANDIDATES[@]}" -eq 1 ]; then
    printf '%s\n' "${CANDIDATES[0]}"
  fi
}

while IFS=',' read -r SUBJECT GROUP; do
  if [ "$SUBJECT" = "subject" ] || [ -z "$SUBJECT" ]; then
    continue
  fi

  MASK=$(find_mask "$SUBJECT" || true)

  if [ "$MASK" = "AMBIGUOUS" ]; then
    echo "$SUBJECT,$GROUP,AMBIGUOUS,NA,NA,ambiguous_mask,choose_one_mask" >> "$OUT"
    echo "Multiple masks match $SUBJECT. Keep one mask or specify unique initials."
    continue
  fi

  if [ -z "$MASK" ]; then
    echo "$SUBJECT,$GROUP,MISSING,NA,NA,missing_mask,needs_mask" >> "$OUT"
    echo "Missing mask for $SUBJECT. Expected a NIfTI file in lesion_masks with $SUBJECT in the name."
    continue
  fi

  ERROR_FILE="results/${SUBJECT}_measurement_error.txt"
  MEASUREMENT=$(python3 scripts/measure_nifti_label1.py "$MASK" 2>"$ERROR_FILE" || true)

  if [ -z "$MEASUREMENT" ]; then
    ERROR_TEXT=$(tr ',' ';' < "$ERROR_FILE" | tr '\n' ' ')
    echo "$SUBJECT,$GROUP,$MASK,NA,NA,measurement_failed:${ERROR_TEXT},check_mask_file" >> "$OUT"
    echo "Could not measure $SUBJECT. Check that this is a NIfTI mask: $MASK"
    continue
  fi

  VOXELS=$(printf "%s" "$MEASUREMENT" | cut -d',' -f1)
  VOLUME=$(printf "%s" "$MEASUREMENT" | cut -d',' -f2)

  echo "$SUBJECT,$GROUP,$MASK,$VOXELS,$VOLUME,python_nifti_label1,ok" >> "$OUT"
  echo "Measured $SUBJECT: $VOXELS label-1 voxels"
done < subject_groups.csv

echo
echo "Measurement file written to:"
echo "  $OUT"
echo
echo "Important:"
echo "  A valid mask with no marked lesion voxels should measure as 0."
echo "  That is expected for a control subject if you did not mark anything."
echo
echo "Next:"
echo "  bash scripts/compare_groups.sh"
