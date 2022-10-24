#!/bin/bash

if [ "$EUID" != 0 ] #Demande les accès administrateur si l'utilisateur n'est pas super user
then
    sudo "$0" "$@"
    exit $?
fi

if whiptail --title "PostInstall" --yesno "Bienvenue dans le script d'installation PostInstall, ce script installera les paquets nécessaires à l'utilsation de votre distribution linux." 8 78 --yes-button "Continuer" --no-button "Quitter";
then

    sudo apt update -y && sudo apt upgrade -y

    SELECTED=$(whiptail --title "Sélection des paquets à installer" --checklist "Sélectionnez les paquest à installer (il est conseillé d'installer ceux qui sont déjà sélectionnés)" 20 75 10 \
    openssh-client "Pour se connecter via SSH" ON \
    openssh-server "Pour autoriser les connections ssh" OFF \
    php "Pour le développement en php" ON \
    php-curl "Complément pour php" ON \
    php-mbstring "Complément pour php" ON \
    apache2 "Pour l'hébergement web" ON \
    mariadb-client "Pour la création de base données" ON \
    mariadb-server "Pour la création de base données" ON \
    phpmyadmin "Pour la gestion de base données" ON \
    python3 "Pour le développement en python" ON \
    curl "Utilisé pour le téléchargement à disance" ON \
    wget "Utilisé pour le téléchargement de fichiers" ON \
    net-tools "Set d'utilitaires réseau" ON \
    git "Utilisé pour le contrôle de version" ON \
    gcc "Compilateur C" ON \
    g++ "Compilateur C++" ON \
    make "Constructeur de fichiers" ON \
    build-essentials "Essentiels pour la compilation" ON \
    vim "Meilleur éditeur de text" ON \
    htop "top, en mieux" ON 3>&1 1>&2 2>&3) #Redirection de la sortie


    SELECTED=$(echo $SELECTED | sed 's/"//g') #Retire les "" par substitution

    for i in $SELECTED #Pour chaque paquet sélectionné ...
    do
        sudo apt install -y $i
    done

    whiptail --title "Terminé" --msgbox "L'installation des paquets sélectionnés est terminée." 10 50

    if whiptail --title "Paquets supplémentaires" --yesno "Souhaitez vous installer des paquets supplémentaires (non essentiels) ?" 8 78 --yes-button "Oui" --no-button "Non, bloat is bloat";
    then

        SELECTED_OPT=$(whiptail --title "Paquets supplémentaire" --checklist "Les paquets ci-dessous sont nons essentiels et de ce fait ne doivent être installé que si vous avez \"l'utilité\"" 20 65 10 \
        neofetch "Pour montrer à tout le monde votre distro" OFF \
        cowsay "Fait parler une vache, pourquoi pas ?" OFF \
        figlet "Fait de jolis textes en ASCII Art" OFF  3>&1 1>&2 2>&3) #Redirection de la sortie

        SELECTED_OPT=$(echo $SELECTED_OPT | sed 's/"//g') #Retire les "" par substitution
        for i in $SELECTED_OPT
        do
            sudo apt install -y $i
        done

    fi

    whiptail --title "Terminé" --msgbox "L'installation est terminée, merci d'avoir utilisé PostInstall" 10 50

fi