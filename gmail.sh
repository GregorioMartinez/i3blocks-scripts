#!/bin/bash

# Dependencies
# curl
# xmllint

source $HOME/code/i3block-scripts/gmail.conf

case $BLOCK_BUTTON in
	1)
		sensible-browser http://gmail.com > /dev/null 2>&1
esac

MAILCOUNTER=`curl -u $USERID:$PASSWORD --silent "https://mail.google.com/mail/feed/atom" | xmllint --format --xpath "string(//*[name() = 'feed']/*[name() = 'fullcount'])" -`
if [[ "$MAILCOUNTER" = "" ]]; then
    echo "<span color=\"#F2777A\">&#xf0e0; Error</span>"
else
    echo "&#xf0e0; $MAILCOUNTER"
fi
