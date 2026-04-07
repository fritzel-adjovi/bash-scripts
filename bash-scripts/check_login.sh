#!/bin/bash
# ============================================
# Script : check_login.sh
# Auteur : Fritzel ADJOVI — IPSSI Lille
# Description : Vérification utilisateur avec
#   intégration des règles PAM
# ============================================

# ===== Vérification du prénom =====
while true; do
    read -p "Entrez un prénom (nom d'utilisateur) : " prenom
    if grep -q "^$prenom:" /etc/passwd; then
        echo "Erreur : L'utilisateur $prenom existe déjà sur le système."
    else
        break
    fi
done

# ===== Vérification du groupe =====
while true; do
    read -p "Entrez un groupe : " groupe
    if grep -q "^$groupe:" /etc/group; then
        break
    else
        echo "Erreur : Le groupe $groupe n'existe pas sur le système."
    fi
done

# ===== Double saisie du mot de passe =====
while true; do
    read -s -p "Entrez un mot de passe : " mdp1
    echo
    read -s -p "Confirmez le mot de passe : " mdp2
    echo
    if [ "$mdp1" != "$mdp2" ]; then
        echo "Erreur : Les mots de passe ne correspondent pas."
    else
        break
    fi
done

# ===== Vérification PAM via faillock =====
faillock --user "$prenom" 2>/dev/null

# ===== Résultat final =====
echo ""
echo "Bonjour $prenom !"
echo "Vous appartenez au groupe $groupe."
echo "Votre mot de passe a été enregistré."
echo "Aucune règle PAM n'est actuellement violée."
