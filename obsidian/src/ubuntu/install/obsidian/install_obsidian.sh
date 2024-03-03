#!/usr/bin/env bash
set -xe

# Install obsidian
OBSIDIAN_VERSION=1.5.8
wget -q -O obsidian.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb
apt-get update
apt-get install -y ./obsidian.deb
rm obsidian.deb

# Desktop Icon
cp /usr/share/applications/obsidian.desktop $HOME/Desktop/
chmod +x $HOME/Desktop/obsidian.desktop

# Cleanup for app layer
chown -R 1000:0 $HOME
find /usr/share/ -name "icon-theme.cache" -exec rm -f {} \;
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
fi