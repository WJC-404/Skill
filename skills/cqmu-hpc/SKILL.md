---
name: cqmu-hpc
description: "Use when working with the Chongqing Medical University high-performance computing platform, including account access, Gridview, E-Shell, Slurm jobs, CPU/GPU resources, R/RStudio, VASP, file transfer, job arrays, or platform troubleshooting."
---

# CQMU HPC

Use this skill for the Chongqing Medical University (重医) supercomputing platform. It is a platform-use reference, not a credential, permission grant, or replacement for the latest live platform status.

## Operating contract

- Treat the supplied CQMU manuals as the local source of truth. Recheck live values when a queue, address, resource limit, software module, or account state may have changed.
- Distinguish the portal/Gridview layer, E-Shell or login nodes, allocated compute nodes, GPU resources, storage, and RStudio. Do not run long CPU/GPU work directly on a login node or the RStudio login-node service.
- Use Slurm for compute: inspect with `sinfo`, `squeue`, and `scontrol`; use `srun`, `salloc`, or `sbatch` only with an appropriate allocation.
- Before any remote write or externally visible action, show the exact command, target path, resource request, and impact, then obtain explicit user approval. This includes upload, download, file edits, environment changes, `sbatch`, `srun`, `salloc`, GPU requests, `scancel`, and data transfer.
- Never request, print, store, or transmit passwords, private keys, E-Shell key files, tokens, or sensitive research/patient data. Redact secrets from logs and summaries.
- Do not infer that a queue or partition is available merely because it appears in an example. Query current availability and account/QOS permission first.

## Route the request

| Request | Read only |
|---|---|
| Account, portal, recharge, Gridview, E-Shell, upload/download | [portal-gridview.md](references/portal-gridview.md) |
| `sinfo`, `squeue`, `scontrol`, `srun`, `salloc`, `sbatch`, arrays, monitoring | [slurm.md](references/slurm.md) |
| `module`, R/RStudio, VASP, GPU, Python or other workload setup | [workloads.md](references/workloads.md) |
| Safety, approvals, node boundaries, or source provenance | [safety-and-sources.md](references/safety-and-sources.md) |

## Default response shape

1. Classify the request as read-only inspection, local preparation, remote write, or job submission.
2. Identify the execution layer and the smallest suitable resource request.
3. Give exact Windows PowerShell, portal, or remote Linux commands with paths and placeholders clearly marked.
4. Pause for approval before the first remote mutation, allocation, submission, cancellation, or data movement.
5. After an approved operation, report the JobID or target path, command outcome, resource use, logs, and any next action.

## Common mistakes

- Treating `172.16.190.221` or the RStudio addresses as permanent authorization. They are values recorded in the supplied 2026 manual and must be rechecked when access fails.
- Running a large calculation inside RStudio or on a login node because the session is convenient.
- Submitting a copied example with an unverified partition, account, memory, time, or GPU count.
- Uploading raw or identifiable research data to an external service or exposing credentials while asking for troubleshooting.
