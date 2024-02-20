#!/bin/bash

# run this to mount the volume, assuming the
# terraform is ran and there exists a disk at
# /dev/sdb
# in production, there should be two volumes, one
# for the accounts and the other for the ledger

sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb

sudo mkdir -p /mnt/disks/solana

sudo mount -o discard,defaults /dev/sdb /mnt/disks/solana

sudo chmod a+w /mnt/disks/solana

# be sure to also allocate swap
sudo fallocate -l 256G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab
