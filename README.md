# ESP32 Firmware Build & Flash Guide | Production & Batch Flashing <img width="3%" alt="pngtree-chip-chip-circuit-sign-vector-png-image_45247508" src="https://github.com/user-attachments/assets/91515c0a-8306-4986-b3e0-df7a9865cb58" /> 



This guide explains how to compile an Arduino sketch, combine the required BIN files into a single firmware file, and flash it to an ESP32 or ESP32-C3 using Flash Download Tool.

## 1. Requirements <img width="2%" alt="Windows 11" src="https://github.com/user-attachments/assets/716cde3e-3ea4-43ad-a4bd-1049a27e8c24" />

- Arduino IDE **2.3.2 or above**
- Correct ESP32 board package version
- `esptool.exe`
- `boot_app0.bin`
- `ESP32_Merge_BIN.bat` or `ESP32C3_Merge_BIN.bat`
- `flash_download_tool_3.9.5.exe`

> **Important:** Use Arduino IDE 2.3.2 or above. Arduino IDE 1.8.19 or lower may generate BIN files that flash successfully but do not work correctly.

## 2. Compile the Arduino Sketch

1. Open your Arduino sketch in Arduino IDE.
2. Select the correct ESP32 or ESP32-C3 board and board package version.
3. Go to **Sketch → Export Compiled Binary**.
4. A `build` folder will be created inside the sketch folder.

## 3. Prepare the Build Folder

Copy the following files into the sketch's `build` folder:

- `esptool.exe`
- `boot_app0.bin`
- `ESP32_Merge_BIN.bat` — for ESP32
- `ESP32C3_Merge_BIN.bat` — for ESP32-C3

Rename the generated BIN files as follows:

| Generated file | Rename to |
|:---:|:---:|
| Bootloader BIN | `bootloader.bin` |
| Partition table BIN | `partitions.bin` |
| Application BIN | `ino.bin` |

Make sure the files and the selected BAT script are in the same folder.

## 4. Combine the BIN Files

Run the appropriate BAT file:

- **ESP32:** `ESP32_Merge_BIN.bat`
- **ESP32-C3:** `ESP32C3_Merge_BIN.bat`

The script combines the bootloader, partition table, `boot_app0.bin`, and application firmware into a single BIN file.

The output file will be:

`combined.bin`

## 5. Flash the Firmware

1. Run `flash_download_tool_3.9.5.exe`.
2. Select the correct chip type: ESP32 or ESP32-C3.
3. Select the generated `combined.bin` file.
4. Set the flash address to `0x0000`.
5. Configure the following settings:

| Setting | Value |
|:---:|:---:|
| Baud Rate | `921600` |
| SPI Speed | `40 MHz` |
| SPI Mode | `DIO` |
| COM Port | Select the correct port |

6. Connect the ESP board to the PC.
7. Follow the flashing procedure shown in the video.
8. Start flashing and wait for the operation to complete successfully.


## Important Note

The ESP32 and ESP32-C3 use **different BAT files**. Do not use the ESP32 BAT file for ESP32-C3 or vice versa.

Always select the correct chip type and use the matching merged firmware file.

📫 Mail for any query/support: rn.ksheer+github@gmail.com
