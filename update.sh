#!/bin/bash

fonts=/home/$USER/.local/share/fonts/
font_major_ver=17

# Check for fonts folder existence
if [[ ! -d $fonts ]]
then
    echo "Fonts folder not found at ${fonts}, creating…"
    mkdir -p $fonts
fi

# Download latest archive
curl -s https://api.github.com/repos/be5invis/Iosevka/releases/latest | \
    grep "browser_download_url.*ttc-iosevka-${font_major_ver}*" |\
    cut -d : -f 2,3 | grep -v "super" | tr -d \" |\
    wget -qi -

unzip ttc-iosevka-*

mv iosevka-*.ttc $fonts

rm ttc-iosevka-* iosevka-*

fc-cache -f -v

