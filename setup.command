#!/bin/sh

if ! type "brew" > /dev/null; then
    echo '`brew` not found. Install Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "already installed brew!"
fi

if ! type "make" > /dev/null; then
    echo '`make` not found. Install make'
    HOMEBREW_NO_AUTO_UPDATE=1 brew install -y make
else
    echo "already installed make!"
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR} && sh ./setup.sh
