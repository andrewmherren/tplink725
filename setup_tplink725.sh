#!/bin/bash
clear
echo "################################################"
echo "## Script: setup_tplink725.sh"
echo "## By: Andrew Herren"
echo "## Date: 11/07/14"
echo "################################################"

shopt -s nocasematch

echo -e "\nThis script will install drivers for the tplink725 usb wifi dongle. Would you like to continue? (y/n)>"
read answer
case "$answer" in
y|yes )
	if [[ "$(whoami)" = "root" ]]; then
		if [[ ! -e "8188eu-20130830.tar.gz" ]]; then
			wget wget https://dl.dropboxusercontent.com/u/80256631/8188eu-20130830.tar.gz
		fi
		tar -zxvf 8188eu-20130830.tar.gz
		install -p -m 644 8188eu.ko /lib/modules/3.6.11+/kernel/drivers/net/wireless
		insmod /lib/modules/3.6.11+/kernel/drivers/net/wireless/8188eu.ko
		depmod -a
	else
		echo "This script must be run as root. Pleast try again using sudo."
	fi
	;;
* )
	echo "Exiting without changes."
	;;
esac
shopt -u nocasematch
