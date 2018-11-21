#! /bin/bash

set -e

brew install --HEAD usbmux
brew install --HEAD libimobiledevice
# brew link --overwrite libimobiledevice
brew install --HEAD  ideviceinstaller
# brew link --overwrite ideviceinstaller
brew install ifuse
sudo chmod -R 777 /var/db/lockdown/