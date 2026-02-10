#!/bin/bash

mount.nfs 192.168.4.11:/backups /mnt/backups/

export hostname=$(hostname)

mkdir -p /mnt/backups/${hostname}
mkdir -p /mnt/backups/${hostname}/{data}

rsync -av --no-owner --no-perms --no-group /mnt/data/ /mnt/backups/${hostname}/data/

umount /mnt/backups
