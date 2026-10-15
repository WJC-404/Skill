# CQMU portal, Gridview, and E-Shell

This reference is distilled from the supplied Chongqing Medical University slide deck and the Dawning Gridview 6.3 ordinary-user manual. Page/slide provenance is recorded in `safety-and-sources.md`.

## Account and portal

The school slide deck describes this path:

1. Open the Chongqing Medical University information portal.
2. Sign in with the staff/student account.
3. Open `服务中心 -> 信息中心 -> IT服务 -> 超算中心账号申请`.
4. Submit the application and wait for approval.
5. After approval, inspect the initiated request under `事务中心 -> 发起 -> 进行中` and obtain the platform account details from the approved request.

The platform slide deck records the login address as `172.16.190.221`. Treat this as a documented value, not a permanent guarantee. Do not ask the user to paste a password into chat.

Recharge is described as going through the school's large-instrument sharing platform. Confirm the current recharge route and account before taking any financial or account action.

## Gridview workflow

The Gridview manual describes this general order:

1. Sign in through the ordinary-user portal.
2. Apply for or activate computing resources before submitting a job.
3. Use `数据管理 -> 文件管理 (E-File)` to create folders and upload/download files.
4. Submit through a template, graphical form, or command line.
5. Inspect current and historical jobs, logs, errors, working directory, and resource usage.

Gridview's E-Shell is a browser-based Linux terminal. The manual recommends Chrome and exposes Slurm commands and shortcuts. E-Shell Client can open a local terminal client; a downloaded key is documented as valid for 50 days, after which the user must obtain a fresh key through E-Shell. Never request the key contents.

## File transfer

Before upload or download, state the exact local and remote paths, data classification, size, and direction, then obtain approval. The manual distinguishes ordinary upload from the optional faster-transfer client. Files larger than 20 MB are specifically flagged in the Gridview manual as better suited to WinSCP for some task-upload fields, but current platform policy and user authorization take precedence.

## Job pages

Gridview exposes job submission and job management pages. The manual says the current-job list refreshes about every 30 seconds and supports searching by state, queue, job name, or JobID. Use the portal for status viewing, but use Slurm commands for precise diagnostics when authorized.
