sleep 2
echo '[==>] CM: Installing "WGET"'
sudo apt-get install wget
echo '[==>] CM: Installing "alsa-utils"'
sudo apt-get install alsa-utils
echo '[==>] CM: Installing "asound.state" file from WGET'
sleep 2
echo '[==>] CM: Do note that this is not ChromebookMods official "asound.state" script. Please refer to the providing for the original source code.'
echo '[==>] CM: https://github.com/krptg0/fix_braswell_audio'
sleep 3
mkdir tmp-folder/
cd tmp-folder/
wget "https://raw.githubusercontent.com/krptg0/fix_braswell_audio/master/asound.state"
cd ..
echo '[==>] CM: Running script...'
sudo cp tmp-folder/asound.state /var/lib/alsa/asound.state
sudo alsa force-reload
alsactl init
sudo alsactl store --file /var/lib/alsa/asound.state
sudo alsa force-reload
echo '[==>] CM: Installation has been completed. You may close this terminal and test your audio.'
rm -r tmp-folder/
exit 0
