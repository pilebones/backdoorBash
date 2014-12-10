#! /bin/bash

# Load common configuration
. ./config.sh
. ./lib.sh


read -r requestCrypted

log "Receive request : \"$requestCrypted\""
requestUncrypted=$(decode "$requestCrypted")
run $requestUncrypted
log 'End request..'
