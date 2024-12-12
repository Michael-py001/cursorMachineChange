# Cursor Device ID Changer Pro

> [English](./README.md) | [中文](./README_CN.md)

A simple script tool for modifying the device ID of the Cursor editor. When your device is locked due to frequent account switching, you can use this script to reset the device ID.
Modified from [this project](https://github.com/fly8888/cursor_machine_id), compatible with MacOS, Windows, and Linux systems.

## Use Case

When the Chat window prompts: "Too many free trial accounts used on this machine", you can use this script to reset the device ID.

## Features

- Supports MacOS, Windows, Linux
- Automatically generates new random device IDs
- Automatic backup of original configuration files
- Supports custom device IDs
- No additional dependencies, uses system built-in tools

## Usage

1. Download the `run.sh` script
2. Add execution permissions to the script:

```base
chmod +x run.sh
```

3. Make sure to close the Cursor editor before running the script

4. Run the script:

(For Windows systems, please use Git Bash to run)

```
# Use randomly generated device ID
./run.sh
# Or use custom device ID
./run.sh your_custom_id
```

5. Restart the Cursor editor

## Notes

- The script automatically creates a backup of the configuration file before modification
- Backup files are saved in the same directory as the original configuration file, in the format storage.json.backup_timestamp
- Make sure to close the Cursor editor before running the script

## Configuration File Location

Default configuration file paths:

```
MacOS = "~/Library/Application Support/Cursor/User/globalStorage/storage.json"

Windows = "%APPDATA%/Cursor/User/globalStorage/storage.json"

Linux = "~/.config/Cursor/User/globalStorage/storage.json"
```

## Star History

<img alt="Star History Chart" src="https://api.star-history.com/svg?repos=Michael-py001/cursorMachineChange&amp;type=Date">

## Disclaimer

This script is for learning and research purposes only. Using this script may violate Cursor's terms of service. Please use responsibly and at your own risk.
