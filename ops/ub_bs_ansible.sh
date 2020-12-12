#!/usr/bin/env bash
#set -e

WS_SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

sudo apt-get dist-upgrade -y
sudo apt-add-repository -y --update ppa:ansible/ansible
sudo apt-get update -y
sudo apt -y install python3-pip ansible
sudo pip3 install boto3
