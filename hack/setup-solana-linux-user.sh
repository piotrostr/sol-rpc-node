#!/bin/bash

# run this after setting up the volume mount

sudo adduser solana
sudo passwd -d solana
sudo chown solana:solana /mnt/disks/solana

su - solana
