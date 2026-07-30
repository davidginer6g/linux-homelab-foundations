# Linux Homelab Foundations

This repository contains the architecture, configurations, and automation of a production-oriented Linux system management environment.

## Project Components:

### Security and Hardening (SSH, UFW, Fail2ban)
- **SSH Hardening:** Mandatory key-based authentication using `ED25519`. Root access and passwords are disabled in `/etc/ssh/sshd_config`.
- **Firewall UFW:** Default policy `deny incoming` and `allow outgoing`. Port 22 (SSH) is enabled.
- **Fail2ban:** Active monitoring of failed authentication attempts with automatic IP blocking.

### Backup System and Automation (Bash & Systemd)
- **Backup Script (`scripts/backup.sh`):** Packs and compresses working directories and database dumps (`.tar.gz`), manages logs in `docs/backup.log`, and performs file rotation for old files (> 7 days).
- **Systemd Timer (`systemd/backup.timer`):** Modern alternative to Cron that executes the `backup.service` daily at 00:00:00.

### Relational Database (PostgreSQL)
- Active database instance with the `portfolio` database.
- Table definitions, permission management for `devops_user`, and logical backup daily via `pg_dump`.

---

## Repository Structure

```text
.
├── docs/              # Hardening guides, database documentation, and logs
├── scripts/           # Bash automation scripts
├── systemd/           # .service and .timer units for systemd
├── database/          # Efforts and SQL schemas
└── README.md          # Project general documentation

```