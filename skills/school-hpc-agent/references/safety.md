# Safety and approvals for the Agent

Use the least privilege needed. Operating principles:

- **No remote computation in the login or management node.** `admin2` management; `login1` submission only; compute payload through Slurm.
- **Read-only before changes.** Clearly label the proposed command and target. For `ssh/sinfo/squeue/sacct` small status checks, stay inside existing local shell approvals.
- **Explicit approval for state changes.** Do not upload, `mkdir`, overwrite, `sbatch`, `scancel`, `rm`, install packages, edit SSH config, modify permissions, or download research data before user reviews exact command and expected effect. A skill is not authorization.
- **Protect credentials.** SSH private key and passphrase remain in user-controlled Windows SSH/agent store. Do not open or print them, don't place in prompt/repository/zip, don't transmit to a remote server.
- **Protect sensitive data.** No off-cluster export of personal health/clinical/omics identifiers, raw datasets, or private logs without ethical, institutional and user authorization. Beware command/log output might include secrets.
- **School limits win.** Check quotas, partition/QOS privileges, VPN/MFA and account status; no bypass of security safeguards or direct unscheduled compute-node access.
- **Reproducibility.** Log script version, task manifest, resource allocation, JobID, real elapsed time and error cause. Stop and ask user when resources or permissions are unknown.
