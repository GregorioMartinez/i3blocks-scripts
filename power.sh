#!/bin/bash


ROFI_TEXT="Power:"
ROFI_OPTIONS=""

enable_confirmation=true
# Menu with keys/commands

typeset -A menu

menu=(
  [Shutdown]="systemctl poweroff"
  [Reboot]="systemctl reboot"
  [Hibernate]="systemctl hibernate"
  [Suspend]="systemctl suspend"
  [Halt]="systemctl halt"
  [Lock]="lock"
  [Logout]="i3-msg exit"
  [Cancel]=""
)

# Menu entries that may trigger a confirmation message
menu_confirm="Shutdown Reboot Hibernate Suspend Halt Logout"


source /home/greg/code/scripts/i3block-scripts/menu-maker.sh
