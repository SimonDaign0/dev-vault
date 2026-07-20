#!/usr/bin/env bash

# sddm
sudo cp $(pwd)/sddm/theme.conf /etc/sddm.conf.d/
&& echo "replaced sddm theme"

# dotfile
cd "$(pwd)/dotfile"

for entry in $(pwd)/*; do
    stow $(basename $entry) 2>/dev/null &&
    echo "stowed $(basename $entry)/" ||
    echo "$(basename $entry)/ already exists"
done
