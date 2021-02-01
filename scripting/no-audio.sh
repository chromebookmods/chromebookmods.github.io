# Official bash command from www.chromebookmods.ml | This is only for fixing audio usage; nothing else.

# Note:
# If you are reading this before you run it, good! Make sure to install the
# alsa-utils, alsa-base and WGET package from your package manager. Thanks!

# Exits when error occurs

set -e

# Excess sleep time : Allow user to exit of program in case
sleep 2
echo '[==>] CM: Installing "asound.state" file from WGET'
echo '[==>] CM: Do note that this is not ChromebookMods official "asound.state" script. Please refer to the providing for the original source code.'
echo '[==>] CM: https://github.com/krptg0/fix_braswell_audio'

# Create new folder and add the file there
mkdir tmp-folder/

cd tmp-folder/


wget "https://raw.githubusercontent.com/krptg0/fix_braswell_audio/master/asound.state"

cd ..

echo '[==>] CM: Running script...'

# Run the main script

# Copies the file into the /var/ folder
sudo cp tmp-folder/asound.state /var/lib/alsa/asound.state
# Restarts audio
sudo alsa force-reload
alsactl init
sudo alsactl store --file /var/lib/alsa/asound.state
# Reload again
sudo alsa force-reload

echo '[==>] CM: Installation has been completed. You may close this terminal and test your audio.'
# Removes temporary folder
rm -r tmp-folder/
#Exit
exit 0
