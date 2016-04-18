#FROM alpine:3.3
FROM index.alauda.cn/library/debian:jessie

#RUN echo http://mirrors.ustc.edu.cn/alpine/v3.3/main/ >> /etc/apk/repositories
RUN echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib' >> /etc/apt/sources.list && \
echo 'deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib' >> /etc/apt/sources.list  && \
echo 'deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib' >> /etc/apt/sources.list


RUN  apt-get update && apt-get install -y \
git \
golang && \
mkdir -p /tmp/gotty && \
GOPATH=/tmp/gotty go get github.com/yudai/gotty && \
mv /tmp/gotty/bin/gotty /usr/local/bin/ && \
rm -rf /tmp/gotty && \
apt-get clean

#RUN apk add --update go git && \
#  mkdir -p /tmp/gotty && \
#  GOPATH=/tmp/gotty go get github.com/yudai/gotty && \
#  mv /tmp/gotty/bin/gotty /usr/local/bin/ && \
#  apk del go git && \
#  rm -rf /tmp/gotty /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
EXPOSE 8080
