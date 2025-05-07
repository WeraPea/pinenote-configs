#!/usr/bin/env bash
# requires root access
rm ./exit -f
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# orig_vt=$(fgconsole) # defaults to 1 even when graphical session is on 2?
orig_vt=2
warm=$(cat /sys/class/backlight/backlight_warm/brightness)
cool=$(cat /sys/class/backlight/backlight_cool/brightness)

cleanup() {
  echo "$warm" >/sys/class/backlight/backlight_warm/brightness
  echo "$cool" >/sys/class/backlight/backlight_cool/brightness
  chvt "$orig_vt"
  echo clean
  trap - EXIT
  exit
}
trap cleanup INT TERM EXIT

openvt -f -c 3 -- bash -c 'echo 0 | sudo tee /sys/class/graphics/fbcon/cursor_blink' # disable cursor blink in console
chvt 3

echo 0 >/sys/class/backlight/backlight_warm/brightness
echo 0 >/sys/class/backlight/backlight_cool/brightness

"$script_dir"/usb-otg_tablet.sh &
pid="$!"

trap "kill $pid" INT
while true; do
  if [ -e ./exit ]; then
    rm ./exit
    while pgrep "$pid"; do
      kill -INT "$pid"
    done
    exit
  fi
done
