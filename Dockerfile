FROM alpine:3.2

RUN echo http://mirrors.ustc.edu.cn/alpine/v3.2/main/ >> /etc/apk/repositories

RUN apk add --update go git && \
  mkdir -p /tmp/gotty && \
  GOPATH=/tmp/gotty go get github.com/yudai/gotty && \
  mv /tmp/gotty/bin/gotty /usr/local/bin/ && \
  apk del go git && \
  rm -rf /tmp/gotty /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
EXPOSE 8080
