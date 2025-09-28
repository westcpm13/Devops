# Baza Ubuntu
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Aktualizacja systemu i instalacja potrzebnych narzędzi
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git curl wget unzip htop tree jq ca-certificates nano && \
    rm -rf /var/lib/apt/lists/*

# Skopiowanie całego projektu do kontenera
WORKDIR /app
COPY . /app

# Domyślne polecenie po uruchomieniu kontenera
CMD bash -c "echo 'Katalogi w projekcie:' && ls -l /app && exec bash"
