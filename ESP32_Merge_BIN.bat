@echo off
setlocal

echo ============================================
echo ESP32 BIN Merger
echo ============================================
echo.

REM ------------------------------------------------
REM Put these 4 files in the same folder as this BAT:
REM   bootloader.bin
REM   partitions.bin
REM   boot_app0.bin
REM   firmware.bin
REM
REM Also put esptool.exe in this folder.
REM ------------------------------------------------

set "ESPTOOL=%~dp0esptool.exe"
set "BOOTLOADER=%~dp0bootloader.bin"
set "PARTITIONS=%~dp0partitions.bin"
set "BOOT_APP0=%~dp0boot_app0.bin"
set "FIRMWARE=%~dp0firmware.bin"
set "OUTPUT=%~dp0combined.bin"

if not exist "%ESPTOOL%" (
    echo ERROR: esptool.exe not found.
    echo Put esptool.exe in the same folder as this BAT file.
    pause
    exit /b 1
)

if not exist "%BOOTLOADER%" (
    echo ERROR: bootloader.bin not found.
    pause
    exit /b 1
)

if not exist "%PARTITIONS%" (
    echo ERROR: partitions.bin not found.
    pause
    exit /b 1
)

if not exist "%BOOT_APP0%" (
    echo ERROR: boot_app0.bin not found.
    pause
    exit /b 1
)

if not exist "%FIRMWARE%" (
    echo ERROR: firmware.bin not found.
    pause
    exit /b 1
)

echo Creating combined.bin...
echo.

"%ESPTOOL%" --chip esp32 merge_bin -o "%OUTPUT%" --flash_mode dio --flash_freq 80m --flash_size 4MB ^
  0x1000 "%BOOTLOADER%" ^
  0x8000 "%PARTITIONS%" ^
  0xE000 "%BOOT_APP0%" ^
  0x10000 "%FIRMWARE%"

if errorlevel 1 (
    echo.
    echo ERROR: BIN merge failed.
    pause
    exit /b 1
)

echo.
echo ============================================
echo SUCCESS
echo ============================================
echo Combined firmware:
echo %OUTPUT%
echo.
echo Flash this file at address:
echo 0x0000
echo.
pause
