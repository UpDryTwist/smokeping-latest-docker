FROM lscr.io/linuxserver/smokeping:latest

RUN apk add --no-cache curl \
    && mkdir -p /usr/share/smokeping \
    && curl -o /usr/share/smokeping/Smokeping.pm https://raw.githubusercontent.com/oetiker/SmokePing/master/lib/Smokeping.pm \
    && chmod 755 /usr/share/smokeping/Smokeping.pm \
    && apk del curl