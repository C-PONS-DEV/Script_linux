#!/bin/bash

# date du jour
backupdate=$(date +%Y-%m-%d)

# sauvegarde de /docpartgae
/bin/tar -cjf /tmp/home-$backupdate.tar.bz2 /media/docpartgae
