#!/bin/bash
set -e

echo "Aktualizacja systemu..."
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install -y \
    git \
    curl \
    wget \
    unzip \
    htop \
    tree \
    ca-certificates \
    gnupg \
    lsb-release

# Konfiguracja Git
echo "Konfiguracja Git"
read -p "Podaj swoje imię i nazwisko do Git: " git_name
read -p "Podaj swój email do Git: " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"

# Przydatne aliasy
git config --global alias.s "status -s"
git config --global alias.lg "log --oneline --graph --decorate"
git config --global alias.amend "commit --amend --no-edit"
git config --global alias.undo "reset HEAD~1 --mixed"

echo "Git skonfigurowany dla użytkownika $git_name <$git_email>"

# Zapytaj użytkownika o nazwę projektu
read -p "Podaj nazwę projektu: " PROJECT_NAME

# Tworzenie struktury katalogów
echo "Tworzenie struktury projektu $PROJECT_NAME..."
mkdir -p "$PROJECT_NAME/src" "$PROJECT_NAME/docs" "$PROJECT_NAME/tests"
cd "$PROJECT_NAME"

# Inicjalizacja Gita
git init

# Tworzenie README
touch README.md
echo "# $PROJECT_NAME" > README.md

echo "Projekt '$PROJECT_NAME' został utworzony z Git i strukturą katalogów."

echo "Instalacja wymaganych pakietów..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release git

# Add Docker's official GPG key
echo "Dodanie oficjalnego klucza GPG Dockera..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo "Dodanie repozytorium Dockera..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

# Instalacja Dockera i wtyczek
echo "Instalacja Dockera..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Dodanie użytkownika do grupy docker
sudo usermod -aG docker $USER

echo "Instalacja zakończona. Wyloguj się i zaloguj ponownie, aby zmiany grupy docker zadziałały."
