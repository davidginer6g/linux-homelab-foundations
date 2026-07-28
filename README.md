# Linux Homelab Foundations

Este repositorio contiene la arquitectura, configuraciones y automatización de un entorno de administración de sistemas Linux orientado a producción.

## 🚀 Componentes del Proyecto

### 1. Seguridad y Hardening (SSH, UFW, Fail2ban)
- **SSH Hardening:** Autenticación obligatoria mediante llaves `ED25519`. Acceso root y contraseñas desactivados en `/etc/ssh/sshd_config`.
- **Firewall UFW:** Política por defecto `deny incoming` y `allow outgoing`. Puerto 22 (SSH) habilitado.
- **Fail2ban:** Monitorización activa de intentos de autenticación fallidos con bloqueo automático por IP.

### 2. Sistema de Backups y Automatización (Bash & Systemd)
- **Script Bash (`scripts/backup.sh`):** Empaqueta y comprime directorios de trabajo y dumps de bases de datos (`.tar.gz`), gestiona logs en `docs/backup.log` y realiza rotación de archivos antiguos (> 7 días).
- **Systemd Timer (`systemd/backup.timer`):** Sustituto moderno de Cron que ejecuta el servicio `backup.service` diariamente a las 00:00:00.

### 3. Base de Datos Relacional (PostgreSQL)
- Instancia activa con la base de datos `portfolio`.
- Definición de tablas, gestión de permisos para `devops_user` y respaldo lógico diario mediante `pg_dump`.

---

## 📂 Estructura del Repositorio

```text
.
├── docs/              # Guías de hardening, base de datos y registros
├── scripts/           # Scripts de automatización en Bash
├── systemd/           # Unidades .service y .timer para systemd
├── database/          # Esfuerzos y esquemas SQL
└── README.md          # Documentación general del proyecto
