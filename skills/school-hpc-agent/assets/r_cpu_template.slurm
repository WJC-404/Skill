#!/bin/bash
#SBATCH --job-name=R_study
#SBATCH --partition=cyhpc_1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=02:00:00
#SBATCH --output=logs/%x-%j.out

# TEMPLATE ONLY: check partition/access/resources, create logs/ before sbatch,
# and obtain user approval. Place your project R code in scripts/main.R.
set -euo pipefail
cd "$SLURM_SUBMIT_DIR"
export OMP_NUM_THREADS="${SLURM_CPUS_PER_TASK:-1}"
command -v Rscript || { echo 'Rscript missing in job environment' >&2; exit 127; }
Rscript --vanilla scripts/main.R
