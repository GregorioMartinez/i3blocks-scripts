#!/bin/bash

# Dependencies
# curl
# xmllint

source /home/greg/scripts/i3block-scripts/gmail.conf

MAILCOUNTER=`curl -u $USERID:$PASSWORD --silent "https://mail.google.com/mail/feed/atom" | xmllint --format --xpath "string(//*[name() = 'feed']/*[name() = 'fullcount'])" -`
if [[ "$MAILCOUNTER" = "" ]]; then
    echo "ERROR: The program couldn't fetch the account for \"$USERID\"."
else
    echo "$MAILCOUNTER new emails"
fi
