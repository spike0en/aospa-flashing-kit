@echo off
:: Flash firmware zip generated by Pong Archive
:: (https://github.com/spike0en/Pong_Archive) on pong
::
:: Author: Adithya R (@ghostrider_reborn)
:: Modified by: Spike (@spike0en)

if exist "%~dp0firmware.zip" (
    set fw_zip=%~dp0firmware.zip
) else (
    if exist "%~dp0firmware.zip.zip" (
        set fw_zip=%~dp0firmware.zip.zip
    ) else (
        echo Error: firmware.zip not found!
        goto :exit
    )
)

set fw_path=%~dp0firmware

echo Extracting firmware.zip ...
powershell Expand-Archive -Path '%fw_zip%' -DestinationPath '%fw_path%' -Force

set fastboot=%~dp0platform-tools-windows\fastboot.exe

set partitions=abl aop aop_config bluetooth cpucp devcfg dsp featenabler hyp imagefv keymaster modem multiimgoem multiimgqti qupfw qweslicstore shrm tz uefi uefisecapp xbl xbl_config xbl_ramdump

(for %%p in (%partitions%) do ( 
    echo:
    echo Flashing %%p ...
    "%fastboot%" flash %%p_ab "%fw_path%\firmware-update\%%p.img"
    if ERRORLEVEL 1 (
        echo Error: Flashing %%p failed!
        goto :exit
    )
))

echo:
echo Completed succesfully!

:exit
pause