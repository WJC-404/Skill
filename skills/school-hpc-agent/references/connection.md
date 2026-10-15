# Windows → School HPC → Slurm connection

Current approved SSH aliases (in Windows `%USERPROFILE%\.ssh\config`):

```sshconfig
Host school-hpc
    HostName 172.16.190.221
    User wangjuncheng
    Port 22
    IdentityFile ~/.ssh/id_ed25519_hpc
    IdentitiesOnly yes

Host school-login
    HostName 172.16.190.230
    User wangjuncheng
    Port 22
    IdentityFile ~/.ssh/id_ed25519_hpc
    IdentitiesOnly yes
```

- `school-hpc` reaches `admin2` (management) without Slurm. **Do not run research there**.
- `school-login` reaches `login1` (Slurm submission). Computational payloads are run only via Slurm allocations.
- Confirm Windows local: `ssh -o BatchMode=yes school-login "hostname; whoami; command -v sbatch"`.
- If `ssh.exe` is missing on PATH, check `C:\Windows\System32\OpenSSH\ssh.exe` and use its full executable path; if `ssh-add` missing, similarly check `ssh-add.exe`.
- Windows `ssh-agent`: administrator `Set-Service ssh-agent -StartupType Automatic; Start-Service ssh-agent`; normal shell `& 'C:\Windows\System32\OpenSSH\ssh-add.exe' "$env:USERPROFILE\.ssh\id_ed25519_hpc"`. Key prompts refer to local private-key passphrase, not HPC password.
- The Windows SSH config filename MUST be `config`, not `config.txt`. Verify aliases with `ssh -G school-login`.
- Codex Windows Local sandbox may deny SSH, use different environment or require approval. Do not modify global permissions without user action.
- School may require VPN/campus network or MFA; obey its policy. Verify initial and changed server host fingerprints with official administration.
- Key registration: public `.pub` line is appended/registered in own authorized server account per school policy. Never inspect/copy/transmit private key via Codex.
