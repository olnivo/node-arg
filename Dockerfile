FROM node:alpine3.20

WORKDIR /tmp

# 确保你把正确的文件复制到 /tmp 目录
COPY . /tmp/

# 调试命令，检查 index.js 是否复制到容器中
RUN ls -l /tmp  

EXPOSE 3000/tcp

RUN apk update && apk upgrade && \
    apk add --no-cache openssl curl gcompat iproute2 coreutils && \
    apk add --no-cache bash && \
    chmod +x /tmp/index.js && \
    npm install

# 确保 node 启动 index.js 文件
CMD ["node", "/tmp/index.js"]
