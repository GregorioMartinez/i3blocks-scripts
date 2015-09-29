#!/bin/bash

# Dependencies
# acpi
# grep
# tr

BAT=`acpi -b | grep -Eo [0-9]+\% | tr -d '%'`
ICON="f244"
COLOR="F2777A"

if [[ $BAT -gt 90 ]]; then
	ICON="f240"
	COLOR="99CC99"
elif [[ $BAT -gt 75 ]]; then
	ICON="f241"
	COLOR="99CC99"
elif [[ $BAT -gt 50 ]]; then
	ICON="f242"
	COLOR="F99157"
elif [[ $BAT -gt 25 ]]; then
	ICON="f243"
	COLOR="F2777A"
fi

echo "<span color=\"#$COLOR\" font_desc='FontAwesome'>&#x$ICON; $BAT%</span>" 
# echo $BAT
