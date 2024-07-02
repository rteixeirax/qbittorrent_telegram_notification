#!/bin/bash

# Source the configuration file for BOT_TOKEN and CHAT_ID
BASEDIR=$(dirname "$0")
source "${BASEDIR}/bot_credentials.sh"

# Define the Initial Text Used in the Bot Message
MESSAGE_TEXT="✅ Download Completed "
NAME_TEXT="Name: "
SIZE_TEXT="Size: "
CATEGORY_TEXT="Category: "
TRACKERS_TEXT="Tracker: "

# Receive specific arguments from Script Execution (!!!add stuff here that you want)
TORRENT_NAME="$1"
CATEGORY="$2"
TORRENT_SIZE_BYTES="$3"
CURRENT_TRACKER="$4"

# Remove quotation marks from TORRENT_SIZE_BYTES (without this the following conversion fails)
TORRENT_SIZE_BYTES=$(echo "$TORRENT_SIZE_BYTES" | sed 's/[“”"]//g')

# Check if TORRENT_SIZE_BYTES is set and is a number (make sure we removed the special characters)
if ! [[ "$TORRENT_SIZE_BYTES" =~ ^[0-9]+$ ]]; then
    TORRENT_SIZE="Error: Invalid size"
    SIZE_UNIT=""
else
    # Convert size from bytes to MB or GB as appropriate
    if [ "$TORRENT_SIZE_BYTES" -lt 1073741824 ]; then
        # If size is less than 1 GB, convert to MB
        TORRENT_SIZE=$(echo "scale=2; $TORRENT_SIZE_BYTES/1048576" | bc)
        SIZE_UNIT="MB"
    else
        # Otherwise, convert to GB
        TORRENT_SIZE=$(echo "scale=2; $TORRENT_SIZE_BYTES/1073741824" | bc)
        SIZE_UNIT="GB"
    fi
fi

# Notification message
# If you need a line break, use "%0A" instead of "\n".
MESSAGE="%0A${MESSAGE_TEXT} %0A${NAME_TEXT}${TORRENT_NAME} %0A${CATEGORY_TEXT}${CATEGORY} %0A${SIZE_TEXT}${TORRENT_SIZE} ${SIZE_UNIT} %0A${TRACKERS_TEXT}${CURRENT_TRACKER}"

# Prepares the request url
TG_WEBHOOK_URL="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage"

# Prepares the directory for saving the logs
BASEDIR=$(dirname "$0")

# Send Notification to Bot, Generate Debug Log with Response at basedir.
curl -S -X POST \
  -d chat_id="${CHAT_ID}" \
  -d text="${MESSAGE}" \
  -d parse_mode="HTML" \
  "${TG_WEBHOOK_URL}" -w "\n" | tee -a "${BASEDIR}/notificationsLog.txt"
    # Remove above " | tee -a "${BASEDIR}/notificationsLog.txt" to stop generating a debug log

# Prints an info message in the console
TR_TIME_LOCALTIME=$(date)
echo "[${TR_TIME_LOCALTIME}]-[${TORRENT_NAME}] Download completed. Telegram notification sent."
