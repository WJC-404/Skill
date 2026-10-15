# Codex Skills

本仓库保存个人使用的 Codex skills，当前包含两个超算相关 skill。

## Skills

### `school-hpc-agent`

用于通过 Windows Codex 管理学校超算环境，重点覆盖：

- Windows SSH、`school-login` 和 `school-hpc` 连接检查
- Slurm 状态查询、作业提交、作业监控和日志分析
- R/Python 批处理、作业数组、CPU/GPU 资源规划
- 登录节点、管理节点和计算节点的边界
- 远程写入、作业提交、文件传输和敏感数据的安全审批

调用示例：

```text
使用 $school-hpc-agent 检查 school-login 的 SSH 和 Slurm 状态。
```

### `cqmu-hpc`

用于重庆医科大学（重医）超算平台，重点覆盖：

- 重医超算账号申请、平台登录、充值和 Gridview
- E-Shell、文件管理和文件传输
- Slurm 的 `sinfo`、`squeue`、`scontrol`、`srun`、`salloc`、`sbatch`
- R、RStudio、Python、VASP、GPU 和作业数组
- 作业资源规划、运行监控和常见问题排查

调用示例：

```text
使用 $cqmu-hpc 先检查重医超算平台的只读状态。
```

## 安全原则

这两个 skill 只是操作指南，不提供账号权限或凭据。涉及以下操作时，必须先确认目标、命令、资源和影响，并取得用户明确同意：

- 远程文件上传、下载、创建、修改或删除
- 环境安装和配置修改
- `sbatch`、`srun`、`salloc`、GPU/CPU 资源申请
- `scancel`、数据转移和敏感研究数据操作

不得读取、打印或上传 SSH 私钥、密码、令牌或未经授权的敏感数据。队列、地址、软件版本和资源限制应以最新平台状态为准。

## 目录结构

```text
skills/
├── school-hpc-agent/
│   ├── SKILL.md
│   ├── agents/
│   ├── assets/
│   ├── references/
│   └── scripts/
└── cqmu-hpc/
    ├── SKILL.md
    ├── agents/
    └── references/
```

## 本地安装

将对应 skill 目录复制到 Codex 用户级目录：

```text
C:\Users\<用户名>\.codex\skills\school-hpc-agent
C:\Users\<用户名>\.codex\skills\cqmu-hpc
```

安装后可使用 `$school-hpc-agent` 或 `$cqmu-hpc` 调用。若 Codex 未立即刷新技能列表，请重启 Codex。
