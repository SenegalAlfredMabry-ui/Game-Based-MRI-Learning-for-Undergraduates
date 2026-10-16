#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1
IN="results/lesion_voxel_counts.csv"
OUT="results/group_comparison.txt"

if [ ! -f "$IN" ]; then
  echo "Could not find $IN"
  echo "Run:"
  echo "  bash scripts/measure_lesion_masks.sh"
  exit 1
fi

awk -F',' '
NR > 1 && $4 ~ /^[0-9]+$/ {
  group=$2
  vox=$4
  sum[group]+=vox
  n[group]+=1
}
END {
  print "Lesson 5 Group Comparison"
  print "================================"
  print ""

  if (n["PD"] > 0) {
    pd_avg=sum["PD"]/n["PD"]
    print "PD subjects measured: " n["PD"]
    print "PD average marked voxels: " pd_avg
  } else {
    print "PD subjects measured: 0"
    pd_avg="NA"
  }

  print ""

  if (n["Control"] > 0) {
    con_avg=sum["Control"]/n["Control"]
    print "Control subjects measured: " n["Control"]
    print "Control average marked voxels: " con_avg
  } else {
    print "Control subjects measured: 0"
    con_avg="NA"
  }

  print ""

  if (pd_avg != "NA" && con_avg != "NA") {
    if (pd_avg > con_avg) {
      print "In this teaching dataset, the PD group had more marked lesion-like hyperintensity voxels."
    } else if (con_avg > pd_avg) {
      print "In this teaching dataset, the control group had more marked lesion-like hyperintensity voxels."
    } else {
      print "In this teaching dataset, the two groups had the same average marked lesion-like hyperintensity voxels."
    }
  } else {
    print "Not enough numeric measurements to compare groups."
    print "Open results/lesion_voxel_counts.csv and check for MISSING, NA, or measurement_failed rows."
  }
}
' "$IN" > "$OUT"

cat "$OUT"
