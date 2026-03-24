FROM node:alpine3.20

WORKDIR /tmp

COPY . .

RUN ls -l /tmp  # 调试命令，检查 index.js 是否复制到容器中

EXPOSE 3000/tcp

RUN apk update && apk upgrade && \
    apk add --no-cache openssl curl gcompat iproute2 coreutils && \
    apk add --no-cache bash && \
    chmod +x index.js && \
    npm install

CMD ["node", "index.js"]
