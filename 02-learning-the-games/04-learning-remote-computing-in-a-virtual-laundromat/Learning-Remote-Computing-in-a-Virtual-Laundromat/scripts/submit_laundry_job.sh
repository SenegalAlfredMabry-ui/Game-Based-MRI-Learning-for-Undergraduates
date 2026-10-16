#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# submit_laundry_job.sh
# This simulates submitting a batch job to a cluster.

mkdir -p remote_laundromat/logs
mkdir -p remote_laundromat/jobs

JOB_ID=$(date +%Y%m%d_%H%M%S)
JOB_FILE="remote_laundromat/jobs/laundry_job_${JOB_ID}.sh"
LOG_FILE="remote_laundromat/logs/laundry_job_${JOB_ID}.log"

cat > "$JOB_FILE" <<'JOB'
#!/usr/bin/env bash
bash remote_laundromat/bin/remote_washer.sh
JOB

echo "Submitted fake laundry cluster job: $JOB_ID"
echo "Job file: $JOB_FILE"
echo "Log file: $LOG_FILE"

{
  echo "Laundry cluster job started: $JOB_ID"
  date
  echo
  bash remote_laundromat/bin/remote_washer.sh
  echo
  echo "Laundry cluster job finished: $JOB_ID"
  date
} > "$LOG_FILE" 2>&1

cp "$LOG_FILE" remote_laundromat/logs/latest_job.log

echo "Job finished."
echo "Read the log:"
echo "  cat remote_laundromat/logs/latest_job.log"
