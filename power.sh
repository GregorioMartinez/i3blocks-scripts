#!/bin/bash
#

ROFI_TEXT="Power:"
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
menu_confirm="Shutdown Reboot Hibernate Suspend Halt Logout Cancel"

source ./menu-maker.sh
