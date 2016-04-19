#FROM alpine:3.3
FROM index.alauda.cn/library/golang:latest

#RUN echo http://mirrors.ustc.edu.cn/alpine/v3.3/main/ >> /etc/apk/repositories

RUN GOPATH=/go go get github.com/xiaods/gotty && \
mv /go/bin/gotty /usr/local/bin/ && \
apt-get clean

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
EXPOSE 8080
