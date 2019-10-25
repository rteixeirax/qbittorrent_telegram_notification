# Bash script that sends a message to the telegram bot after the qbittorrent finishes downloading a torrent.

## Instructions:

* Create a folder to put yout script
    
    `sudo mkdir qbittorrent`

 * Give all the permissions to that folder
   
   `sudo chmod -R 777 /qbittorrent`

* Allow the execution of the script

   `sudo chmod +rx qbittorrent_telegram_notification.sh`

* Open the qbittorrent settings on web ui, go to options and add the script path

![image](https://gitlab.com/ricardotx/transmission-telegram-notifications/uploads/4a0e09c40beebecb710294a62a2b79e5/image.png)


**Note:** *You can access to the parameters inside the script by `$1`, `$2`, and so on. (i.e: `TORRENT_NAME="$1"`)*
