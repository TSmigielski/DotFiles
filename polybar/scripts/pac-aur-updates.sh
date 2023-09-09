#!/bin/sh

if ! arch=$(checkupdates 2> /dev/null | wc -l ); then
    arch=0
fi

if ! aur=$(paru -Qum 2> /dev/null | wc -l); then
    aur=0
fi

if [ $arch -gt 10 ] || [ $aur -gt 1 ]; then
    echo "$arch | $aur"
else
    echo ""
fi
