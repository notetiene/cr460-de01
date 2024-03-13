Devoir 1 pour le cours CR460
============================

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Devoir 1 pour le cours CR460](#devoir-1-pour-le-cours-cr460)
  - [Énoncé](#énoncé)
  - [Prérequis](#prérequis)
  - [Installation et configuration de VS Code](#installation-et-configuration-de-vs-code)
  - [Installation et configuration de GitHub Desktop (et Git)](#installation-et-configuration-de-github-desktop-et-git)
    - [Configuration de GitHub Desktop](#configuration-de-github-desktop)

<!-- markdown-toc end -->

## Énoncé
![Diagramme de l’énoncé](./docs/homework_diagram.png)

> **Mise en place d un pipeline CI/CD pour MS Azure**
> En se basant sur le diagramme ci-dessus , construire un pipeline CI/CD vers Microsoft Azure.

## Prérequis
Le playbook inclus a été conçu pour fonctionner sous [Ubuntu 22.04.3](https://releases.ubuntu.com/jammy/).  Il peut (théoriquement) fonctionner avec les distributions dérivées de Debian.  Cependant, prendre note que la présente installation [VS Code](https://code.visualstudio.com/) requiert l’utilisation de [snap](https://snapcraft.io/about).

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
