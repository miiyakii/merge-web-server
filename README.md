# merge-web-server — Docker usage

Build the Docker image:

```bash
docker build -t merge-web-server:latest .
```

Run the container (map port and provide the template file if not included in the image):

```bash
# If your template `证书名字.docx` is in the project root and you want to mount it:
docker run --rm -p 5001:5001 -v "$(pwd)/证书名字.docx:/app/证书名字.docx" merge-web-server:latest

# Or run without mounting (if the template is already present in the image):
docker run --rm -p 5001:5001 merge-web-server:latest
```

Health check:

```bash
curl http://localhost:5001/health
```

Notes:

- The app listens on port `5001` inside the container.
- Ensure the template `证书名字.docx` exists at the app root (`/app/证书名字.docx`).
- You can adjust the number of `gunicorn` workers in the `Dockerfile` or override the `CMD` when running.
