# Security Hardening (UFW & Fail2ban)

## 1. Firewall (UFW)
Se ha configurado una política restrictiva para minimizar la superficie de ataque:
- **Tráfico Entrante:** Denegado por defecto (`deny incoming`).
- **Tráfico Saliente:** Permitido (`allow outgoing`).
- **Puerto SSH:** Abierto explícitamente (`allow ssh`).

Comprobación de estado:
\`\`\`bash
sudo ufw status verbose
\`\`\`

## 2. Prevención de Intrusiones (Fail2ban)
Fail2ban monitoriza los logs del sistema para detectar ataques de fuerza bruta (especialmente en el servicio SSH) y bloquea dinámicamente las IPs infractoras.
