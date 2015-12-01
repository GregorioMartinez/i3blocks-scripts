#!/bin/bash
#

menu_nrows=${#menu[@]}

launcher_options="-dmenu -i -lines ${menu_nrows} -p ${ROFI_TEXT}"
launcher="rofi ${launcher_options}"
selection="$(printf '%s\n' "${!menu[@]}" | ${launcher})"

function ask_confirmation() {
    confirmed=$(echo -e "Yes\nNo" | rofi -dmenu -i -lines 2 -p "${selection}?" \
      ${rofi_colors} ${ROFI_OPTIONS})

  if [ "${confirmed}" == 0 ]; then
    i3-msg --quiet "exec ${menu[${selection}]}"
  fi
}

if [[ $? -eq 0 && ! -z ${selection} ]]; then
  if [[ "${enable_confirmation}" = true && \
        ${menu_confirm} =~ (^|[[:space:]])"${selection}"($|[[:space:]]) ]]; then
    ask_confirmation
  else
    i3-msg --quiet "exec ${menu[${selection}]}"
  fi
fi
