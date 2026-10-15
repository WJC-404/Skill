[CmdletBinding()]
param(
    [string]$Alias = 'school-login'
)
$ErrorActionPreference = 'Stop'

$ssh = Join-Path $env:WINDIR 'System32\OpenSSH\ssh.exe'
if (-not (Test-Path -LiteralPath $ssh)) {
    $found = Get-Command 'ssh.exe' -ErrorAction SilentlyContinue
    if (-not $found) { throw 'OpenSSH ssh.exe not found. Check local Windows installation.' }
    $ssh = $found.Source
}
if ($Alias -notmatch '^[A-Za-z0-9._-]+$') { throw 'Unsafe SSH alias.' }

Write-Host "[READ-ONLY] Inspecting SSH alias: $Alias"
$commands = 'hostname; whoami; command -v sbatch; squeue -u "$USER"'
& $ssh -o BatchMode=yes -o ConnectTimeout=10 $Alias $commands
if ($LASTEXITCODE -ne 0) { throw "SSH read-only test failed (exit code $LASTEXITCODE)." }
Write-Host 'Read-only SSH test finished. This did NOT submit or modify any remote job.'
