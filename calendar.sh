#!/bin/bash

case $BLOCK_BUTTON in
	1)
		google-chrome http://calendar.google.com > /dev/null 2>&1
esac

DATE=`date '+%D %I:%M'`

echo "&#xf073; $DATE"
