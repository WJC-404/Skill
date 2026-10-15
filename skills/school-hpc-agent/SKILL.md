---
name: school-hpc-agent
description: Manage the user's school HPC from Windows Codex via SSH alias school-login and Slurm. Use for SSH setup/troubleshooting, remote read-only checks, sbatch/squeue/sacct, R/Python batch jobs, job arrays, safe resource planning, logs, and reproducible research runs. Never compute on admin/login nodes, and require explicit approval for remote writes or job submission.
---

# School HPC Agent (Windows + SSH + Slurm)

Operate the school HPC safely. This is **an instruction skill, not a credential or permission grant**. Do not assume Codex sandbox permits SSH. Keep the user's original SSH private key and passwords outside the agent context.

## Verified context (2026-10-15; recheck when needed)

- On Windows local PowerShell, `ssh -o BatchMode=yes school-login "hostname; whoami"` has returned `login1`, `wangjuncheng` without interaction.
- `school-login` → `172.16.190.230:22`, Linux user `wangjuncheng`; use this for **submission and status**.
- `school-hpc` → `172.16.190.221:22`, `admin2` **management node**; Slurm commands are absent, and **no research jobs must run there**.
- `login1` has `/opt/gridview/slurm/bin/sbatch`, `srun`, `sinfo`. The `cyhpc_1`, `debug`, `hpc_gpu`, `hpc_smp` and other partitions were seen in one historical `sinfo`, **not** permission grants or guaranteed availability.
- The user's Windows SSH config and local ssh-agent are set up. Never read/print the private key or passphrase. Windows OpenSSH binaries can be accessed at `C:\Windows\System32\OpenSSH\` if PATH is missing.

## Mandatory workflow

1. **Confirm execution environment.** Use a Windows local Codex session with approval enabled. If running in WSL, Codex cloud, or another sandbox, do not assume the Windows `.ssh/config` / ssh-agent is accessible. Do not silently bypass security settings.
2. **Read-only preflight first.** For remote `school-login`, run read-only commands: `hostname`, `whoami`, `command -v sbatch`, `squeue -u wangjuncheng`, optionally `sinfo`. Prefer `ssh -o BatchMode=yes school-login '...'` (PowerShell quoting must be checked). You may use `scripts/Test-HpcConnection.ps1` for a deterministic check.
3. **Classify actions before execution.** Pure status checks: may proceed under existing user/host permissions. Uploads, mkdir, script edits, environment installs, `sbatch`, GPU/CPU allocations, job arrays, file downloads, `scancel`, and deletion: **show exact target/path, commands, impact and request explicit user approval for each operational step**. Never preemptively submit a test job.
4. **Plan compute.** Before preparing a job, query Slurm partition, account/QOS, time, CPU, memory, GPU, and concurrency limitations. Determine which resources user is authorized to use; `idle` does not mean authorized. Do not guess counts from past screenshots.
5. **Submit only through scheduler.** Avoid direct R/Python execution on `admin2` **and** `login1`. Use `sbatch` on an approved submission node; scheduler runs the payload on allocated compute nodes. Do not directly SSH to `comput*`/`gpu*` to sidestep scheduler.
6. **Pilot, verify and track.** First smoke test/minimal pilot, check `squeue`, `sacct`, job stdout/stderr, elapsed time, memory, exit code. Then propose bounded job array concurrency and resources. Record project, code version, JobID, partition, inputs, outputs, and failure notes.
7. **Data security.** Do not upload raw patient data to external AI services, print sensitive remote file contents, store any key/credential in this KB, or copy restricted data out of the cluster without explicit approval and institutional authorization. Sanitize logs before summarizing.

## Relevant local resources

- `references/connection.md`: Windows SSH, key/agent, alias, admin2 vs login1, Codex environment diagnostics.
- `references/slurm.md`: partition checks, Slurm templates, smallest approved test, job monitoring and R simulation arrays.
- `references/safety.md`: action tiers, explicit approval and research data constraints.
- `references/troubleshoot.md`: actual prior errors and recovery.
- `scripts/Test-HpcConnection.ps1`: read-only Windows SSH/Slurm check.
- `assets/smoke_test.slurm`, `assets/r_cpu_template.slurm`, `assets/array_r_template.slurm`: **templates, not preapproved commands**. Review every resource and path before any `sbatch`.

## Sample user requests and response pattern

- “检查超算还能不能连”：run read-only local/SSH checks, report actual node and Slurm status, **do not submit**.
- “用超算跑 R 的 100 次模拟”：inspect code and requested inputs, ask/verify authorized resources and output path; propose exact `sbatch` plan plus bounded array and small pilot. Submit **only after user approval**.
- “帮我查作业进度”：query `squeue`/`sacct` with known job ID, report states; do not cancel/modify.
- “超算连不上”：locate failure among ssh executable / PATH / config.txt / agent / server auth / wrong host / sandbox / Slurm; avoid guessing passwords.

Respond with commands clearly marked `Windows PowerShell` vs `remote login1 bash` and state whether each is read-only, local write, remote write, or job submission.
