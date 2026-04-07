#!/bin/bash
# ============================================
# Script : verif_utilisateur.sh
# Auteur : Fritzel ADJOVI — IPSSI Lille
# Description : Vérifie qu'un utilisateur et
#               un groupe existent sur le système
# ============================================

# Demande des informations
read -p "Entrez un prénom (nom d'utilisateur) : " prenom
read -p "Entrez un groupe : " groupe
read -s -p "Entrez un mot de passe : " motdepasse
echo ""

# Vérifier si l'utilisateur existe déjà
if grep -q "^$prenom:" /etc/passwd; then
    echo "Erreur : L'utilisateur $prenom existe déjà sur le système."
    exit 1
fi

# Vérifier si le groupe existe
if ! grep -q "^$groupe:" /etc/group; then
    echo "Erreur : Le groupe $groupe n'existe pas sur le système."
    exit 1
fi

# Si tout est correct
echo "Bonjour $prenom !"
echo "Vous appartenez au groupe $groupe."
echo "Votre mot de passe a été enregistré."
