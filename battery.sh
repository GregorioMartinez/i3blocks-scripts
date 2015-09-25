#!/bin/bash

# Dependencies
# acpi
# grep

BAT=`acpi -b | grep -Eo [0-9]+\%`

echo $BAT
