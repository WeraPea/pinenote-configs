#!/bin/sh

if grep Y /sys/module/rockchip_ebc/parameters/bw_mode >/dev/null; then
	~/.local/bin/normal.sh
else
	~/.local/bin/bw.sh
fi
