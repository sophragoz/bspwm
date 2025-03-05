# This is bspwm

![screen](screen.png)

Features:
 - Minimalism
 - Minimal customized programs(kitty,nvim,polybar,wm)
 - BORDERS! MORE BORDERS!

Themes for:
 - Telegram: [click](https://github.com/indev29/telegram-gruvbox)
 - Icons: [click](https://github.com/SylEleuth/gruvbox-plus-icon-pack)
 - gtk: [click](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme)
 - kvantum(aka qt5/6): [click](https://github.com/sachnr/gruvbox-kvantum-themes)
 - cursor: [click](https://store.kde.org/p/1818760)
 - Obsidian: [click](https://github.com/insanum/obsidian_gruvbox)
 - code OSS(vscode): [click](https://github.com/jdinhify/vscode-theme-gruvbox)
 - Steam: [click](https://flathub.org/apps/io.github.Foldex.AdwSteamGtk)

Programs:
 ```bash
 #* Add repositories(non-free/multilib)
 sudo xbps-install void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
 echo 'repository=https://github.com/index-0/librewolf-void/releases/latest/download/' > /etc/xbps.d/20-librewolf.conf
 sudo xbps-install -Syyu

 #* install programs
 sudo xbps-install bspwm rofi polybar nitrogen lxappearance htop neovim git PrismLauncher steam telegram-desktop transmission-gtk openjdk21 krita vlc vscode nvidia nvidia-dkms librewolf eog nemo xournalpp intel-gpu-tools zsh pulseaudio pavucontrol libwebkit2gtk chronyd dhcpcd polkitd

 #* Enable services
 sudo ln -s /etc/sv/dhcpcd /var/service/
 sudo ln -s /etc/sv/chrony /var/service/
 sudo ln -s /etc/sv/alsa /var/service/
 sudo ln -s /etc/sv/polkitd /var/service/
 ```

To-Do:
 - Create bash script for installation dots.

# WARNING: this is dots is updating, they can become different and not look like in unixporn.
