#!/bin/sh
set -eu

if [ -z "${VNC_USERNAME:-}" ] || [ -z "${VNC_PASSWORD:-}" ]; then
  echo "Missing VNC_USERNAME or VNC_PASSWORD environment variable."
  echo "Set both in the blitz.cloud app Environment tab before starting."
  exit 1
fi

if [ "${#VNC_PASSWORD}" -lt 12 ]; then
  echo "VNC_PASSWORD must be at least 12 characters long."
  exit 1
fi

htpasswd -bc /run/testserver.htpasswd "$VNC_USERNAME" "$VNC_PASSWORD"
chmod 600 /run/testserver.htpasswd

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
