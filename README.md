# This is bspwm 

![screen](screenshot.png)

Features:
 - Minimalism
 - Minimal customized programs(kitty,nvim,polybar,wm)
 - For Sonic The Hedgehog's fans

Programs:
 ```bash
 #* Add Keys for repo
 sudo rpm --import https://rpm.librewolf.net/pubkey.gpg
 
 #* Add repositories(vscode/prismlauncher)
 sudo zypper addrepo https://download.opensuse.org/repositories/home:getchoo/openSUSE_Tumbleweed/home:getchoo.repo
 sudo zypper ar -cf https://download.opensuse.org/repositories/devel:/tools:/ide:/vscode/openSUSE_Tumbleweed devel_tools_ide_vscode
 sudo zypper ar -ef https://rpm.librewolf.net librewolf
 sudo zypper ref

 #* install programs
 sudo zypper in bspwm nitrogen rofi polybar lxappearance htop neovim git prismlauncher steam telegram-desktop transmission-gtk java-21-openjdk krita vlc code nvidia-drivers-G06 docker librewolf eog nemo xournalpp intel-gpu-tools zsh pulseaudio pavucontrol libwebkit2gtk-4_1-0
 ```

---
![ad](ad.png)
