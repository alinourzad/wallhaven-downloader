#!/bin/bash

which jq || sudo dnf install -y jq
which aria2c || sudo dnf install -y aria2

# categories 100/101/111* (general/anime/people) Turn categories on(1) or off(0)
# purity     100/110/111  (sfw/sketchy/nsfw)     
curl -sX GET 'https://wallhaven.cc/api/v1/search?ratios=16x9&purity=100&categories=110&sorting=views' | jq .data[].path | cut -d '"' -f 2 | tee uris.txt
#cat uris.txt
mkdir ./wallpaper
aria2c -d./wallpaper -j16 -c -x16 -k1M -s16 --optimize-concurrent-downloads true  -i uris.txt

