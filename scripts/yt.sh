#!/bin/sh

BABEL='PL8bO6RFT435qmTJoTHWxkd2iNdLtoTjwJ'
PL=$1

if [ -z "$PL" ]
then
    echo "usage: sh $0 <youtube playlist code>"
    exit
fi

#echo youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist 'https://www.youtube.com/playlist?list=$PL'
youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist $PL

~/bin/rename.pl -f 'y/A-Z/a-z/' *
~/bin/rename.pl -v -f 's/ +/ /g' *
~/bin/rename.pl -v -f 's/ /_/g' *
~/bin/rename.pl -v -f 's/_\(.*\)//g' *
~/bin/rename.pl -v -f 's/_\[.*\]//g' *
