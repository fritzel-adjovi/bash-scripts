#!/bin/bash
# ============================================
# Script : verification_user_env.sh
# Auteur : Fritzel ADJOVI — IPSSI Lille
# Description : Utilise la variable d'env
#   USER_FILE pour vérifier les utilisateurs
# Usage  : export USER_FILE=/etc/passwd
#           ./verification_user_env.sh
# ============================================

# Vérifier que la variable d'environnement USER_FILE est définie
if [ -z "$USER_FILE" ]; then
    echo "Erreur : La variable d'environnement USER_FILE n'est pas définie."
    echo "Usage : export USER_FILE=/etc/passwd"
    exit 1
fi

# Vérifier que le fichier existe
if [ ! -f "$USER_FILE" ]; then
    echo "Erreur : Le fichier $USER_FILE n'existe pas."
    exit 1
fi

# Boucle pour demander un prénom valide
while true; do
    read -p "Entrez un prénom (nom d'utilisateur) : " prenom

    if grep -q "^$prenom:" "$USER_FILE"; then
        echo "Erreur : L'utilisateur $prenom existe déjà."
    else
        echo "Le prénom $prenom est valide et n'existe pas sur le système."
        break
    fi
done
