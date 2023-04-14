# System Monitor
FROM ubuntu:18.04
LABEL MAINTAINER="UTD" INFO="Kubernetes"

RUN apt-get update && apt-get install -y htop \
    libcap2-bin curl wget && \
    cd /tmp; wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz \
    && tar -xvzf gotty_linux_amd64.tar.gz; mv gotty /usr/local/bin/gotty

EXPOSE 8080

CMD [ "gotty", "-w", "bash" ]
