Devoir 1 pour le cours CR460
============================

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Devoir 1 pour le cours CR460](#devoir-1-pour-le-cours-cr460)
  - [Énoncé](#énoncé)
  - [Prérequis](#prérequis)
    - [Installation de jq](#installation-de-jq)
  - [Installation et configuration de VS Code](#installation-et-configuration-de-vs-code)
  - [Installation et configuration de GitHub Desktop (et Git)](#installation-et-configuration-de-github-desktop-et-git)
    - [Configuration de GitHub Desktop](#configuration-de-github-desktop)
    - [GitHub CLI](#github-cli)
      - [Installation de GitHub CLI](#installation-de-github-cli)
      - [Connexion de GitHub CLI (`gh`) au compte GitHub](#connexion-de-github-cli-gh-au-compte-github)
    - [Création d’un dépôt local Git](#création-dun-dépôt-local-git)
      - [Ajout du premier commit](#ajout-du-premier-commit)
    - [Création d’un dépôt distant avec GitHub](#création-dun-dépôt-distant-avec-github)
    - [Mise à jour du dépôt suivi (_remote_)](#mise-à-jour-du-dépôt-suivi-_remote_)
  - [Terraform CLI et Terraform cloud](#terraform-cli-et-terraform-cloud)
    - [Installation de Terraform CLI](#installation-de-terraform-cli)

<!-- markdown-toc end -->

## Énoncé
![Diagramme de l’énoncé](./docs/homework_diagram.png)

> **Mise en place d un pipeline CI/CD pour MS Azure**
> En se basant sur le diagramme ci-dessus , construire un pipeline CI/CD vers Microsoft Azure.

## Prérequis
Le playbook inclus a été conçu pour fonctionner sous [Ubuntu 22.04.3](https://releases.ubuntu.com/jammy/).  Il peut (théoriquement) fonctionner avec les distributions dérivées de Debian.  Cependant, prendre note que la présente installation [VS Code](https://code.visualstudio.com/) requiert l’utilisation de [snap](https://snapcraft.io/about).

### Installation de jq
> 📝 **Note :** Cette étape est nécessaire (ou utile) pour la création automatique d’un _service principal_ en permettant d’extraire des données _JSON_.

Pour n’installer que l’utilitaire `jq`, exécuter localement la commande suivante :

```bash
ansible-playbook --ask-become-pass -v playbook.yml --diff --tags jq
```

<details>
  <summary>Résultats de l’exécution du playbook :</summary>

```console
Using /etc/ansible/ansible.cfg as config file
BECOME password: XXXXXX
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Installation des logiciels du DE01 cours CR460] ******************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************
ok: [localhost]

TASK [Installation de jq] **********************************************************************************************************************************************************************************
Lecture des listes de paquets…
Construction de l'arbre des dépendances…
Lecture des informations d'état…
Les NOUVEAUX paquets suivants seront installés :
  jq
0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.
Il est nécessaire de prendre 52.5 ko dans les archives.
Après cette opération, 102 ko d'espace disque supplémentaires seront utilisés.
Réception de :1 http://gpl.savoirfairelinux.net/pub/mirrors/ubuntu jammy/main amd64 jq amd64 1.6-2.1ubuntu3 [52.5 kB]
52.5 ko réceptionnés en 0s (476 ko/s)
Sélection du paquet jq précédemment désélectionné.
(Lecture de la base de données... 
(Lecture de la base de données... 5%
(Lecture de la base de données... 10%
(Lecture de la base de données... 15%
(Lecture de la base de données... 20%
(Lecture de la base de données... 25%
(Lecture de la base de données... 30%
(Lecture de la base de données... 35%
(Lecture de la base de données... 40%
(Lecture de la base de données... 45%
(Lecture de la base de données... 50%
(Lecture de la base de données... 55%
(Lecture de la base de données... 60%
(Lecture de la base de données... 65%
(Lecture de la base de données... 70%
(Lecture de la base de données... 75%
(Lecture de la base de données... 80%
(Lecture de la base de données... 85%
(Lecture de la base de données... 90%
(Lecture de la base de données... 95%
(Lecture de la base de données... 100%
(Lecture de la base de données... 438132 fichiers et répertoires déjà installés.)
Préparation du dépaquetage de .../jq_1.6-2.1ubuntu3_amd64.deb ...
Dépaquetage de jq (1.6-2.1ubuntu3) ...
Paramétrage de jq (1.6-2.1ubuntu3) ...
Traitement des actions différées (« triggers ») pour man-db (2.10.2-1) ...
changed: [localhost] => {"cache_update_time": 1710052522, "cache_updated": false, "changed": true, "stderr": "", "stderr_lines": [], "stdout": "Lecture des listes de paquets…\nConstruction de l'arbre des dépendances…\nLecture des informations d'état…\nLes NOUVEAUX paquets suivants seront installés :\n  jq\n0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.\nIl est nécessaire de prendre 52.5 ko dans les archives.\nAprès cette opération, 102 ko d'espace disque supplémentaires seront utilisés.\nRéception de :1 http://gpl.savoirfairelinux.net/pub/mirrors/ubuntu jammy/main amd64 jq amd64 1.6-2.1ubuntu3 [52.5 kB]\n52.5 ko réceptionnés en 0s (476 ko/s)\nSélection du paquet jq précédemment désélectionné.\r\n(Lecture de la base de données... \r(Lecture de la base de données... 5%\r(Lecture de la base de données... 10%\r(Lecture de la base de données... 15%\r(Lecture de la base de données... 20%\r(Lecture de la base de données... 25%\r(Lecture de la base de données... 30%\r(Lecture de la base de données... 35%\r(Lecture de la base de données... 40%\r(Lecture de la base de données... 45%\r(Lecture de la base de données... 50%\r(Lecture de la base de données... 55%\r(Lecture de la base de données... 60%\r(Lecture de la base de données... 65%\r(Lecture de la base de données... 70%\r(Lecture de la base de données... 75%\r(Lecture de la base de données... 80%\r(Lecture de la base de données... 85%\r(Lecture de la base de données... 90%\r(Lecture de la base de données... 95%\r(Lecture de la base de données... 100%\r(Lecture de la base de données... 438132 fichiers et répertoires déjà installés.)\r\nPréparation du dépaquetage de .../jq_1.6-2.1ubuntu3_amd64.deb ...\r\nDépaquetage de jq (1.6-2.1ubuntu3) ...\r\nParamétrage de jq (1.6-2.1ubuntu3) ...\r\nTraitement des actions différées (« triggers ») pour man-db (2.10.2-1) ...\r\n", "stdout_lines": ["Lecture des listes de paquets…", "Construction de l'arbre des dépendances…", "Lecture des informations d'état…", "Les NOUVEAUX paquets suivants seront installés :", "  jq", "0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.", "Il est nécessaire de prendre 52.5 ko dans les archives.", "Après cette opération, 102 ko d'espace disque supplémentaires seront utilisés.", "Réception de :1 http://gpl.savoirfairelinux.net/pub/mirrors/ubuntu jammy/main amd64 jq amd64 1.6-2.1ubuntu3 [52.5 kB]", "52.5 ko réceptionnés en 0s (476 ko/s)", "Sélection du paquet jq précédemment désélectionné.", "(Lecture de la base de données... ", "(Lecture de la base de données... 5%", "(Lecture de la base de données... 10%", "(Lecture de la base de données... 15%", "(Lecture de la base de données... 20%", "(Lecture de la base de données... 25%", "(Lecture de la base de données... 30%", "(Lecture de la base de données... 35%", "(Lecture de la base de données... 40%", "(Lecture de la base de données... 45%", "(Lecture de la base de données... 50%", "(Lecture de la base de données... 55%", "(Lecture de la base de données... 60%", "(Lecture de la base de données... 65%", "(Lecture de la base de données... 70%", "(Lecture de la base de données... 75%", "(Lecture de la base de données... 80%", "(Lecture de la base de données... 85%", "(Lecture de la base de données... 90%", "(Lecture de la base de données... 95%", "(Lecture de la base de données... 100%", "(Lecture de la base de données... 438132 fichiers et répertoires déjà installés.)", "Préparation du dépaquetage de .../jq_1.6-2.1ubuntu3_amd64.deb ...", "Dépaquetage de jq (1.6-2.1ubuntu3) ...", "Paramétrage de jq (1.6-2.1ubuntu3) ...", "Traitement des actions différées (« triggers ») pour man-db (2.10.2-1) ..."]}

PLAY RECAP *************************************************************************************************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
</details>

> 💡 **Explications** : Le playbook installe le paquet `jq`.

## Installation et configuration de VS Code
Pour n’installer que VS Code, exécuter localement la commande suivante :

```bash
ansible-playbook --ask-become-pass -v playbook.yml --diff --tags vscode
```

<details>
  <summary>Résultats de l’exécution du playbook :</summary>

```console
Using /etc/ansible/ansible.cfg as config file
BECOME password: XXXXXX
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Installation des logiciels du DE01 cours CR460] ******************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************
ok: [localhost]

TASK [Installation de VSCode] ******************************************************************************************************************************************************************************
changed: [localhost] => {"changed": true, "channel": "latest/stable", "classic": true, "cmd": "['state', 'classic', 'channel', 'dangerous', 'code']", "snap_names": ["code"], "snaps_installed": ["code"]}

PLAY RECAP *************************************************************************************************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
</details>

Aperçu de VS Code sous Ubuntu :

![VS Code](./docs/vscode_window.png)

> 💡 **Explications** : Le playbook Ansible installe le snap nommé _[code](https://snapcraft.io/code)_.

## Installation et configuration de GitHub Desktop (et Git)
Pour n’installer que GitHub Desktop, exécuter la commande suivante :

```bash
ansible-playbook --ask-become-pass -v playbook.yml --diff --tags github-desktop
```

<details>
  <summary>Résultats de l’exécution du playbook :</summary>

```console
Using /etc/ansible/ansible.cfg as config file
BECOME password: XXXXXX
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Installation des logiciels du DE01 cours CR460] ******************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************
ok: [localhost]

TASK [Téléchargement de la clef PGP du dépôt] **************************************************************************************************************************************************************
changed: [localhost] => {"after": ["7FC979028B1997C1", "DE58E9B416EB1F95"], "before": [], "changed": true, "fp": "7FC979028B1997C1", "id": "7FC979028B1997C1", "key_id": "7FC979028B1997C1", "short_id": "8B1997C1"}

ASK [Ajout du dépôt GitHub Desktop] ***********************************************************************************************************************************************************************
changed: [localhost] => {"changed": true, "repo": "deb [arch=amd64 signed-by=/usr/share/keyrings/ansible_shiftkey_repo-archive-keyring.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main", "sources_added": [], "sources_removed": [], "state": "present"}

TASK [Installation de GitHub Desktop] **********************************************************************************************************************************************************************
Lecture des listes de paquets…
Construction de l'arbre des dépendances…
Lecture des informations d'état…
Paquets suggérés :
  gir1.2-gnomekeyring-1.0 libgnome-keyring0
Les NOUVEAUX paquets suivants seront installés :
  github-desktop
0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.
Il est nécessaire de prendre 94.6 Mo dans les archives.
Après cette opération, 345 Mo d'espace disque supplémentaires seront utilisés.
Réception de :1 https://apt.packages.shiftkey.dev/ubuntu any/main amd64 github-desktop amd64 3.3.8-linux1 [94.6 MB]
94.6 Mo réceptionnés en 12s (8052 ko/s)
Sélection du paquet github-desktop précédemment désélectionné.
(Lecture de la base de données... 
(Lecture de la base de données... 5%
(Lecture de la base de données... 10%
(Lecture de la base de données... 15%
(Lecture de la base de données... 20%
(Lecture de la base de données... 25%
(Lecture de la base de données... 30%
(Lecture de la base de données... 35%
(Lecture de la base de données... 40%
(Lecture de la base de données... 45%
(Lecture de la base de données... 50%
(Lecture de la base de données... 55%
(Lecture de la base de données... 60%
(Lecture de la base de données... 65%
(Lecture de la base de données... 70%
(Lecture de la base de données... 75%
(Lecture de la base de données... 80%
(Lecture de la base de données... 85%
(Lecture de la base de données... 90%
(Lecture de la base de données... 95%
(Lecture de la base de données... 100%
(Lecture de la base de données... 436345 fichiers et répertoires déjà installés.)
Préparation du dépaquetage de .../github-desktop_3.3.8-linux1_amd64.deb ...
Dépaquetage de github-desktop (3.3.8-linux1) ...
Paramétrage de github-desktop (3.3.8-linux1) ...
Traitement des actions différées (« triggers ») pour desktop-file-utils (0.26-1ubuntu3) ...
Traitement des actions différées (« triggers ») pour hicolor-icon-theme (0.17-2) ...
Traitement des actions différées (« triggers ») pour gnome-menus (3.36.0-1ubuntu3) ...
Traitement des actions différées (« triggers ») pour mailcap (3.70+nmu1ubuntu1) ...
changed: [localhost] => {"cache_update_time": 1710049877, "cache_updated": false, "changed": true, "stderr": "", "stderr_lines": [], "stdout": "Lecture des listes de paquets…\nConstruction de l'arbre des dépendances…\nLecture des informations d'état…\nPaquets suggérés :\n  gir1.2-gnomekeyring-1.0 libgnome-keyring0\nLes NOUVEAUX paquets suivants seront installés :\n  github-desktop\n0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.\nIl est nécessaire de prendre 94.6 Mo dans les archives.\nAprès cette opération, 345 Mo d'espace disque supplémentaires seront utilisés.\nRéception de :1 https://apt.packages.shiftkey.dev/ubuntu any/main amd64 github-desktop amd64 3.3.8-linux1 [94.6 MB]\n94.6 Mo réceptionnés en 12s (8052 ko/s)\nSélection du paquet github-desktop précédemment désélectionné.\r\n(Lecture de la base de données... \r(Lecture de la base de données... 5%\r(Lecture de la base de données... 10%\r(Lecture de la base de données... 15%\r(Lecture de la base de données... 20%\r(Lecture de la base de données... 25%\r(Lecture de la base de données... 30%\r(Lecture de la base de données... 35%\r(Lecture de la base de données... 40%\r(Lecture de la base de données... 45%\r(Lecture de la base de données... 50%\r(Lecture de la base de données... 55%\r(Lecture de la base de données... 60%\r(Lecture de la base de données... 65%\r(Lecture de la base de données... 70%\r(Lecture de la base de données... 75%\r(Lecture de la base de données... 80%\r(Lecture de la base de données... 85%\r(Lecture de la base de données... 90%\r(Lecture de la base de données... 95%\r(Lecture de la base de données... 100%\r(Lecture de la base de données... 436345 fichiers et répertoires déjà installés.)\r\nPréparation du dépaquetage de .../github-desktop_3.3.8-linux1_amd64.deb ...\r\nDépaquetage de github-desktop (3.3.8-linux1) ...\r\nParamétrage de github-desktop (3.3.8-linux1) ...\r\nTraitement des actions différées (« triggers ») pour desktop-file-utils (0.26-1ubuntu3) ...\r\nTraitement des actions différées (« triggers ») pour hicolor-icon-theme (0.17-2) ...\r\nTraitement des actions différées (« triggers ») pour gnome-menus (3.36.0-1ubuntu3) ...\r\nTraitement des actions différées (« triggers ») pour mailcap (3.70+nmu1ubuntu1) ...\r\n", "stdout_lines": ["Lecture des listes de paquets…", "Construction de l'arbre des dépendances…", "Lecture des informations d'état…", "Paquets suggérés :", "  gir1.2-gnomekeyring-1.0 libgnome-keyring0", "Les NOUVEAUX paquets suivants seront installés :", "  github-desktop", "0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.", "Il est nécessaire de prendre 94.6 Mo dans les archives.", "Après cette opération, 345 Mo d'espace disque supplémentaires seront utilisés.", "Réception de :1 https://apt.packages.shiftkey.dev/ubuntu any/main amd64 github-desktop amd64 3.3.8-linux1 [94.6 MB]", "94.6 Mo réceptionnés en 12s (8052 ko/s)", "Sélection du paquet github-desktop précédemment désélectionné.", "(Lecture de la base de données... ", "(Lecture de la base de données... 5%", "(Lecture de la base de données... 10%", "(Lecture de la base de données... 15%", "(Lecture de la base de données... 20%", "(Lecture de la base de données... 25%", "(Lecture de la base de données... 30%", "(Lecture de la base de données... 35%", "(Lecture de la base de données... 40%", "(Lecture de la base de données... 45%", "(Lecture de la base de données... 50%", "(Lecture de la base de données... 55%", "(Lecture de la base de données... 60%", "(Lecture de la base de données... 65%", "(Lecture de la base de données... 70%", "(Lecture de la base de données... 75%", "(Lecture de la base de données... 80%", "(Lecture de la base de données... 85%", "(Lecture de la base de données... 90%", "(Lecture de la base de données... 95%", "(Lecture de la base de données... 100%", "(Lecture de la base de données... 436345 fichiers et répertoires déjà installés.)", "Préparation du dépaquetage de .../github-desktop_3.3.8-linux1_amd64.deb ...", "Dépaquetage de github-desktop (3.3.8-linux1) ...", "Paramétrage de github-desktop (3.3.8-linux1) ...", "Traitement des actions différées (« triggers ») pour desktop-file-utils (0.26-1ubuntu3) ...", "Traitement des actions différées (« triggers ») pour hicolor-icon-theme (0.17-2) ...", "Traitement des actions différées (« triggers ») pour gnome-menus (3.36.0-1ubuntu3) ...", "Traitement des actions différées (« triggers ») pour mailcap (3.70+nmu1ubuntu1) ..."]}

PLAY RECAP *************************************************************************************************************************************************************************************************
localhost                  : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignores=0
```
</details>

> 💡 **Explications** : Le playbook télécharge premièrement la clef (PGP) d’un dépôt (non-officiel).  Le dépôt est aussi configuré.  Finalement, le paquet `github-desktop` est installé.

### Configuration de GitHub Desktop
En lançant l’application, cliquer sur « _Sign in to GitHub.com_ » :

![GitHub Desktop connexion](./docs/github_desktop_first_page.png)

> ⚠️ **Attention** : Puisque mon navigateur était déjà connecté à GitHub, le processus d’authentification n’était requis.

Remplir les configuration de Git pour GitHub Desktop :

![GitHub Desktop Git](./docs/github_desktop_configure_git.png)

Aperçu de GitHub Desktop sous Ubuntu :

![GitHub Desktop](./docs/github_desktop_window.png)

### GitHub CLI
> 📝 **Note :** Cette étape est requise pour la création automatique de dépôts distants par ligne de commande.

#### Installation de GitHub CLI
Pour n’installer que GitHub CLI, exécuter localement la commande suivante :

```bash
ansible-playbook --ask-become-pass -v playbook.yml --diff --tags github-cli
```

<details>
  <summary>Résultats de l’exécution du playbook :</summary>

```console
Using /etc/ansible/ansible.cfg as config file
BECOME password: XXXXXX
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Installation des logiciels du DE01 cours CR460] ******************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************
ok: [localhost]

TASK [Téléchargement de la clef PGP du dépôt] **************************************************************************************************************************************************************
changed: [localhost] => {"after": ["23F3D4EA75716059", "E5FAF19590714157"], "before": [], "changed": true, "fp": "23F3D4EA75716059", "id": "23F3D4EA75716059", "key_id": "23F3D4EA75716059", "short_id": "75716059"}

TASK [Ajout du dépôt GitHub CLI] ***************************************************************************************************************************************************************************
changed: [localhost] => {"changed": true, "repo": "deb [arch=amd64 signed-by=/usr/share/keyrings/ansible_githubcli_repo-archive-keyring.gpg] https://cli.github.com/packages stable main", "sources_added": [], "sources_removed": [], "state": "present"}

TASK [Installation de GitHub CLI] **************************************************************************************************************************************************************************
Lecture des listes de paquets…
Construction de l'arbre des dépendances…
Lecture des informations d'état…
Les NOUVEAUX paquets suivants seront installés :
  gh
0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.
Il est nécessaire de prendre 0 o/11.3 Mo dans les archives.
Après cette opération, 43.7 Mo d'espace disque supplémentaires seront utilisés.
Sélection du paquet gh précédemment désélectionné.
(Lecture de la base de données... 
(Lecture de la base de données... 5%
(Lecture de la base de données... 10%
(Lecture de la base de données... 15%
(Lecture de la base de données... 20%
(Lecture de la base de données... 25%
(Lecture de la base de données... 30%
(Lecture de la base de données... 35%
(Lecture de la base de données... 40%
(Lecture de la base de données... 45%
(Lecture de la base de données... 50%
(Lecture de la base de données... 55%
(Lecture de la base de données... 60%
(Lecture de la base de données... 65%
(Lecture de la base de données... 70%
(Lecture de la base de données... 75%
(Lecture de la base de données... 80%
(Lecture de la base de données... 85%
(Lecture de la base de données... 90%
(Lecture de la base de données... 95%
(Lecture de la base de données... 100%
(Lecture de la base de données... 437959 fichiers et répertoires déjà installés.)
Préparation du dépaquetage de .../archives/gh_2.45.0_amd64.deb ...
Dépaquetage de gh (2.45.0) ...
Paramétrage de gh (2.45.0) ...
Traitement des actions différées (« triggers ») pour man-db (2.10.2-1) ...
changed: [localhost] => {"cache_update_time": 1710051479, "cache_updated": false, "changed": true, "stderr": "", "stderr_lines": [], "stdout": "Lecture des listes de paquets…\nConstruction de l'arbre des dépendances…\nLecture des informations d'état…\nLes NOUVEAUX paquets suivants seront installés :\n  gh\n0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.\nIl est nécessaire de prendre 0 o/11.3 Mo dans les archives.\nAprès cette opération, 43.7 Mo d'espace disque supplémentaires seront utilisés.\nSélection du paquet gh précédemment désélectionné.\r\n(Lecture de la base de données... \r(Lecture de la base de données... 5%\r(Lecture de la base de données... 10%\r(Lecture de la base de données... 15%\r(Lecture de la base de données... 20%\r(Lecture de la base de données... 25%\r(Lecture de la base de données... 30%\r(Lecture de la base de données... 35%\r(Lecture de la base de données... 40%\r(Lecture de la base de données... 45%\r(Lecture de la base de données... 50%\r(Lecture de la base de données... 55%\r(Lecture de la base de données... 60%\r(Lecture de la base de données... 65%\r(Lecture de la base de données... 70%\r(Lecture de la base de données... 75%\r(Lecture de la base de données... 80%\r(Lecture de la base de données... 85%\r(Lecture de la base de données... 90%\r(Lecture de la base de données... 95%\r(Lecture de la base de données... 100%\r(Lecture de la base de données... 437959 fichiers et répertoires déjà installés.)\r\nPréparation du dépaquetage de .../archives/gh_2.45.0_amd64.deb ...\r\nDépaquetage de gh (2.45.0) ...\r\nParamétrage de gh (2.45.0) ...\r\nTraitement des actions différées (« triggers ») pour man-db (2.10.2-1) ...\r\n", "stdout_lines": ["Lecture des listes de paquets…", "Construction de l'arbre des dépendances…", "Lecture des informations d'état…", "Les NOUVEAUX paquets suivants seront installés :", "  gh", "0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.", "Il est nécessaire de prendre 0 o/11.3 Mo dans les archives.", "Après cette opération, 43.7 Mo d'espace disque supplémentaires seront utilisés.", "Sélection du paquet gh précédemment désélectionné.", "(Lecture de la base de données... ", "(Lecture de la base de données... 5%", "(Lecture de la base de données... 10%", "(Lecture de la base de données... 15%", "(Lecture de la base de données... 20%", "(Lecture de la base de données... 25%", "(Lecture de la base de données... 30%", "(Lecture de la base de données... 35%", "(Lecture de la base de données... 40%", "(Lecture de la base de données... 45%", "(Lecture de la base de données... 50%", "(Lecture de la base de données... 55%", "(Lecture de la base de données... 60%", "(Lecture de la base de données... 65%", "(Lecture de la base de données... 70%", "(Lecture de la base de données... 75%", "(Lecture de la base de données... 80%", "(Lecture de la base de données... 85%", "(Lecture de la base de données... 90%", "(Lecture de la base de données... 95%", "(Lecture de la base de données... 100%", "(Lecture de la base de données... 437959 fichiers et répertoires déjà installés.)", "Préparation du dépaquetage de .../archives/gh_2.45.0_amd64.deb ...", "Dépaquetage de gh (2.45.0) ...", "Paramétrage de gh (2.45.0) ...", "Traitement des actions différées (« triggers ») pour man-db (2.10.2-1) ..."]}

PLAY RECAP *************************************************************************************************************************************************************************************************
localhost                  : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
</details>

> 💡 **Explications** : Le playbook télécharge premièrement la clef (PGP) du dépôt officiel.  Le dépôt est aussi configuré.  Finalement, le paquet `gh` est installé.

#### Connexion de GitHub CLI (`gh`) au compte GitHub
Pour connecter l’utilitaire, exécuter localement cette commande :

```bash
gh auth login
```

<details>
  <summary>Un invite demandera d’utiliser un type de compte.  Choisir d’utiliser GitHub.com :</summary>

```console
? What account do you want to log into?  [Use arrows to move, type to filter]
> GitHub.com
  GitHub Enterprise Server
```
</details>

<details>
  <summary>Choisir l’authentification avec SSH.  Cette méthode est plus sécuritaire :</summary>

```console
? What is your preferred protocol for Git operations on this host?  [Use arrows to move, type to filter]
  HTTPS
> SSH
```
</details>

> ⚠️ **Note :** Étant donné mon utilisation de [gpg-agent](https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3), ce document ne montrera pas le processus de création d’une paire de clefs SSH

<details>
  <summary>Choisir la clef publique SSH à utiliser :</summary>

```console
? Upload your SSH public key to your GitHub account? ~/.ssh/XXXX.pub
```
</details>

<details>
  <summary>Fournir un nom pour la clef publique :</summary>

```console
? Title for your SSH key: GitHub CLI
```
</details>

<details>
  <summary>Utiliser le navigateur pour authentifier GitHub CLI :</summary>

```console
? How would you like to authenticate GitHub CLI?  [Use arrows to move, type to filter]
> Login with a web browser
  Paste an authentication token
```
</details>


<details>
  <summary>Noter le code fourni et appuyer sur <kbd>entrée</kbd> pour ouvrir le navigateur web :</summary>

```console
! First copy your one-time code: XXXX-XXXX
Press Enter to open github.com in your browser...
```
</details>

Entrer le code d’activation :

![Code d’activation GH CLI](./docs/gh_activation_otp.png)

Autoriser l’application (GitHub CLI) à accéder au compte GitHub :

![Autorisation pour GH CLI](./docs/gh_activation_authorization.png)

Suivant la réussite du processus d’autorisation, un message sera affiché :

![Activation de GH CLI](./docs/gh_activation_success.png)

<details>
  <summary>L’utilitaire affichera les actions posées :</summary>

```console
✓ Authentication complete.
- gh config set -h github.com git_protocol ssh
✓ Configured git protocol
✓ SSH key already existed on your GitHub account: ~/.ssh/XXXX.pub
✓ Logged in as notetiene
```
</details>

### Création d’un dépôt local Git
Dans un répertoire, créer un dépôt git :

```bash
REPO_NAME=cr460-de01
mkdir ~/$REPO_NAME && cd ~/$REPO_NAME
git init
```

<details>
  <summary>Résultats de la commande :</summary>

```console
Initialized empty Git repository in /home/etienne/cr460-de01/.git/
```
</details>

> 💡 **Explications** : Cette commande crée et accède à un nouveau répertoire.  Un dépôt vide (Git) est par la suite initialisé.

#### Ajout du premier commit
Pour permettre de créer un premier commit, créer un fichier vide :

```bash
REPO_NAME=cr460-de01
cd ~/$REPO_NAME
touch README.md
```

> 💡 **Explications** : Cette commande crée un fichier vide dans le répertoire du dépôt.

Ajout du fichier vide dans l’index :
```bash
git add README.md
```

(Vérification de l’index (_staging area_))

```bash
git status
```

<details>
  <summary>Résultats de la commande :</summary>

```console
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   README.md
```
</details>

Créer le premier commit :

```bash
git commit -m "Premier commit"
```

> 💡 **Explications** : Cette commande créée un commit avec l’index courant en utilisant le message « Premier commit ».

### Création d’un dépôt distant avec GitHub
Pour créer un dépôt distant, `gh` a été utilisé.

```bash
REPO_NAME=cr460-de01
gh repo create $REPO_NAME --public
```

<details>
  <summary>Le dépôt a été créé :</summary>

```console
✓ Created repository notetiene/cr460-de01 on GitHub
  https://github.com/notetiene/cr460-de01
```
</details>

> 💡 **Explications** : Cette commande créée un dépôt Git public sur le compte lié de GitHub.

Ajout d’une description au dépôt distant :

```bash
gh repo edit notetiene/cr460-de01 --description "Devoir 01 pour le cours CR460"
```

<details>
  <summary>Résultats de la commande :</summary>

```console
✓ Edited repository notetiene/cr460-de01
```
</details>

> 💡 **Explications** : Cette commande configure le message d’affichage du nouveau dépôt créé (GitHub).

### Mise à jour du dépôt suivi (_remote_)
L’URL SSH du dépôt distant doit être récupérée :

```bash
REPO_NAME=cr460-de01
REPO_SSH="$(gh repo view $REPO_NAME --json sshUrl | jq -r '.sshUrl')"
```

> 💡 **Explications** : Cette commande récupère l’URL distant configuré du dépôt sur GitHub (en format JSON).  L’utilitaire `jq` ne récupère que le champs `sshUrl`.

Ajouter le distant (en utilisant le nom `origin`) et l’URL SSH.  Forcer la synchronisation :

```bash
cd ~/$REPO_NAME
git remote add -f origin $REPO_SSH
```

<details>
  <summary>Mise à jour du distant :</summary>

```console
Updating origin
remote: Enumerating objects: 119, done.
remote: Counting objects: 100% (119/119), done.
remote: Compressing objects: 100% (69/69), done.
remote: Total 119 (delta 64), reused 103 (delta 48), pack-reused 0
Receiving objects: 100% (119/119), 684.24 KiB | 4.22 MiB/s, done.
Resolving deltas: 100% (64/64), done.
From github.com:notetiene/cr460-de01
 * [new branch]      main       -> origin/main
```
</details>
Configurer branche en amont par défaut :

```bash
git push --set-upstream origin main
```

<details>
  <summary>Résultats de la commande :</summary>

```console
branch 'main' set up to track 'origin/main'.
Everything up-to-date
```
</details>

## Terraform CLI et Terraform cloud
### Installation de Terraform CLI
Pour n’installer que Terraform, exécuter localement la commande suivante :

```bash
ansible-playbook --ask-become-pass -v playbook.yml --diff --tags terraform
```

<details>
  <summary>Résultats de l’exécution du playbook :</summary>

```console
Using /etc/ansible/ansible.cfg as config file
BECOME password: XXXXXX
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Installation des logiciels du DE01 cours CR460] ******************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************
ok: [localhost]

TASK [Téléchargement de la clef PGP de HashiCorp] **********************************************************************************************************************************************************
changed: [localhost] => {"after": ["AA16FCBCA621E701", "706E668369C085E9"], "before": [], "changed": true, "fp": "AA16FCBCA621E701", "id": "AA16FCBCA621E701", "key_id": "AA16FCBCA621E701", "short_id": "A621E701"}

TASK [Ajout du dépôt de HashiCorp] *************************************************************************************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/ansible_hashicorp.list
@@ -0,0 +1 @@
+deb [arch=amd64 signed-by=/usr/share/keyrings/ansible_hashicorp_archive-keyring.gpg] https://apt.releases.hashicorp.com jammy main

changed: [localhost] => {"changed": true, "repo": "deb [arch=amd64 signed-by=/usr/share/keyrings/ansible_hashicorp_archive-keyring.gpg] https://apt.releases.hashicorp.com jammy main", "sources_added": ["/etc/apt/sources.list.d/ansible_hashicorp.list"], "sources_removed": [], "state": "present"}

TASK [Installation de Terraform] ***************************************************************************************************************************************************************************
Lecture des listes de paquets…
Construction de l'arbre des dépendances…
Lecture des informations d'état…
Les NOUVEAUX paquets suivants seront installés :
  terraform
0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.
Il est nécessaire de prendre 26.9 Mo dans les archives.
Après cette opération, 84.5 Mo d'espace disque supplémentaires seront utilisés.
Réception de :1 https://apt.releases.hashicorp.com jammy/main amd64 terraform amd64 1.7.4-1 [26.9 MB]
26.9 Mo réceptionnés en 3s (7794 ko/s)
Sélection du paquet terraform précédemment désélectionné.
(Lecture de la base de données... 
(Lecture de la base de données... 5%
(Lecture de la base de données... 10%
(Lecture de la base de données... 15%
(Lecture de la base de données... 20%
(Lecture de la base de données... 25%
(Lecture de la base de données... 30%
(Lecture de la base de données... 35%
(Lecture de la base de données... 40%
(Lecture de la base de données... 45%
(Lecture de la base de données... 50%
(Lecture de la base de données... 55%
(Lecture de la base de données... 60%
(Lecture de la base de données... 65%
(Lecture de la base de données... 70%
(Lecture de la base de données... 75%
(Lecture de la base de données... 80%
(Lecture de la base de données... 85%
(Lecture de la base de données... 90%
(Lecture de la base de données... 95%
(Lecture de la base de données... 100%
(Lecture de la base de données... 438148 fichiers et répertoires déjà installés.)
Préparation du dépaquetage de .../terraform_1.7.4-1_amd64.deb ...
Dépaquetage de terraform (1.7.4-1) ...
Paramétrage de terraform (1.7.4-1) ...
changed: [localhost] => {"cache_update_time": 1710051781, "cache_updated": false, "changed": true, "stderr": "", "stderr_lines": [], "stdout": "Lecture des listes de paquets…\nConstruction de l'arbre des dépendances…\nLecture des informations d'état…\nLes NOUVEAUX paquets suivants seront installés :\n  terraform\n0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.\nIl est nécessaire de prendre 26.9 Mo dans les archives.\nAprès cette opération, 84.5 Mo d'espace disque supplémentaires seront utilisés.\nRéception de :1 https://apt.releases.hashicorp.com jammy/main amd64 terraform amd64 1.7.4-1 [26.9 MB]\n26.9 Mo réceptionnés en 3s (7794 ko/s)\nSélection du paquet terraform précédemment désélectionné.\r\n(Lecture de la base de données... \r(Lecture de la base de données... 5%\r(Lecture de la base de données... 10%\r(Lecture de la base de données... 15%\r(Lecture de la base de données... 20%\r(Lecture de la base de données... 25%\r(Lecture de la base de données... 30%\r(Lecture de la base de données... 35%\r(Lecture de la base de données... 40%\r(Lecture de la base de données... 45%\r(Lecture de la base de données... 50%\r(Lecture de la base de données... 55%\r(Lecture de la base de données... 60%\r(Lecture de la base de données... 65%\r(Lecture de la base de données... 70%\r(Lecture de la base de données... 75%\r(Lecture de la base de données... 80%\r(Lecture de la base de données... 85%\r(Lecture de la base de données... 90%\r(Lecture de la base de données... 95%\r(Lecture de la base de données... 100%\r(Lecture de la base de données... 438148 fichiers et répertoires déjà installés.)\r\nPréparation du dépaquetage de .../terraform_1.7.4-1_amd64.deb ...\r\nDépaquetage de terraform (1.7.4-1) ...\r\nParamétrage de terraform (1.7.4-1) ...\r\n", "stdout_lines": ["Lecture des listes de paquets…", "Construction de l'arbre des dépendances…", "Lecture des informations d'état…", "Les NOUVEAUX paquets suivants seront installés :", "  terraform", "0 mis à jour, 1 nouvellement installés, 0 à enlever et 1 non mis à jour.", "Il est nécessaire de prendre 26.9 Mo dans les archives.", "Après cette opération, 84.5 Mo d'espace disque supplémentaires seront utilisés.", "Réception de :1 https://apt.releases.hashicorp.com jammy/main amd64 terraform amd64 1.7.4-1 [26.9 MB]", "26.9 Mo réceptionnés en 3s (7794 ko/s)", "Sélection du paquet terraform précédemment désélectionné.", "(Lecture de la base de données... ", "(Lecture de la base de données... 5%", "(Lecture de la base de données... 10%", "(Lecture de la base de données... 15%", "(Lecture de la base de données... 20%", "(Lecture de la base de données... 25%", "(Lecture de la base de données... 30%", "(Lecture de la base de données... 35%", "(Lecture de la base de données... 40%", "(Lecture de la base de données... 45%", "(Lecture de la base de données... 50%", "(Lecture de la base de données... 55%", "(Lecture de la base de données... 60%", "(Lecture de la base de données... 65%", "(Lecture de la base de données... 70%", "(Lecture de la base de données... 75%", "(Lecture de la base de données... 80%", "(Lecture de la base de données... 85%", "(Lecture de la base de données... 90%", "(Lecture de la base de données... 95%", "(Lecture de la base de données... 100%", "(Lecture de la base de données... 438148 fichiers et répertoires déjà installés.)", "Préparation du dépaquetage de .../terraform_1.7.4-1_amd64.deb ...", "Dépaquetage de terraform (1.7.4-1) ...", "Paramétrage de terraform (1.7.4-1) ..."]}

PLAY RECAP *************************************************************************************************************************************************************************************************
localhost                  : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
</details>

> 💡 **Explications** : Le playbook télécharge premièrement la clef (PGP) du dépôt officiel.  Le dépôt est aussi configuré.  Finalement, le paquet `terraform` est installé.
