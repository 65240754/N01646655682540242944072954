```bash
#!/bin/bash

# === CONFIGURACIÓN ===
REPO="/65240754/N01646655682540242944072954/"
GITHUB_TOKEN="tu_token_personal"
USER_AGENT="bot-subida"
ARCHIVO="/ruta/a/temporal/archivo_codificado.txt"
NOMBRE_ARCHIVO_EN_REPO="archivos/archivo_codificado_$(date +%s).txt"
COMMIT_MESSAGE="Auto subida de archivo codificado por bot"

# === CODIFICAR EN BASE64 (si aún no lo has hecho) ===
BASE64_CONTENT=$(base64 -w 0 "$ARCHIVO")

# === PREPARAR PAYLOAD ===
cat <<EOF > payload.json
{
  "message": "$COMMIT_MESSAGE",
  "content": "$BASE64_CONTENT"
}
EOF

# === EJECUTAR SUBIDA ===
curl -X PUT \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "User-Agent: $USER_AGENT" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO/contents/$N01646655682540242944072954 \
  -d @payload.json
exit
```
