#FROM alpine:3.3
FROM index.alauda.cn/library/golang:latest

#RUN echo http://mirrors.ustc.edu.cn/alpine/v3.3/main/ >> /etc/apk/repositories

RUN mkdir -p /tmp/gotty && \
GOPATH=/tmp/gotty go get github.com/xiaods/gotty.git && \
mv /tmp/gotty/bin/gotty /usr/local/bin/ && \
rm -rf /tmp/gotty && \
apt-get clean

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
EXPOSE 8080
