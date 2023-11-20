#!/usr/bin/bash
PKGS=$(awk '/\[ALPM\] installed/ { print $(NF-1) }' /var/log/pacman.log)

for pkg in $PKGS;
do
    QI=$(pacman -Qi $pkg 2> /dev/null)
    echo $QI | grep 'Explicitly installed' &> /dev/null
    CHECK=`echo $?`
    #echo $CHECK
    if [ $CHECK -eq 0 ]; then
        #pacman -Qi $pkg
        pacman -Qi $pkg | rg 'Name|Installed Size'; echo ""
        #echo $pkg
    fi
done