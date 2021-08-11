#!/bin/sh

# Lancement
echo -e "\e[39m"
echo -e "\e[34m============================="
echo -e "\e[39m"
echo -e "\e[36mBienvenue sur votre machine !"
echo -e "\e[39m"
echo -e "\e[34m============================="
echo -e "\e[39m"
echo -e "\e[39m"

# Update et upgrade APT
echo -e "\e[34m=================================================================="
echo -e "\e[39m"
echo -e "\e[33m Mise à jour de la liste des paquets et mise à niveau en cours ..."
echo -e "\e[39m"
echo -e "\e[34m=================================================================="
echo -e "\e[90"
sudo apt update -y && sudo apt upgrade -y
echo -e "\e[39m"
echo -e "\e[32mMise à jour effectuée"
echo -e "\e[39m"
echo -e "\e[39m"

# Installation et affichage de Neofetch
echo -e "\e[34m================================="
echo -e "\e[39m"
echo -e "\e[33mInstallation de neofetch en cours \e[39m"
echo -e "\e[39m"
echo -e "\e[34m================================="
echo -e "\e[39m"
sudo apt install neofetch
echo -e "\e[39m"
echo -e "\e[32mInstallation de neofetch terminée"
echo -e "\e[39m"
echo -e "\e[36mVotre machine : \e[39m"
neofetch
echo -e "\e[39m"
echo -e "\e[39m"

# Installation des paquets auxiliaires
echo -e "\e[34m===================================="
echo -e "\e[39m"
echo -e "\e[33mInstallation des paquets auxiliaires \e[39m"
echo -e "\e[39m"
echo -e "\e[34m===================================="
echo -e "\e[39m"
sudo apt install php apache2 python3 curl wget net-tools mariadb-client mariadb-server phpmyadmin php-curl php-mbstring git
echo -e "\e[39m"
echo -e "\e[39m"

# Fin du script
echo -e "\e[34m====================="
echo -e "\e[39m"
echo -e "\e[32mInstallation terminée"
echo -e "\e[39m"
echo -e "\e[34m====================="
