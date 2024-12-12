#!/bin/bash

# 配置文件路径
MAC_STORAGE_FILE="$HOME/Library/Application Support/Cursor/User/globalStorage/storage.json"
WIN_STORAGE_FILE="$APPDATA/Cursor/User/globalStorage/storage.json"
LINUX_STORAGE_FILE="$HOME/.config/Cursor/User/globalStorage/storage.json"

# 判断当前系统是哪个平台
case "$(uname -s)" in
    Darwin)
        STORAGE_FILE=$MAC_STORAGE_FILE
        ;;
    Linux)
        STORAGE_FILE=$LINUX_STORAGE_FILE
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        STORAGE_FILE=$WIN_STORAGE_FILE
        ;;
    *)
        echo "未知的操作系统"
        exit 1
        ;;
esac

# 生成随机 ID
generate_random_id() {
    openssl rand -hex 32
}

generate_random_uuid() {
    openssl rand -hex 16 | awk '{print substr($0,1,8) "-" substr($0,9,4) "-4" substr($0,14,3) "-" substr($0,17,4) "-" substr($0,21)}'
}


# 生成新的 IDs
NEW_MACHINE_ID=${1:-$(generate_random_id)}
NEW_MAC_MACHINE_ID=$(generate_random_id)
NEW_DEV_DEVICE_ID=$(generate_random_uuid)

# 创建备份
backup_file() {
    if [ -f "$STORAGE_FILE" ]; then
        cp "$STORAGE_FILE" "${STORAGE_FILE}.backup_$(date +%Y%m%d_%H%M%S)"
        echo "已创建备份文件"
    fi
}

# 确保目录存在
mkdir -p "$(dirname "$STORAGE_FILE")"

# 创建备份
backup_file

# 如果文件不存在，创建新的 JSON
if [ ! -f "$STORAGE_FILE" ]; then
    echo "{}" > "$STORAGE_FILE"
fi

# 更新ID
tmp=$(mktemp)
perl -i -pe 's/"telemetry\.machineId":\s*"[^"]*"/"telemetry.machineId": "'$NEW_MACHINE_ID'"/' "$STORAGE_FILE"
perl -i -pe 's/"telemetry\.macMachineId":\s*"[^"]*"/"telemetry.macMachineId": "'$NEW_MAC_MACHINE_ID'"/' "$STORAGE_FILE"
perl -i -pe 's/"telemetry\.devDeviceId":\s*"[^"]*"/"telemetry.devDeviceId": "'$NEW_DEV_DEVICE_ID'"/' "$STORAGE_FILE"

echo "已成功修改 ID:"
echo "machineId: $NEW_MACHINE_ID"
echo "macMachineId: $NEW_MAC_MACHINE_ID"
echo "devDeviceId: $NEW_DEV_DEVICE_ID"