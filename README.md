# First DevOps Project

## Opis
Projekt do nauki praktyk DevOps

## Struktura
- `/src` - kod źródłowy
- `/docs` - dokumentacja
- `/tests` - testy

## Konfiguracja
1. Sklonuj repozytorium
- `git clone https://github.com/westcpm13/Devops.git`
2. Zainstaluj zależności
Możesz ręcznie wpisywać wszystkie komendy, aby zainstalować wymagane narzędzia,
lub użyć przygotowanego skryptu setup.sh, który instaluje wszystko automatycznie.
## Konfiguracja automatyczna za pomocą skryptu setup.sh:
Sposób 1: Nadaj uprawnienia i uruchom
```
 chmod +x setup.sh
./setup.sh
```
Sposób 2: Uruchom przez interpreter Bash lub sh
`bash setup.sh`
lub
`sh setup.sh`
## ----------- START Konfiguracja manualna ------------------
**Instalacja Ubuntu/Debian**<br>
`sudo apt update && sudo apt upgrade -y`
<br>**Instalacja narzędzi**<br>
```
sudo apt install -y \
git \
curl \
wget \
unzip \
htop \
tree \
jq
```
**Instlacja dockera**<br>
**Add Docker's official GPG key:**<br>
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
**Add the repository to Apt sources:**<br>
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
```
**Uwaga:** Po instalacji Dockera warto się wylogować i zalogować ponownie, aby zmiany w grupach użytkownika zostały zastosowane.  

<br>**Podstawowa konfiguracja gita**<br>
`git config --global user.name "Twoje Imię"`<br>
`git config --global user.email "twoj.email@example.com"`<br>
<br>**Przydatne aliasy**<br>
`git config --global alias.s "status -s"`<br>
`git config --global alias.lg "log --oneline --graph --decorate"`<br>
`git config --global alias.amend "commit --amend --no-edit"`<br>
`git config --global alias.undo "reset HEAD~1 --mixed"`<br>

`mkdir first-devops-project`<br>
`cd first-devops-project`<br>
<br>**Inicjalizacja Gita**<br>
`git init`

mkdir src docs tests
touch README.md

## -------- Koniec Konfiguracji manulanej -------------------
