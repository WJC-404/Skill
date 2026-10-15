# Slurm on the CQMU platform

The supplied slide deck names the common commands below. Examples are patterns only. Query current partitions, account/QOS, limits, and node state before submitting anything.

## Read-only inspection

```bash
sinfo
sinfo -N -o "%N %C %o %m %t"
squeue -u "$USER"
scontrol show job=JOBID
scontrol show node=NODENAME
```

Interpretation from the deck:

- `sinfo` shows partitions and node availability. In the custom format, `%N` is node name, `%C` is CPU allocation, `%o` is CPU frequency, `%m` is memory, and `%t` is state.
- `squeue` shows JobID, partition, name, user, state, runtime, node count, node list, and queue reason. `PD` means pending and `R` means running in the illustrated examples.
- `scontrol show` gives detailed job or node information.

## Choosing a submission mode

| Mode | Use when | Risk boundary |
|---|---|---|
| `srun` | A short command or approved interactive task needs an allocation immediately | It consumes allocated resources immediately |
| `salloc` | A user needs an interactive allocation for debugging or a bounded session | The allocation must be closed with `scancel`/exit when finished |
| `sbatch` | A reproducible batch script should run without an attached terminal | The script and resource request must be reviewed before submission |

An interactive shell such as `srun --pty /bin/bash` or `salloc` followed by access to the allocated node is allowed only within the scheduler allocation and only after the user approves the resource request. Do not SSH directly to a compute node to bypass Slurm.

## Batch-script pattern

```bash
#!/bin/bash
#SBATCH -J example
#SBATCH -p <verified-partition>
#SBATCH -n <verified-cpu-count>
#SBATCH --mem=<verified-memory>
#SBATCH -t <verified-time-limit>
#SBATCH -o logs/%j.out
#SBATCH -e logs/%j.err

module purge
# module load <verified-module>
<command-to-run>
```

The deck shows `sbatch script.slurm` and records the resulting JobID. Create the `logs` directory and verify every placeholder before submission. Do not copy the example GPU queue or `--gres=gpu:1` request without checking current authorization and availability.

## Arrays and monitoring

For independent data groups, the deck demonstrates an array such as `#SBATCH --array=0-2` and `$SLURM_ARRAY_TASK_ID`. Use a bounded concurrency limit when the platform supports it, and first run a small pilot. After approval, monitor with `squeue`, inspect with `scontrol`, and review completed jobs and resource usage in the portal or `sacct` if available.

Never cancel a job or alter a submitted script without explicit user approval. Record JobID, partition, requested resources, code version, input/output paths, and exit state.
