#!/usr/bin/env bash
#set -e

WS_SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

apt-get dist-upgrade -y
apt-get update -y
apt -y install python3-pip sudo vim curl apt-transport-https ca-certificates python3-pip virtualenv python3-setuptools openssl ssl-cert tmux gettext gnupg2 zsh rsync
pip3 install boto3
usermod -aG sudo mchu

mkdir -p /home/mchu/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuHZzytEsWbwf/EI7TzCEpRWS2n1eN7RVGzlZYYr+l9+H9c1mZ7u8ID3qbLQ75QFpmmlBwIQ2QCo2ayDoE1O51k+kyjGSMXBg37+hYF8LQW/jLdMbtzffJI/Q68J7E/SfCA7umMAxjzDuUuj2yA5cbS6czkUgtER0yFG1E6meSzyiWbsmP6zbA6pE3YgviTSB2J+mUrVxHjTnMGQy/U9rWIw1K9UTjn934p19Hg4nHTnO022KlSJ73LGMOFcEZXJiBU5wJm3eEEreenVKgFoDJH4opl3+XbbSeDzrB76M0KKi/Ebt0+rPShJ6B3wFpDHD3qkiN1BSBlpitAHuxcbo9 mchu@OBC-IT" > /home/mchu/.ssh/authorized_keys
chown -R mchu:mchu /home/mchu/.ssh
chmod 700 /home/mchu/.ssh
chmod 600 /home/mchu/.ssh/authorized_keys

echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
service sshd restart
