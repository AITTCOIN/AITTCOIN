 #!/usr/bin/env bash

 # Execute this file to install the aittcoin cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%AITTCoin-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/AITTCoin-Qt.app/Contents/MacOS/aittcoind /usr/local/bin/aittcoind
 sudo ln -s ${LOCATION}/AITTCoin-Qt.app/Contents/MacOS/aittcoin-cli /usr/local/bin/aittcoin-cli
