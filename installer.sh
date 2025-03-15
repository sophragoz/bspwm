#!/usr/bin/env bash

PKGS_DEB="xorg xserver-xorg xinit xserver-xorg-input libinput"
PKGS_ARCH="xorg-server xorg-xinit libinput"
PKGS_SUSE="xorg-x11-server xinit libinput"
PKGS_VOID="xorg xorg-server libinput xinit"
PKGS_TWO_OPT="bspwm rofi polybar nitrogen sxhkd lxappearance zsh nemo picom flameshot neovim dunst jq xdg-desktop-portal-gtk unzip git"

detect_pkg_mngr() {
    if command -v apt-get &> /dev/null; then
        PKG_MGR="apt-get"
    elif command -v yum &> /dev/null; then
        PKG_MGR="yum"
    elif command -v dnf &> /dev/null; then
        PKG_MGR="dnf"
    elif command -v zypper &> /dev/null; then
        PKG_MGR="zypper"
    elif command -v pacman &> /dev/null; then
        PKG_MGR="pacman"
    elif command -v apk &> /dev/null; then
        PKG_MGR="apk"
    else
        echo ":: Not found package manager from available"
        exit 1
    fi
}

inst_pkgs() {
    case $PACKAGE_MANAGER in
        apt-get)
            sudo apt-get update
            sudo apt-get install -y $PKGS_OT_DEB $PKGS_TWO_OPT
            ;;
        zypper)
            sudo zypper install -y $PKGS_OT_SUSE $PKGS_TWO_OPT
            ;;
        pacman)
            sudo pacman -Syu --noconfirm $PKGS_OT_ARCH $PKGS_TWO_OPT
            ;;
	xbps)
 	    sudo xbps-install -Syyu $PKGS_OT_VOID $PKGS_TWO_OPT
        *)
            echo ":: Package manager is not supporting"
            exit 1
            ;;
    esac
}

inst_git() {
    case $PACKAGE_MANAGER in
        apt-get)
            sudo apt-get update
            sudo apt-get install -y git
            ;;
        zypper)
            sudo zypper install -y git
            ;;
        pacman)
            sudo pacman -Syu --noconfirm git
            ;;
	xbps)
 	    sudo xbps-install -Syyu git
        *)
            echo ":: Package manager is not supporting"
            exit 1
            ;;
    esac
}

#dect_distro() {
#    if [ -f /etc/os-release ]; then
#        . /etc/os-release
#       DISTRO=$ID
#    elif [ -f /etc/debian_version ]; then
#        DISTRO="debian"
#    else
#        echo ":: Not found os-release"
#	echo ":: Exiting"
#        exit 1
#    fi
#}

#inst_pkgs() {
#	case $DISTRO in
#		debian|ubuntu|devuan|knoppix)
#			sudo apt update
#			sudo apt install -y $PKGS_OT_DEB $PKGS_TWO_OPT
#			;;
#		arch|artix|manjaro|endeavouros|archman|parabola|hyperbola)
#			sudo pacman -Syu --noconfirm $PKGS_OT_ARCH $PKGS_TWO_OPT
#			;;
#		opensuse)
#			sudo zypper refresh
#			sudo zypper -y in $PKGS_OT_SUSE $PKGS_TWO_OPT
#			;;
#		void)
#			sudo xbps-install -Syyu $PKGS_OT_VOID $PKGS_TWO_OPT
#			;;
#	esac
#}

#inst_git() {
#	case $DISTRO in
#		debian|ubuntu|devuan|knoppix)
#			sudo apt update
#			sudo apt install -y git
#			;;
#		arch|artix|manjaro|endeavouros|archman|parabola|hyperbola)
#			sudo pacman -Syu --noconfirm git
#			;;
#		opensuse)
#			sudo zypper refresh
#			sudo zypper -y in git
#			;;
#		void)
#			sudo xbps-install -Syyu git
#			;;
#	esac	        
#}

agr_and_diss() {
  echo ":: Are you ready? 4 if yes, 5 if no"
  read -p "Type 4 or 5: " select_yes_or_no
  if [ "$select_yes_or_no" -eq 4 ]; then
	  echo ":: Okey"
  elif [ "$select_yes_or_no" -eq 5 ]; then
	  echo ":: Okey, exiting...."
	  exit
  else
	  echo ":: Okey, exiting...."
	  exit
  fi
}

start_script() {
  echo ":: Installer dots Sophron's ::"
  echo "  - Answer"
  echo "  1: only install dots(configs)"
  echo "  2: Install dots and *other"
  echo "  * - themes, icons, etc, and programs(bspwm, polybar, etc)"
  read -p "Type 1 or 2: " var
}

inst_one() {
  echo ":: Installing.."
  mkdir tmp
  cd tmp
  git clone https://github.com/sophragoz/bspwm
  cp -r bspwm/.config ~/
  cp -r bspwm/.xinitrc ~/
  chmod +x ~/.config/bspwm/bspwmrc
  chmod +x ~/.config/sxhkd/sxhkd
  chmod +x ~/.xinitrc
}

inst_qt() {
  echo ":: Install qt theme?"
  echo "4 - yes, 5 - no"
  read -p "Type 4 or 5: " qt_inst_opt
  if [ "$qt_inst_opt" -eq 4 ]; then
	 wget https://github.com/sachnr/gruvbox-kvantum-themes/releases/download/1.1/Gruvbox-Dark-Blue.tar.gz
         tar -xfv Gruvbox-Dark-blue.tar.gz
	 cp -r Documents ~/kvantum-theme
	 echo "::* Qt theme downloaded and copyed ~/kvantum-theme"
 	 echo "::* Launch kvantum manager and install theme."
	 echo "::* select a topic from the list of those available in the program."
	 echo ""
  elif [ "$qt_inst_opt" -eq 5 ]; then
	 echo ""
  else
	 echo ":: False."
  fi
}

inst_nvim() {
  echo "::install vim-plug?"
  echo "4 - yes, 5 - no"
  read -p "Type 4 or 5: " vim_inst_opt
  if [ "$qt_inst_opt" -eq 4 ]; then
	  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	  echo ":: vim-plug installed."
	  echo ":: please run nvim and write :PlugInstall"
	  echo ":: for install gruvbox theme"
  elif [ "$qt_inst_opt" -eq 5 ]; then
	 echo ""
  else
	 echo ":: False."
  fi 
}

inst_two() {
  opt_inst_one
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
  cp -r SymbolsNerdFontMono-Regular.ttf ~/.fonts/
  chmod +x Gruvbox-GTK-Theme/themes/install.sh
  ./Gruvbox-GTK-Theme/themes/install.sh -t default
}

done_inst() {
  cd ..
  rm -rf tmp
  echo ":: Installation is done! Have good a nice day)"
  exit 0
}

addit_info() {
  echo "-> AFTER INSTALLATION"
  echo ":: Run lxappearance to install theme, icons, cursor, and font"
}

install_dots() {
  if [ "$var" -eq 1 ]; then
	agr_and_diss
	inst_git
	inst_one
	inst_nvim
	done_inst
  elif [ "$var" -eq 2 ]; then
	agr_and_diss
	install_pkgs
	inst_two
	inst_qt
	inst_nvim
	addit_info
	done_inst
  else
	echo ":: Okey, exiting...."
	exit
  fi 
}

start_script
install_dots

