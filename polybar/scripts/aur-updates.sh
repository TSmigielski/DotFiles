#!/bin/sh

if ! updates=$(paru -Qum 2> /dev/null | wc -l); then
    updates=0
fi

if [ $updates -gt 1 ]; then
    echo "$updates"
else
    echo ""
fi
