#! /bin/bash

# Load common configuration
. ./config.sh
. ./lib.sh

# Override config
LOG=${LOG_SERVER}
LOG_ERROR=${LOG_SERVER_ERROR}

read -r requestCrypted

log "Receive request : \"$requestCrypted\""
requestUncrypted=$(decode "$requestCrypted")
run $requestUncrypted
log 'End request..'
