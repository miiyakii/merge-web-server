# 使用官方 Python 3.14 运行环境作为基础镜像
FROM python:3.14-slim

# 设置工作目录
WORKDIR /app

# 复制项目文件到容器
COPY . /app

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 设置容器启动命令
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
