# Slurm: inspect → pilot → submit → inspect → archive

## Read-only commands on `login1`

```bash
hostname; whoami; command -v sbatch
sinfo
sinfo -N -o '%N %P %C %m %G %t'
squeue -u "$USER"
```

School-specific account/QOS permissions may require administrator verification. `debug` was observed as an up partition with 1-hour max at one point in 2026-10, but may not be allowed for this account. The default `cyhpc_1` also does not imply any job size is authorized.

## Prepare for an approved smoke test

1. Agree with user on remote directory, partition/account, resource request, time, and expected file outputs.
2. Use `assets/smoke_test.slurm` as a starting point; customize partition based on **verified entitlement**. This template does not run on login1; `sbatch` schedules it to a compute node.
3. Confirm exact commands and obtain user approval before creating remote directory, `scp`, and `sbatch`.
4. Typical process: `ssh school-login 'mkdir -p ~/codex_hpc_test'` → `scp` reviewed file to destination → `ssh school-login 'cd ~/codex_hpc_test && sbatch smoke_test.slurm'`.
5. Record JobID from `sbatch`. Query `squeue -u wangjuncheng`, `sacct -j JOBID --format=JobID,State,ExitCode,Elapsed,MaxRSS` and small, non-sensitive stdout logs. Prefer `COMPLETED` + exit 0 over simple file existence.

## Research jobs

- `assets/r_cpu_template.slurm`: a single R batch job with explicit CPU/memory/time and logs. Confirm executable in compute environment; module/conda/R availability can differ from login1.
- `assets/array_r_template.slurm`: task array for independent R runs; set a bounded array concurrency `%K` based on permission. Ensure task ID maps unambiguously to parameters/seed. No infinite retries.
- For an R/Python project keep a task manifest, code revision, inputs, outputs, per-task seeds, log directory, and job IDs. Use a small pilot to estimate time/memory before scaling.
- `logs/` must exist **before** submission if output goes there.
- Threading of R/Python (e.g. OMP) must agree with requested CPUs. Requesting a resource does not guarantee quota entitlement.
- No big computations on `admin2` or `login1`. Do not use direct SSH to cluster compute hosts except per documented institutional policy.

## Common query output

- `squeue` may be empty when user has no queued/running jobs.
- `sacct` may only know finished jobs after a brief delay, or accounting may be restricted.
- `sinfo` reports *instantaneous* state, not future guarantees, not actual user entitlements.
