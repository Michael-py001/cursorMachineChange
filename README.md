# Cursor Device ID Changer Pro

> 🌐️ 中文 | [English](./README_EN.md)

一个简单的脚本工具，用于修改 Cursor 编辑器的设备 ID。当因频繁切换账号导致设备被锁定时，可以使用此脚本重置设备 ID。
兼容 MacOS、Windows、Linux 系统。

## 适用场景

当 Chat 窗口提示：Too many free trial accounts used on this machine. 时示时，可以使用此脚本重置设备 ID。

## 功能特点

- 支持 MacOS、Windows、Linux
- 自动生成新的随机设备 ID
- 自动备份原配置文件
- 支持自定义设备 ID
- 无需额外依赖，使用系统内置工具

## 使用方法

1. 下载 `run.sh` 脚本
2. 给脚本添加执行权限：

```base
chmod +x run.sh
```

3. 请确保在运行脚本前关闭 Cursor 编辑器

4. 运行脚本：

(Windows 系统请使用 Git Bash 运行)

```bash
使用随机生成的设备 ID
./run.sh
或者使用自定义设备 ID
./run.sh your_custom_id
```

5. 重启 Cursor 编辑器

## 注意事项

- 脚本会在修改前自动创建配置文件的备份
- 备份文件保存在原配置文件相同目录下，格式为 `storage.json.backup_时间戳`
- 请确保在运行脚本前关闭 Cursor 编辑器

## 配置文件位置

默认配置文件路径：

```
MacOS = "~/Library/Application Support/Cursor/User/globalStorage/storage.json"

Windows = "%APPDATA%/Cursor/User/globalStorage/storage.json"

Linux = "~/.config/Cursor/User/globalStorage/storage.json"
```

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Michael-py001/cursorMachineChange&type=Date)](https://star-history.com/#Michael-py001/cursorMachineChange&Date)

## 免责声明

本脚本仅供学习和研究使用，使用本脚本可能违反 Cursor 的服务条款。请合理使用，风险自负。
