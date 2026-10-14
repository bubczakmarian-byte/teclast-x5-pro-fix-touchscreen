#!/bin/bash
echo "=== Instalacja poprawek dla Teclast X5 Pro ==="

echo "[1/3] Kopiowanie naprawionego firmware dotyku..."
sudo cp silead_ts.fw /lib/firmware/silead_ts.fw
sudo chmod 644 /lib/firmware/silead_ts.fw

echo "[2/3] Konfigurowanie macierzi obrotu akcelerometru..."
sudo bash -c 'cat <<HWDB > /etc/udev/hwdb.d/61-sensor-teclast.hwdb
sensor:modalias:acpi:KIOX000A*:dmi:*
 ACCEL_MOUNT_MATRIX=0, -1, 0; -1, 0, 0; 0, 0, 1
HWDB'

echo "[3/3] Instalowanie i odblokowywanie usługi obrotu ekranu..."
sudo apt update && sudo apt install -y iio-sensor-proxy
sudo systemctl unmask iio-sensor-proxy
sudo systemctl enable --now iio-sensor-proxy

sudo systemd-hwdb update
sudo udevadm trigger -v --subsystem-match=iio

echo "=== Gotowe! Zrestartuj komputer: sudo reboot ==="
