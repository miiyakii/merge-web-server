#!/bin/sh
# 用环境变量替换 index.html 中的 __API_URL__
API_URL=${API_URL:-http://localhost:5001}
# 替换 index.html 占位符
sed -i "s|__API_URL__|$API_URL|g" /app/index.html
exec python app.py
