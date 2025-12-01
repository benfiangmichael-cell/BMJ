#!/bin/bash

USER_FILE="users.txt"
SERVER_IP="YOUR.SERVER.IP"
SSH_PORT="2222"
MAIL_SENDER="admin@serveur.com"

TOTAL_RAM=$(grep MemTotal /proc/meminfo | awk '{print $2}')
LIMIT_RAM=$(($TOTAL_RAM * 20 / 100))K

while IFS=";" read -r username password full phone shell
do
    echo "[INFO] Création de l'utilisateur $username..."

    useradd -m -s "$shell" -c "$full, $phone" "$username"

    echo "$username:$password" | chpasswd -e

    chage -d 0 "$username"

    usermod -aG sudo "$username"

    setquota -u "$username" 15728640 15728640 0 0 /

    echo -e "[Service]\nMemoryMax=$LIMIT_RAM" > /etc/systemd/system/user-$username.slice
    systemctl daemon-reload

    echo -e "Bonjour $full,\n\nVotre compte a été créé.\nVoici vos informations de connexion :\nIP: $SERVER_IP\nPort SSH: $SSH_PORT\nUtilisateur: $username\n\nVeuillez changer votre mot de passe à la première                 connexion.\n\nCordialement,\nVotre Administrateur Système" \
        | mail -s "Informations de connexion" "$username@example.com"

    echo "[OK] $username créé."
done < "$USER_FILE"


#Exemple fonctionnel

#michael;$6$FDFE22...HASH...;Michael NDE;+237654000000;/bin/bash
#jean;$6$A7GF8H...HASH...;Jean NDE;+237650000000;/bin/zsh
