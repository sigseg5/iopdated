#!/bin/bash

# Download latest archive
curl -s https://api.github.com/repos/be5invis/Iosevka/releases/latest | \
    grep "browser_download_url.*ttc-iosevka-16*" |\
    cut -d : -f 2,3 | grep -v "super" | tr -d \" |\
    wget -qi -

unzip ttc-iosevka-*

mv iosevka-*.ttc /home/$USER/.local/share/fonts/

rm ttc-iosevka-* iosevka-*

fc-cache -f -v

