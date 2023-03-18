#!/bin/bash

# Bot token
BOT_TOKEN="ADD_YOUR_TELEGRAM_BOT_TOKEN"

# Your chat id
CHAT_ID="ADD_YOUR_TELEGRAM_CHAT_ID"

# Get variables from qbittorrent
TORRENT_NAME="$1"

# Notification message
# If you need a line break, use "%0A" instead of "\n".
MESSAGE="%3Cstrong%3EDownload%20Completed%3C%2Fstrong%3E%0A${TORRENT_NAME}%0A"

# Prepares the request payload
PAYLOAD="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage?chat_id=${CHAT_ID}&text=${MESSAGE}&parse_mode=HTML"

# Sends the notification to the telegram bot and save the response content into the notificationsLog.txt
curl -S -X POST "${PAYLOAD}" -w "\n\n" | tee -a notificationsLog.txt

# Prints a info message in the console
echo "[${TORRENT_NAME}] Download completed. Telegram notification sent."
