#!/bin/sh

# create path to docker.conf directory

mkdir -p /etc/systemd/system/docker.service.d/
cd /etc/systemd/system/docker.service.d
rm -rf docker.conf

# create configuration file for Docker daemon with options

touch docker.conf
cat > docker.conf << EOL
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix://var/run/docker.sock
EOL
sudo systemctl daemon-reload
sudo systemctl restart docker

# return to previous used directory

cd $OLDPWD