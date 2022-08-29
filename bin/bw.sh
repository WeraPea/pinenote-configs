#!/bin/sh

echo 1 > /sys/module/rockchip_ebc/parameters/bw_mode
echo 6 > /sys/module/rockchip_ebc/parameters/refresh_threshold
echo 1 > /sys/module/rockchip_ebc/parameters/default_waveform
echo 1 > /sys/module/rockchip_ebc/parameters/auto_refresh
