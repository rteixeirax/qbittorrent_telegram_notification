# Bash script that sends a message to the telegram bot after the qbittorrent finishes downloading a torrent.

#### Bash script [here](https://github.com/ricardotx/qbittorrent_telegram_notification/blob/master/src/qbittorrent_telegram_notification.sh)

### Instructions:

* Create a folder to put yout script
    
    `sudo mkdir qbittorrent`

 * Give all the permissions to that folder
   
   `sudo chmod -R 777 /qbittorrent`

* Allow the execution of the script

   `sudo chmod +rx qbittorrent_telegram_notification.sh`

* Open the qbittorrent settings on web ui, go to options and add the script path

![image](https://github.com/ricardotx/qbittorrent_telegram_notification/blob/master/assets/webUi.png)


**Note:** *You can access to the parameters inside the script by `$1`, `$2`, and so on. (i.e: `TORRENT_NAME="$1"`)*
