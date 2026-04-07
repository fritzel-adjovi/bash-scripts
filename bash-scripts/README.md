#  Bash Scripts — Gestion d'utilisateurs Linux

Scripts Bash développés dans le cadre de ma formation **Bachelor Administrateur Infrastructure Sécurisée** à l'IPSSI Lille (2025/2026).

## 📁 Contenu du dépôt

| Script | Description |
|--------|-------------|
| `info_utilisateur.sh` | Demande nom, groupe et mot de passe à l'utilisateur |
| `verif_utilisateur.sh` | Vérifie qu'un utilisateur/groupe n'existe pas déjà |
| `verification_boucles.sh` | Vérification avec boucles + double saisie mot de passe |
| `verification_user_env.sh` | Utilisation de la variable d'environnement `USER_FILE` |
| `check_login.sh` | Intégration des règles PAM dans la vérification |

##  Utilisation

```bash
# Cloner le dépôt
git clone https://github.com/fritzel-adjovi/bash-scripts.git
cd bash-scripts

# Rendre les scripts exécutables
chmod +x *.sh

# Exécuter un script
./verification_boucles.sh
```

##  Prérequis

- Système Linux (Ubuntu 24.04 recommandé)
- Bash 5.x
- Droits sudo pour certains scripts

##  Détail des scripts

### `verification_boucles.sh`
Script interactif qui vérifie :
1. Que le nom d'utilisateur n'existe pas déjà sur le système
2. Que le groupe saisi existe bien
3. Que l'utilisateur entre deux fois le même mot de passe

### `verification_user_env.sh`
Utilise la variable d'environnement `USER_FILE` pointant vers `/etc/passwd` pour vérifier l'existence d'un utilisateur.

```bash
# Définir la variable avant d'exécuter
export USER_FILE=/etc/passwd
./verification_user_env.sh
```

### `check_login.sh`
Intègre une vérification PAM (Pluggable Authentication Modules) dans le processus de validation.

## 👨‍💻 Auteur

**Fritzel ADJOVI** — IPSSI Lille 2025/2026  
[LinkedIn](https://www.linkedin.com/in/fritzel-adjovi-a95203386) · [GitHub](https://github.com/fritzel-adjovi)
