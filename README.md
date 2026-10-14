# Teclast X5 Pro - Touchscreen & Screen Rotation Fix

Skrypt automatyzujący naprawę dotyku (Silead) oraz automatycznego obracania ekranu (Kionix KIOX000A) dla tabletu **Teclast X5 Pro** w systemie Linux.

## Co naprawia ten skrypt?
* **Ekran dotykowy**: Wgrywa skorygowany plik firmware (`silead_ts.fw`) naprawiający rozdzielczość i zamienione osie.
* **Obracanie ekranu**: Ustala poprawną macierz obrotu akcelerometru (`ACCEL_MOUNT_MATRIX`) w `hwdb` oraz włącza usługę `iio-sensor-proxy`.

## Szybka instalacja

Otwórz terminal na nowo zainstalowanym systemie i wpisz:

```bash
git clone [https://github.com/bubczakmarian-byte/teclast-x5-pro-fix-touchscreen.git](https://github.com/bubczakmarian-byte/teclast-x5-pro-fix-touchscreen.git)
cd teclast-x5-pro-fix-touchscreen
chmod +x install.sh
./install.sh
sudo reboot
