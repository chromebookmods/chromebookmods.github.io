#!/bin/bash
set -e

sleep 2

wget "https://download.zerobrane.com/ZeroBraneStudioEduPack-1.90-linux.sh"
clear

bash ZeroBraneStudioEduPack-1.90-linux.sh

clear

read -p "Would you like to launch the IDE? [y/n] " _input

if [[ $_input == "Y" || $_input == "y" ]]; then
        echo "Starting"
        echo "Use command 'zbstudio' to launch it again"
        echo "Or use command 'zbstudio-uninstall' to uninstall it"
        zbstudio
else
        echo "Use command 'zbstudio' to launch it"
        echo "Or use command 'zbstudio-uninstall' to uninstall it"
fi

rm zerobrane-lua-ide-downloader.sh # Self Destruct ~ Useless anyways
rm ZeroBraneStudioEduPack-1.90-linux.sh # Useless too
