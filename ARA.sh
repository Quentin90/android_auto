#!/bin/bash
################################################################################
#                       ARA - Android Reverse Automatisation                   #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################


##Install MobSF
install_mobsf() {

	echo -e "\e[33m############################################################"
        echo -e "#                      MobSF - Installation ...             #"
        echo -e "#############################################################"
        echo "[+] Création des repertoires dans /opt"
        mkdir /opt/ARA_MOBSF
        cd /opt/ARA_MOBSF

        echo "[*] Fetch du repo MobSF"
        apt install git -y &> /dev/null
        git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF --depth=1  &> /dev/null
        cd Mobile-Security-Framework-MobSF

        echo "[*] Installing Python/Python-pip"
        apt install python3-pip -y &> /dev/null
        apt install python3-venv -y &> /dev/null

        echo "[*] Setup de MobSF"
        chmod +x setup.sh
        ./setup.sh &> /dev/null
	echo -e "\e[32m"
        echo -e "##########################################################################"
        echo -e "#                      MOBSF - Installation complete                     #"
        echo -e "########################################################################## \e[39m"

}

##Install Genymotion
install_genymotion(){
        echo -e "\e[33m##########################################################################"
        echo -e "#                      Genymotion - Installation ...                     #"
        echo -e "##########################################################################"

        echo "[*] Téléchargment  de VirtualBox"
        apt install virtualbox -y &> /dev/null

        cho "[*] Installation de virtualbox dans le home"
        cd ~

        echo "[+] Création des repertoires"
        mkdir /opt/ARA_VIRTUALBOX
        cd /opt/ARA_VIRTUALBOX

        echo "[*] Installation de genymotion dans le home"
        cd ~

        echo "[+] Création des repertoires"
        mkdir /opt/ARA_GENYMOTION
        cd /opt/ARA_GENYMOTION

        echo "[*] Installation de Lynx"
        apt install lynx -y &> /dev/null

        echo "[*] Download du binaire Genymotion..."
        binaire=`lynx -dump -listonly https://www.genymotion.com/download/ | grep bin | cut -d " " -f4`
        wget --user-agent='Mozzila' $binaire &> /dev/null
	chmod +x genymotion*
	./geny* -y &> /dev/null

	echo -e "\e[32m########################################################################"
        echo -e "#                      Genymotion - Installation Terminé !             #"
        echo -e "########################################################################\e[39m"


}



## En-tête
intro(){
echo -e "\e[34m################################################################################"
echo -e "#                      ARA - Android reverse Automatisation                    #"
echo -e "################################################################################"

echo -e "\e[33m"

}

##Intro
intro

##Permission check
if [ "$EUID" -ne 0 ]
  then echo "[!] Lancer en tant que super-user"
  exit
fi


## Update repos
apt update &> /dev/null

##Start MobSF Install
install_mobsf


##Start Genymotion Install
install_genymotion

chown -R $USER:$USER /opt/ARA*
