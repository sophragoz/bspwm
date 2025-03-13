#!/bin/bash

echo "Are you ready? 4 if Yes, 5 if no"
read -p "Type 4 or 5: " choice
if [ "$choice" -eq 4 ]; then
    echo "COOL!"
    
elif [ "$choice" -eq 5 ]; then
    echo "Exiting....."
    exit
else
    echo "False. Type 4 or 5. Exiting"
    exit
fi

echo "Installing git and sudo (if dont installed)"

sudo pacman -S git sudo

# Clone repo git
echo "Cloning git repo...."
git clone https://github.com/sophragoz/bspwm

echo "Hello it's installer of dots bspwm Sophron's"

# Question to the user.
echo "Answer"
echo "1 - only install dots"
echo "2 - install dots and themes, icons, fonts, etc"
echo "3 - Full install with all apps"

# Reading answers of user
read -p "Type 1 or 2 or 3: " choice

# Checking answers and do this
if [ "$choice" -eq 1 ]; then
    echo "Installing....."
    sudo pacman -S bspwm rofi polybar nitrogen lxappearance git zsh nemo picom
    cd bspwm
    cp -r .config ~/
    cp -r .xinitrc ~/
    chmod +x ~/.config/bspwm/bspwmrc
    chmod +x ~/.config/sxhkd/sxhkdrc
    chmod +x ~/.xinitrc
    echo "This is all, restart the system and use the cool dots of sophron. Goodbye! *D"
    
    elif [ "$choice" -eq 2 ]; then
    echo "Installing....."
    sudo pacman -S bspwm rofi polybar nitrogen lxappearance git zsh nemo picom
    cd bspwm
    cp -r .config ~/
    cp -r .xinitrc ~/
    chmod +x ~/.config/bspwm/bspwmrc
    chmod +x ~/.config/sxhkd/sxhkdrc
    chmod +x ~/.xinitrc
    cd
    mkdir ~/.config
    mkdir ~/.icons
    mkdir ~/.themes
    mkdir ~/.fonts
    wget https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v6.1.1/gruvbox-plus-icon-pack-6.1.1.zip
    wget https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip
    git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme
    wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/NerdFontsSymbolsOnly.zip
    unzip gruvbox-plus-icon-pack-6.1.1.zip
    unzip Linux.zip
    unzip JetBrainsMono-2.304.zip
    unzip NerdFontsSymbolsOnly.zip
    cp -r Gruvbox-Plus-Dark ~/.icons/icon
    cp -r Capitaine\ Cursors\ \(Gruvbox\)\ -\ White/ ~/.icons/cursor
    cp -r fonts/ttf/* ~/.fonts/
    cp -r SymbolsNerdFont-Regular.ttf ~/.fonts/
    cd Gruvbox-GTK-Theme/themes
    chmod +x install.sh
    ./install.sh -t default
    wget https://github.com/sachnr/gruvbox-kvantum-themes/releases/download/1.1/Gruvbox-Dark-Blue.tar.gz
    tar -xfv Gruvbox-Dark-blue.tar.gz
    clear
    rm -rf ~/tmp-folder
    echo "This is all, restart the system and use the cool dots of sophron. But dont forgot, themes won't install themselves, so go to lxappearance and select theme/icons/cursor, as well as font. And for qt theme go to kvantum manager, and select the directory with this theme and install. then select it from the list of installed ones. Goodbye! *D"
    elif [ "$choice" -eq 3 ]; then
    sudo pacman -S bspwm rofi polybar nitrogen lxappearance htop neovim git PrismLauncher steam telegram-desktop transmission-gtk openjdk21 krita vlc vscode nvidia nvidia-dkms librewolf eog nemo xournalpp intel-gpu-tools zsh pulseaudio pavucontrol libwebkit2gtk chronyd dhcpcd polkitd unzip psmisc lutris picom
    echo "Installing....."
    cd bspwm
    cp -r .config ~/
    cp -r .xinitrc ~/
    chmod +x ~/.config/bspwm/bspwmrc
    chmod +x ~/.config/sxhkd/sxhkdrc
    chmod +x ~/.xinitrc
    cd
    mkdir ~/.config
    mkdir ~/.icons
    mkdir ~/.themes
    mkdir ~/.fonts
    wget https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v6.1.1/gruvbox-plus-icon-pack-6.1.1.zip
    wget https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip
    git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme
    wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/NerdFontsSymbolsOnly.zip
    unzip gruvbox-plus-icon-pack-6.1.1.zip
    unzip Linux.zip
    unzip JetBrainsMono-2.304.zip
    unzip NerdFontsSymbolsOnly.zip
    cp -r Gruvbox-Plus-Dark ~/.icons/icon
    cp -r Capitaine\ Cursors\ \(Gruvbox\)\ -\ White/ ~/.icons/cursor
    cp -r fonts/ttf/* ~/.fonts/
    cp -r SymbolsNerdFont-Regular.ttf ~/.fonts/
    cd Gruvbox-GTK-Theme/themes
    chmod +x install.sh
    ./install.sh -t default
    wget https://github.com/sachnr/gruvbox-kvantum-themes/releases/download/1.1/Gruvbox-Dark-Blue.tar.gz
    tar -xfv Gruvbox-Dark-blue.tar.gz
    clear
    rm -rf ~/tmp-folder
    
    echo "This is all, restart the system and use the cool dots of sophron. But dont forgot, themes won't install themselves, so go to lxappearance and select theme/icons/cursor, as well as font. And for qt theme go to kvantum manager, and select the directory with this theme and install. then select it from the list of installed ones. Goodbye! *D"
else
    echo "False answer, pick 1 or 2 or 3. Exiting."
fi
