#!/bin/bash

# Source the configuration file for BOT_TOKEN and CHAT_ID
BASEDIR=$(dirname "$0")
source "${BASEDIR}/bot_creds.sh"

# Extract specific arguments if needed
TORRENT_NAME="$1"
TORRENT_SIZE_BYTES="$2"

# Convert size from bytes to MB or GB as appropriate
if [ $TORRENT_SIZE_BYTES -lt 1073741824 ]; then
    # If size is less than 1 GB, convert to MB
    TORRENT_SIZE=$(echo "scale=2; $TORRENT_SIZE_BYTES/1048576" | bc)
    SIZE_UNIT="MB"
else
    # Otherwise, convert to GB
    TORRENT_SIZE=$(echo "scale=2; $TORRENT_SIZE_BYTES/1073741824" | bc)
    SIZE_UNIT="GB"
fi

# Notification message
# If you need a line break, use "%0A" instead of "\n".
MESSAGE="✅ ${TORRENT_NAME} [${TORRENT_SIZE} ${SIZE_UNIT}]" 

# Prepares the request url
TG_WEBHOOK_URL="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage"

# Prepares the the directory for saving the logs
BASEDIR=$(dirname "$0")

# Sends the notification to the telegram bot and save the response content into the notificationsLog.txt
curl -S -X POST \
  -d chat_id="${CHAT_ID}" \
  -d text="${MESSAGE}" \
  -d parse_mode="HTML" \
  "${TG_WEBHOOK_URL}" -w "\n" | tee -a "${BASEDIR}/notificationsLog.txt"

# Prints an info message in the console
echo "[${TR_TIME_LOCALTIME}]-[${TORRENT_NAME}] Download completed. Telegram notification sent."
