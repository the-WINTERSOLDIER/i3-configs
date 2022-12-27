# i3-configs

all the configs for i3WM , and a i3 status bar built from scratch in bash
config.txt ,mystatusbar.sh , screenshot_utility.sh, specifi_area_SS.sh : ~/.config/i3/

###### Picom

- ###### Paste the entire picom folder in ~/.config

###### Alacritty

 Paste the entire Alacritty folder in ~/.config/ folder

**TrackPad Settings**

- paste ```40-libinput.conf```  to  /etc/X11/xorg.conf.d/

**Screenshots**
![Screenshot from 2022-08-14 14-12-11](https://user-images.githubusercontent.com/29229288/209707314-0affa6ae-7f64-4ffe-ba7e-7e037fc4e385.png)
![Screenshot from 2022-08-14 14-14-52](https://user-images.githubusercontent.com/29229288/209707318-1b700d85-4dfa-408c-ac56-3ac75adada25.png)
![Screenshot from 2022-08-14 14-20-51](https://user-images.githubusercontent.com/29229288/209707323-8934336c-8044-4a8b-9378-d391f7a44217.png)
![Screenshot from 2022-08-14 14-30-10](https://user-images.githubusercontent.com/29229288/209707331-9830089a-4839-4dff-b112-06eed0972a0f.png)



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
