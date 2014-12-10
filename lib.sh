#! /bin/bash

log(){
	printf '[Server][%s] %s\r\n' $(date '+%Y%m%d') "$*" >> $LOG_SERVER 2>> $LOG_SERVER_ERROR
}


decode() { 
	log "Try to decode : \"$*\""
	printf "%s\n" "$(echo $*|$OPENSSL enc -d -a -$CRYPT_METHOD -iv $IV -K $PRIVKEY)"
}

encode() {
	log "Try to encode : \"$*\""
	printf "%s\n" "$(echo $*|$OPENSSL_CMD enc -a -$CRYPT_METHOD -iv $IV -K $PRIVKEY)"
}

run() {
	log "Run command \"$SHELL -c \"$@\"\" :"
	$SHELL -c "$*" |tee -a $LOG_SERVER
	log "End command..."
}