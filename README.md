# TP INF 3611 – Automatisation de la création d’utilisateurs

## Description

Ce projet implémente l’automatisation de la création d’utilisateurs sous Linux en utilisant :
- un script **Bash**
- un playbook **Ansible**
- un exécuteur **Terraform**

Les fichiers des utilisateurs proviennent tous du fichier source `users.txt` ou `users.yml`.

Chaque utilisateur reçoit automatiquement un **mail contenant :**
- une formule de politesse  
- l’adresse IP du serveur  
- le port SSH (sécurisé)  
- son login  
- un mot de passe temporaire  

Le port SSH est modifié pour renforcer la sécurité.

## Arborescence

TP-INF3611-SysAdmin/
│
├── 1-Script-Bash/
│   ├── create_users.sh
│   └── users.txt
│
├── 2-Ansible/
│   ├── create_users.yml
│   ├── hosts.ini
│   └── users.yml
│
├── 3-Terraform/
│   ├── main.tf
│   └── variables.tf
│
└── README.md

## Sécurité SSH appliquée

Dans `/etc/ssh/sshd_config`, les paramètres suivants sont appliqués :
- Port 2222
- PermitRootLogin no
- PasswordAuthentication yes
- MaxAuthTries 3
- ClientAliveInterval 300
- LoginGraceTime 20
- AllowUsers alice bob

## Exécution

### 1. Bash

cd 1-Script-Bash
sudo bash create_users.sh

### 2. Ansible

cd 2-Ansible
ansible-playbook -i hosts.ini create_users.yml

### 3. Terraform

cd 3-Terraform
terraform init
terraform apply

## Auteurs
BENFIANG Michael James – Étudiant en L3 Informatique – Spécialité Réseaux (Université de Yaoundé I)
