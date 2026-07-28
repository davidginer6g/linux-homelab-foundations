# SSH Hardening Configuration

## Medidas de Seguridad Aplicadas
1. **Desactivación de Inicio de Sesión Root:** `PermitRootLogin no` para evitar ataques dirigidos al superusuario.
2. **Desactivación de Autenticación por Contraseña:** `PasswordAuthentication no` obligando al uso de llaves `ED25519`.
3. **Copia de Respaldos de Configuración:** Respaldo creado en `/etc/ssh/sshd_config.bak`.

## Verificación de Sintaxis
Para validar cambios de configuración sin romper el servicio:
\`\`\`bash
sudo sshd -t
sudo systemctl restart ssh
\`\`\`
