#!/usr/bin/env bash
#set -e

WS_SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

sudo apt-get dist-upgrade -y
sudo apt-get update -y
sudo apt -y install python3-pip
sudo pip3 install boto3

nopasswd(){
  echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
}
mkdir -p ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuHZzytEsWbwf/EI7TzCEpRWS2n1eN7RVGzlZYYr+l9+H9c1mZ7u8ID3qbLQ75QFpmmlBwIQ2QCo2ayDoE1O51k+kyjGSMXBg37+hYF8LQW/jLdMbtzffJI/Q68J7E/SfCA7umMAxjzDuUuj2yA5cbS6czkUgtER0yFG1E6meSzyiWbsmP6zbA6pE3YgviTSB2J+mUrVxHjTnMGQy/U9rWIw1K9UTjn934p19Hg4nHTnO022KlSJ73LGMOFcEZXJiBU5wJm3eEEreenVKgFoDJH4opl3+XbbSeDzrB76M0KKi/Ebt0+rPShJ6B3wFpDHD3qkiN1BSBlpitAHuxcbo9 mchu@OBC-IT" > ~/.ssh/authorized_keys
sudo nopasswd
