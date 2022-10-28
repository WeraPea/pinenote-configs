#!/bin/sh

if grep -e 1 -e 2 /sys/module/rockchip_ebc/parameters/bw_mode >/dev/null; then
	~/.local/bin/normal.sh
else
	~/.local/bin/bw.sh
fi
