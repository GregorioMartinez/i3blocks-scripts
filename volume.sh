#!/bin/bash

VOL=$(amixer -D pulse get Master)
LEVEL=$(echo $VOL | grep -Eo '[0-9]{1,3}?%' | head -n 1)
IS_MUTE=$(echo $VOL | grep -Eo '\[on\]' | head -n 1)
COLOR="EBDBB2"
ICON="f028"

if [ -z "$IS_MUTE" ]; then
    COLOR="F2777A"
    ICON="f026"
fi

echo "<span color=\"#$COLOR\" font_desc='FontAwesome'>&#x$ICON; $LEVEL</span>" 
