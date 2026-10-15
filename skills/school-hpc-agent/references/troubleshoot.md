# Troubleshooting checklist, grounded in this user's previous setup

1. **PowerShell cannot find ssh:** check `Test-Path 'C:\Windows\System32\OpenSSH\ssh.exe'`, add that directory to PATH (no reinstall when present); restart terminals.
2. **PowerShell cannot find ssh-add:** use `& 'C:\Windows\System32\OpenSSH\ssh-add.exe' "$env:USERPROFILE\.ssh\id_ed25519_hpc"`.
3. **Agent stopped:** inspect `Get-Service ssh-agent`, authorized administrator starts it. `ssh-add -l` should show identity.
4. **Host alias unresolved:** file was initially `config.txt`; rename to exact `config`, inspect `ssh -G school-login`.
5. **`Permission denied` with passwords:** earlier attempted password on `.221` failed; registering public key in own Linux account fixed it. Confirm legitimate server and do not brute force passwords.
6. **Prompt for key passphrase:** normal when key isn't unlocked; load via local ssh-agent. `BatchMode=yes` must return without prompting.
7. **Connected to admin2, sbatch missing:** wrong node for compute submission; use school-login `.230` → login1.
8. **Codex fails but PowerShell succeeds:** likely sandbox/local-vs-WSL/cloud/env/PATH or approval difference; do not disable guardrails. Request only the needed approval or use user-controlled PowerShell.
9. **Host fingerprint changed:** stop, verify with school's admin; never blindly remove `known_hosts`.
10. **Job fails:** `sacct` exit code + log + partition/account/QOS/resource limits. Do not install Slurm on admin2.
