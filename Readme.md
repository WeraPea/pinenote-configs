### Firmware
``` sh
# smaeul's pinenote-next kernel
mkdir brcm
cp fw_bcm43455c0_ag_cy.bin brcm/brcmfmac43455-sdio-v1.2.bin
cp nvram_ap6255_cy.txt brcm/brcmfmac43455-sdio-v1.2.txt
cp fw_bcm43455c0_ag_cy.bin brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.bin
cp nvram_ap6255_cy.txt brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt
cp BCM4345C0.hcd brcm/BCM4345C0.hcd
```
waveform.bin -> rockchip/ebc.wbf

## koreader
get latest aarch64 deb package from [github](https://github.com/koreader/koreader/releases)

convert to pacman package via ```debtap```,

when asked to edit .PKGINFO, remove:
```
depend = aarch64-linux-gnu-glibc
depend = fonts-droid-fallback
depend = fonts-noto-hinted
```
  
install via pacman:
```
sudo pacman -U ./koreader-*.
```

install fonts-droid-fallback and fonts-noto-hinted from aur

## autostart sway on boot
autologin to user
``` sh
$ cat /etc/systemd/system/getty@tty1.service.d/autologin.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin alarm - $TERM
```

``` sh
$ cat .bashrc 
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export MOZ_USE_XINPUT2=1 # enable touch navigation in firefox
export MOZ_ENABLE_WAYLAND=1 # enable gpu acceleration in firefox
export PATH="$PATH:~/.local/bin/"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	sway 2>> ~/.logsway # autostart sway on boot
fi
```
