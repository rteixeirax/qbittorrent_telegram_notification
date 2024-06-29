# qBittorrent Telegram Notification Script.

Linux and MacOS supported (idk about Windows, why would you use bash on windows?)

### qBittorrent Setup:

* Create a directory for the scripts located in the release (can be downloaded raw), We'll assume that the directory is (MacOS Dir)
  
  ` /Users/%user%/Documents/qBittorrent/TelegramNotification/`

* Copy both "qbittorrent_telegram_notification.sh" and "bot_credentials.sh" into the folder

* Make sure the script has execute permissions via chmod or xattr on mac

* Open the qBittorrent settings on Desktop or WebUI > Settings > Downloads > Scroll to the bottom and tick the box that says "Run on torrent finished"
  
* Add the path of the script along with the required parameters such as `/Users/%user%/Documents/qBittorrent/TelegramNotification/qbittorrent_telegram_notification.sh “%N” “%L” “%Z” "%T"`.

* The script has been modified to allow you to also pass “%T”

* Do not that on MacOS you will have to add "sh" at the beginning of the path to ensure that it is launched which will look like this `sh /Users/%user%/Documents/qBittorrent/TelegramNotification/qbittorrent_telegram_notification.sh “%N” “%L” “%Z”`.

**Note:** *You can add additional parameters inside the script by `$1`, `$2`, and so on. (i.e: `TORRENT_NAME="$1"`) $1 and $2 indicate the position of the paramaters in order so if the paramter you want is 4th in line after “%N” “%L” “%Z” you will specify `PARAMETER="$4"` 4 representing that it is fourth in line*

#### By default the following paramters are available:
* `“%N”` = Name
* `“%L”` = Category
* `“%Z”` = Torrent size (bytes) [This is converted into MB or GB later on, if it fails it will print a fail message on the notification]
* `"%T"` = Current Tracker

### Setting up the Telegram Bot
* First you'll need to message "BotFather" and using the menu or text type /newbot, it'll put you through an interactive menu,
* Once you have your bot, copy HTTP API token it generated in the chat to the `bot_credentials.sh` file on the first line "BOT_TOKEN="
* Next you'll need to either go to the bot profile or create a group or channel, access this channel via web browser and on the URL you'll see something like `https://web.telegram.org/k/#XXXXXXXXX`
* Copy everything after the # and paste it into the 2nd line that has the "CHAT_ID=" in the `bot_credentials.sh`, some blogs state that this should be a purely numeric value however if you have a special character this is fine too.

  Finish.

  I may or may not update this in the future for the messages to use a table instead however they look neat as is and accept long file names with spaces in between unlike the original crap.
