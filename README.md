# merge-web-server — Docker usage

Build the Docker image:

```bash
docker build -t merge-web-server:latest .
```

Run the container (map port and provide the template file if not included in the image):

```bash
# 挂载证书模板并自定义后端 API 地址
# 例如后端地址为 http://192.168.1.100:5001

docker run --rm -p 5001:5001 \
  -v "$(pwd)/证书名字.docx:/app/证书名字.docx" \
  -e API_URL=http://192.168.1.100:5001 \
  merge-web-server:latest

# 或直接运行（API_URL 默认为 http://localhost:5001）
docker run --rm -p 5001:5001 merge-web-server:latest
```

使用 docker-compose:

```bash
docker compose up -d
```

Health check:

```bash
curl http://localhost:5001/health
```

Notes:

- 前端访问后端地址可通过 API_URL 环境变量指定。
- 容器内 app 监听 5001 端口。
- 证书模板需放在 /app/证书名字.docx。
- 可通过 docker-compose.yml 灵活配置挂载和环境变量。
