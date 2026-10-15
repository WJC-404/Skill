# Modules and workload patterns

## Environment modules

The slide deck documents these module commands:

```bash
module avail
module load <verified-environment>
module list
module switch <old-environment> <new-environment>
module purge
```

Do not guess a module name or version. Inspect the live module tree and record the module list in the job log.

## R and Python

Use `Rscript` to invoke an R file from a Slurm script. Put the resource request, module/environment loading, and `Rscript path/to/script.R` in the batch script. Treat Python scripts similarly: load a verified environment, pass parameters explicitly, and write logs to a job-specific directory.

## RStudio

The school slide deck records RStudio endpoints `172.16.190.230:8787` and `172.16.190.231:8787`, and warns that the service uses login-node resources. Use it for light interactive work and inspection only. Submit large data processing, long simulations, and CPU/GPU workloads through Slurm.

## VASP and parallel jobs

The deck notes that parallel VASP work requires the corresponding compiler and parallel library. Before preparing a script, verify the current VASP build, compiler/MPI modules, partition, CPU/GPU requirement, and account/QOS. Do not invent module names from the example.

## GPU workloads

GPU jobs require a verified GPU partition/queue and an explicit GPU resource request such as `--gres=gpu:<count>` only when the platform's current syntax and authorization have been confirmed. Inspect node state and requested versus actual usage after a pilot.

## Job arrays

Use `$SLURM_ARRAY_TASK_ID` to select one input or parameter row per task. Keep the array bounded, avoid shared output filenames, and run a minimal pilot before submitting a large array. The array range in the manual is an example, not a recommendation for every workload.
