#!/bin/bash
#cp "c:/users/`whoami`/.bashrc" ./

TARGET_0="c:/users/`whoami`/.bashrc"
TARGET_1="c:/users/`whoami`/AppData/Roaming/.bashrc"

MODIFY_0=$(stat -c %Y $TARGET_0)
MODIFY_1=$(stat -c %Y $TARGET_1)
MODIFY_CURRENT=$(stat -c %Y ./.bashrc)

if [[ $MODIFY_CURRENT -gt $MODIFY_0 ]]
then
    cp ./.bashrc $TARGET_0
    echo -e "Copyed to $TARGET_0\n"
fi
   
if [[ $MODIFY_CURRENT -gt $MODIFY_1 ]]
then
    cp ./.bashrc $TARGET_1
    echo -e "Copyed to $TARGET_1\n"
fi
