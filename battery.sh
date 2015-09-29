#!/bin/bash

# Dependencies
# acpi
# grep
# tr

BAT=`acpi -b | grep -Eo [0-9]+\% | tr -d '%'`

ICON="f244"
if [[ $BAT -gt 90 ]]; then
	ICON="f240"
elif [[ $BAT -gt 75 ]]; then
	ICON="f241"
elif [[ $BAT -gt 50 ]]; then
	ICON="f242"
elif [[ $BAT -gt 25 ]]; then
	ICON="f243"
fi

echo "<span font_desc='FontAwesome'>&#x$ICON; $BAT%</span>" 
# echo $BAT
