#!/bin/bash
#SBATCH --job-name=R_array
#SBATCH --partition=cyhpc_1
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --time=01:00:00
#SBATCH --array=1-10%2
#SBATCH --output=logs/%x-%A_%a.out

# TEMPLATE ONLY. N=10 and concurrency 2 are examples, NOT approved quotas.
# Each array task should map to a row in a frozen task manifest.
set -euo pipefail
cd "$SLURM_SUBMIT_DIR"
export OMP_NUM_THREADS="${SLURM_CPUS_PER_TASK:-1}"
command -v Rscript || { echo 'Rscript missing in job environment' >&2; exit 127; }
Rscript --vanilla scripts/run_one.R "$SLURM_ARRAY_TASK_ID"
