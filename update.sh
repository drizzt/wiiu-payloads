#!/bin/sh

set -e

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

cd "$(dirname "$0")"

[ -f .access_token.txt ] && read -r access_token < .access_token.txt || true

curl -fs "https://api.github.com/repos/dimok789/loadiine_gx2/releases${access_token:+"?access_token=$access_token"}" > .releases.json
tag=$(jshon -e 0 -e tag_name -u < .releases.json)
[ -s .last_tag.txt ] && read -r last_tag < .last_tag.txt || true
[ "$tag" = "$last_tag" ] && exit 0

url=$(jshon -a -e assets -a -e browser_download_url -u < .releases.json | fgrep -m 1 /loadiine_gx2_)
curl -sfL "$url" > .loadiine.zip
unzip -qo .loadiine.zip 'www/loadiine_gx2/*'
rm -f .releases.json .loadiine.zip
./compile_payloads.sh www/loadiine_gx2
git add -A -- www/loadiine_gx2
git diff --cached --exit-code || git commit -m "Update for $tag"
git push origin
echo "$tag" > .last_tag.txt
