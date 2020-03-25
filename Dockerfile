FROM arm32v7/debian:jessie-slim

WORKDIR /home

ENV VERSION Release30

RUN apk --no-cache add wget \
    && cd /home \
    && wget -qO- https://github.com/pymumu/smartdns/releases/download/${VERSION}/smartdns-arm \
    && chmod +x smartdns-arm

ADD smartdns.conf /home/smartdns.conf
ADD start.sh /home/start.sh

EXPOSE 53

CMD ["/home/start.sh"]