# TESTSERVER

A lightweight browser-accessible Linux desktop for phones and computers.

## Current stage

The first prototype runs Debian with XFCE, Xvfb, x11vnc and noVNC. The browser connection is protected by HTTP Basic Authentication through Nginx. VNC itself is only bound to localhost inside the container.

## Deploy on blitz.cloud

This repository is built from its root Dockerfile. The application listens on port 8080.

After the first build, open the app's **Environment** tab and add:

- `VNC_USERNAME`: a username for the desktop login
- `VNC_PASSWORD`: a strong password with at least 12 characters

Do not put passwords in this repository or share them in screenshots or chat.

## Use

Open the app address. The browser asks for the username and password, then loads noVNC. On an iPhone, use the noVNC touch controls and on-screen keyboard.

## Limitations

This is a Linux desktop running inside a container, not a full virtual machine. It does not provide a separate Linux kernel or unrestricted hardware access. Performance depends on the hosting plan and available memory. The initial desktop is deliberately kept simple; memory use and iPhone usability must be tested before adding more software.

## Security

Keep the repository free of credentials. Use a unique password, and change it from the app's Environment settings if it is ever exposed.
