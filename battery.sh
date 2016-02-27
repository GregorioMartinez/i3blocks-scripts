#!/bin/bash

# Dependencies
# acpi
# grep
# tr
# paste
# bc

BAT=$(acpi -b)

# Get all battery levels
# Condense to one line and sum
SUM=$(echo $BAT | grep -Eo [0-9]+\% | tr -d '%' | paste -sd+ - | bc)

# Divide sum by number of batteries to get average battery level
LEVEL=$(echo $SUM / $(acpi -b | grep -Eoc [0-9]+\% ) | bc)

ISCHARGING=`echo $BAT | grep -Eo Charging`

ICON="f244"
COLOR="F2777A"

if [[ $LEVEL -gt 90 ]]; then
	ICON="f240"
	COLOR="99CC99"
elif [[ $LEVEL -gt 75 ]]; then
	ICON="f241"
	COLOR="99CC99"
elif [[ $LEVEL -gt 50 ]]; then
	ICON="f242"
	COLOR="F99157"
elif [[ $LEVEL -gt 25 ]]; then
	ICON="f243"
	COLOR="F2777A"
fi

if [ "$ISCHARGING" == "Charging" ]; then
    ICON="f1e6"
fi

echo "<span color=\"#$COLOR\" font_desc='FontAwesome'>&#x$ICON; $LEVEL%</span>" 
