#!/bin/bash

# ==============================================================================
# Script: backup.sh
# Descripción: Genera backups comprimidos (.tar.gz), gestiona logs y errores.
# ==============================================================================

set -euo pipefail

# Configuración de rutas
SOURCE_DIR="$HOME/Projects/linux-homelab-foundations"
TARGET_DIR="/var/backups/homelab"
DATE=$(date +'%Y-%m-%d_%H%M%S')
BACKUP_FILENAME="homelab_backup_${DATE}.tar.gz"
LOG_FILE="$HOME/Projects/linux-homelab-foundations/docs/backup.log"

# Asegurar que los directorios existen
sudo mkdir -p "$TARGET_DIR"
sudo chown -R $USER:$USER "$TARGET_DIR"

echo "[$(date +'%Y-%m-%d %H:%M:%S')] Starting backup execution..." | tee -a "$LOG_FILE"

# Crear el empaquetado comprimido
if tar -czf "${TARGET_DIR}/${BACKUP_FILENAME}" -C "$HOME/Projects" "linux-homelab-foundations" 2>> "$LOG_FILE"; then
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] SUCCESS: Backup created at ${TARGET_DIR}/${BACKUP_FILENAME}" | tee -a "$LOG_FILE"
else
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] ERROR: Backup process failed!" | tee -a "$LOG_FILE"
    exit 1
fi

# Rotación: Borrar backups con más de 7 días de antigüedad
find "$TARGET_DIR" -type f -name "homelab_backup_*.tar.gz" -mtime +7 -exec rm -f {} \;
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Rotation complete. Old backups cleaned." | tee -a "$LOG_FILE"
