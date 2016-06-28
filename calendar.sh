#!/bin/bash

case $BLOCK_BUTTON in
	1)
		google-chrome http://calendar.google.com > /dev/null 2>&1
esac

DATE=`date '+%A - %d'`
TIME=`date '+%I:%M'`
echo "&#xf073;   $DATE   &#xf017;   $TIME"
