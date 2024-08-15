#!/bin/bash

sudo ufw enable

sudo ufw allow 22/tcp

sudo ufw allow 8000:10000/tcp
sudo ufw allow 8000:10000/udp

sudo ufw allow 8899/tcp
sudo ufw allow 8900/tcp

sudo ufw allow 20000/udp
sudo ufw allow 8901/tcp
sudo ufw allow 10000/tcp

# jito block engine addresses
sudo ufw allow from 74.118.140.240
sudo ufw allow from 202.8.8.174
sudo ufw allow from 145.40.93.84
sudo ufw allow from 145.40.93.41
sudo ufw allow from 141.98.216.96
sudo ufw allow from 64.130.48.56
sudo ufw allow from 64.130.53.8
sudo ufw allow from 64.130.53.57
sudo ufw allow from 202.8.9.160
sudo ufw allow from 202.8.9.19

sudo ufw reload

sudo ufw status verbose
