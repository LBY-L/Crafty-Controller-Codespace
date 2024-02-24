#!/bin/bash
sudo apt update -y 
sudo apt install -y openjdk-17-jdk-headless openjdk-17-jre git python3 python3-dev python3-pip software-properties-common python3-venv
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list 
sudo apt update -y 
sudo apt install -y playit
sudo mkdir -p minecraft/crafty
sudo mkdir -p minecraft/server
sudo useradd crafty -s /bin/bash
cd minecraft/crafty
sudo git clone https://gitlab.com/crafty-controller/crafty-4.git
sudo python3 -m venv venv
sudo chown crafty:crafty -R ../
sudo su crafty -c "source venv/bin/activate; cd crafty-4; pip3 install --no-cache-dir -r requirements.txt; python3 main.py"