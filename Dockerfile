FROM arm32v7/debian:jessie-slim

WORKDIR /home

ENV VERSION Release30

RUN apt-get update && apt-get install -y wget && wget --no-check-certificate https://github.com/pymumu/smartdns/releases/download/${VERSION}/smartdns-arm

ADD smartdns.conf /home/smartdns.conf
ADD start.sh /home/start.sh

EXPOSE 53

CMD ["/home/start.sh"]