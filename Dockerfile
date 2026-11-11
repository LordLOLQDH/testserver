FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

RUN apt-get update && apt-get install -y --no-install-recommends \
    xvfb xfce4 xfce4-terminal dbus-x11 x11vnc \
    novnc websockify nginx apache2-utils supervisor \
    fonts-dejavu-core ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisor/conf.d/testserver.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && mkdir -p /run/nginx /run/supervisor

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
