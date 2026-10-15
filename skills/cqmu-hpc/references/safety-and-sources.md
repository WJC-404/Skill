# Safety, provenance, and current-state checks

## Action levels

| Level | Examples | Default |
|---|---|---|
| Read-only | `hostname`, `whoami`, `sinfo`, `squeue`, `scontrol`, portal status viewing | May proceed when the environment and target are clear |
| Local preparation | Drafting a Slurm script, reviewing a local file, preparing a command | May proceed; show the resulting path and contents |
| Remote or external mutation | Upload/download, mkdir, file edit, environment install, data transfer, account/recharge operation | Show exact target, command, and impact; get explicit approval |
| Resource operation | `srun`, `salloc`, `sbatch`, GPU/CPU allocation, `scancel` | Show resources and expected cost/impact; get explicit approval |

The platform manuals do not grant permissions. Codex sandbox, network, institutional policy, account, and data-governance rules still apply. Do not expose credentials or raw identifiable research data.

## Node boundaries

Treat the web portal and E-Shell/login layer as access and submission surfaces. Run substantive CPU/GPU work only on scheduler-allocated compute resources. A convenient terminal, RStudio session, or SSH connection is not a resource allocation by itself.

## Source map

- `D:\WIKI\超算使用说明\重医超算平台使用手册-学校模板.pptx`: slides 1-18 cover platform, account application, recharge, login, and overview; slides 19-33 cover web jobs, data management, E-Shell, Slurm inspection, and RStudio; slides 35-48 cover modules, `srun`, `salloc`, `sbatch`, arrays, R, VASP, and GPU usage.
- `D:\WIKI\超算使用说明\曙光Gridview集群综合管理系统V6.3_普通用户手册.pdf`: pages 11-19 cover registration, resource activation, file transfer, and the three job-submission modes; pages 21-34 cover E-File, E-Shell, job submission, and job management; pages 35-37 cover Linux desktop and data/asset functions; pages 84-91 cover billing, resource requests, account, password, and notification settings.

The local manuals were supplied on 2026-10-15. Addresses, queues, software versions, pricing, quotas, and UI labels can change. When a live query conflicts with this reference, report the conflict and prefer the verified current platform state.
