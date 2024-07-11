# AOSPA flashing kit for Pong

Scripts to flash firmware and ROM on windows/mac/linux, including latest platform-tools and drivers, for AOSPA - Nothing Phone (2).

## Steps

1. Download the latest fastboot package from https://paranoidandroid.co/pong/
2. Copy it to this folder and rename it to aospa.zip
3. Download the latest Android 14 firmware archive file (marked as `-image-firmware.7z`) from https://github.com/spike0en/Pong_Archive/releases
4. Copy it to this folder and rename it to `firmware.7z`
5. Run install_google_usb_driver (Windows users only; requires admin)
6. Reboot to bootloader (`adb reboot bootloader` OR shutdown phone and long press power + volume down button)
7. Run flash_firmware
8. Run flash_aospa

### Notes
- `.cmd` scripts are for windows, can be run by right click -> run as administrator.
- `.sh` scripts are for linux and mac, you should know how to use them!
- Linux users must have 7zip preinstalled before using the script.
- The script is compatible with Windows 10 and higher only!
- You may see warnings like `Warning: skip copying xyz image avb footer` while flashing firmware, this is normal and can be ignored safely.
- The device will reboot automatically into "AOSPA Fastboot" (fastbootd) during ROM flash, this is normal and expected behaviour.
- These scripts do not wipe data.
