#!/bin/bash

# 1. Iniciar la pantalla virtual (Xvfb) en el display :99
export DISPLAY=:99
Xvfb :99 -screen 0 1280x900x24 &
sleep 2

# 2. Iniciar un gestor de ventanas ligero para que Chromium se vea correctamente
fluxbox &

# 3. Iniciar el servidor VNC (sin contraseña)
x11vnc -display :99 -nopw -forever -shared -bg

# 4. Iniciar noVNC (convierte VNC a WebSockets en el puerto 6080)
websockify --web /usr/share/novnc/ 6080 localhost:5900 &

# 5. Iniciar tu aplicación FastAPI (esto reemplaza el CMD de tu Dockerfile)
echo "Iniciando FastAPI..."
exec uvicorn api:app --host 0.0.0.0 --port 8000