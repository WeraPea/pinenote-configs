#!/bin/sh

echo 0 > /sys/module/rockchip_ebc/parameters/bw_mode
echo 20 > /sys/module/rockchip_ebc/parameters/refresh_threshold
echo 4 > /sys/module/rockchip_ebc/parameters/default_waveform
echo 1 > /sys/module/rockchip_ebc/parameters/auto_refresh
