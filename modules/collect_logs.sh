#!/bin/bash
USER=`whoami`
SCRIPT_DIR=$(dirname "$0")
date=`date +%d-%m-%Y`

journalctl --since "yesterday" --no-pager > /var/log/daily_log_report_$date.txt
grep -E -v '(coredump|snapd|usb|UFW|mtp-probe|rtkit|baloo|NetworkManager|dbus-daemon|telegram|ACPI|gvfsd-trash|CROND|blueman-manager|bluetoothd|dockerd|wpa_supplicant|python3|pulseaudio|dockerd|systemd)' /var/log/daily_log_report_$date.txt > $SCRIPT_DIR/./../data/daily_log_report.txt
chown -R $USER:$USER $SCRIPT_DIR/./../data


# test run
# grep -E -v '(usb|UFW|mtp-probe|rtkit|baloo|NetworkManager|dbus-daemon|telegram)' /var/log/daily_log_report_$date.txt | head -n 50 > $SCRIPT_DIR/daily_log_report.txt