#!/bin/bash
#SBATCH --job-name=codex_smoke
#SBATCH --partition=debug
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M
#SBATCH --time=00:02:00
#SBATCH --output=slurm-%j.out

# TEMPLATE ONLY. Confirm partition/account/QOS and gain user approval BEFORE sbatch.
set -euo pipefail
echo "JobID=${SLURM_JOB_ID:-unknown}"
echo "Compute host: $(hostname)"
date
sleep 3
echo "HPC smoke test OK"
