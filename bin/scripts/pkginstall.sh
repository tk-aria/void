#!/bin/bash
ARGS=${@};

if test ${#} -lt 1 ; then # must need `1` arg.
    echo 'invalid operation!!'
    exit 1
fi

if [[ $(uname -a) =~ WindowsNT || $(uname -a) =~ MINGW || $(uname -a) =~ [C|c]ygwin ]]; then
    INSTALL='cinst --yes '

    if ! type "cinst" > /dev/null; then
        echo '`chocolatey` not found. Install chocolatey'
        powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    else
        echo "already installed chocolatey!"
    fi

    #INSTALL='scoop add'

elif [[ $(uname -a) =~ [D|d]arwin ]]; then
    INSTALL='HOMEBREW_NO_AUTO_UPDATE=1 brew install -y '

    if ! type "brew" > /dev/null; then
        echo '`brew` not found. Install Homebrew'
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        echo "already installed brew!"
    fi

elif [[ $(uname -a) =~ [L|l]inux ]]; then
    INSTALL='apt install -y '
else
    echo 'don`t find package management tool!!'
    exit 1
fi

# install packages.
for idx in "${!ARGS[@]}"; do
    if [ $idx = 1 ]; then
        continue
    fi

    echo "installing ${ARGS[$idx]} ..."
    ${INSTALL} ${ARGS[$idx]}
done
