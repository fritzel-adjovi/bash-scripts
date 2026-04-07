#!/bin/bash
# ============================================
# Script : verification_boucles.sh
# Auteur : Fritzel ADJOVI — IPSSI Lille
# Description : Vérification avec boucles,
#   conditions et double saisie mot de passe
# ============================================

# ===== Vérification du prénom (utilisateur) =====
while true; do
    read -p "Entrez un prénom (nom d'utilisateur) : " prenom
    if grep -q "^$prenom:" /etc/passwd; then
        echo "Erreur : L'utilisateur $prenom existe déjà sur le système."
        echo "Veuillez saisir un autre prénom."
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
        echo "Veuillez saisir un groupe valide."
    fi
done

# ===== Vérification du mot de passe =====
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

# ===== Affichage final =====
echo ""
echo "Bonjour $prenom !"
echo "Vous appartenez au groupe $groupe."
echo "Votre mot de passe a été enregistré."
