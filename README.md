# i3-configs

all the configs for i3WM , and a i3 status bar built from scratch in bash
config.txt ,mystatusbar.sh , screenshot_utility.sh, specifi_area_SS.sh : ~/.config/i3/

###### Picom

- ###### Paste the entire picom folder in ~/.config

###### Alacritty

 Paste the entire Alacritty folder in ~/.config/ folder

**TrackPad Settings**

- paste ```40-libinput.conf```  to  /etc/X11/xorg.conf.d/
  
  ![](/home/anton/git_repo/i3-configs/screenshot/Screenshot%20from%202022-08-14%2014-14-52.png)
  
  ![](/home/anton/git_repo/i3-configs/screenshot/Screenshot%20from%202022-08-14%2014-30-10.png)
  
  :![](/home/anton/git_repo/i3-configs/screenshot/Screenshot%20from%202022-08-14%2014-20-51.png)

![Alt text](https://raw.githubusercontent.com/the-WINTERSOLDIER/i3-configs/main/screenshot/2021-02-02-17%3A30%3A59.png "Status bar built from scratch in bash")
![Alt text](https://raw.githubusercontent.com/the-WINTERSOLDIER/i3-configs/main/screenshot/Screenshot%20from%202022-08-14%2014-12-11.png "screenshot1")
![Alt text](https://raw.githubusercontent.com/the-WINTERSOLDIER/i3-configs/main/screenshot/Screenshot%20from%202022-08-14%2014-14-52.png "screenshot2")
![Alt text](https://raw.githubusercontent.com/the-WINTERSOLDIER/i3-configs/main/screenshot/Screenshot%20from%202022-08-14%2014-20-51.png "screenshot3")
![Alt text](https://raw.githubusercontent.com/the-WINTERSOLDIER/i3-configs/main/screenshot/Screenshot%20from%202022-08-14%2014-30-10.png "screenshot4")

**NOTIFY-SEND**

In fedora  ```notify-send``` command doesnt work out of the box , so fix this problem follow the steps mentioned below.

- install ```notification-daemon using dnf```

- perform a search where that daemon is present by ```find / -type f -name "notification-daemon"``` find the location of that file.

- `cd /usr/share/dbus-1/services ; touch  org.freedesktop.Notifications.service`

- paste ``` [D-BUS Service]
  Name=org.freedesktop.Notifications
  Exec=<PATH OF notification-daemon> ``` and save it .

- Now the `notify-send -u critical "test-message"` will work. 

**DEPENDECY**

-*i3statusbar*

    ↳maim(for screenshot utility)

-*VIM*

    ↳vundle(plugin manger)
