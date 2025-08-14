#!/bin/bash

set -e

THEMES_DIR="$HOME/.themes"
ICONS_DIR="$HOME/.icons"
WORKDIR="$(pwd)"

echo "\n[+] Creando carpetas de temas e iconos si no existen..."
mkdir -p "$THEMES_DIR" "$ICONS_DIR"

printf "\n[+] Creando carpetas de temas e iconos si no existen...\n"
mkdir -p "$THEMES_DIR" "$ICONS_DIR"

printf "\n[+] Clonando y aplicando temas GTK...\n"
git clone --depth=1 https://github.com/vinceliuice/Layan-gtk-theme.git
cd Layan-gtk-theme
./install.sh -d "$THEMES_DIR"
cd "$WORKDIR"
rm -rf Layan-gtk-theme

git clone --depth=1 https://github.com/vinceliuice/Orchis-theme.git
cd Layan-gtk-theme
if [ ! -f install.sh ] || [ ! -x install.sh ]; then
    echo "Error: install.sh not found or not executable in $(pwd)"
    exit 1
fi
./install.sh -d "$THEMES_DIR"
cd "$WORKDIR"
rm -rf Layan-gtk-theme

git clone --depth=1 https://github.com/vinceliuice/Orchis-theme.git
cd Layan-gtk-theme
if [ ! -x install.sh ]; then
    echo "Error: install.sh no existe o no es ejecutable en Layan-gtk-theme." >&2
    cd "$WORKDIR"
    rm -rf Layan-gtk-theme
    exit 1
fi
./install.sh -d "$THEMES_DIR"
cd "$WORKDIR"
rm -rf Layan-gtk-theme

git clone --depth=1 https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
if [ ! -x install.sh ]; then
    echo "Error: install.sh no existe o no es ejecutable en Orchis-theme." >&2
    cd "$WORKDIR"
    rm -rf Orchis-theme
    exit 1
fi
if [ ! -f install.sh ] || [ ! -x install.sh ]; then
    echo "Error: install.sh not found or not executable in $(pwd)"
    exit 1
fi
./install.sh -d "$THEMES_DIR"
cd "$WORKDIR"
rm -rf Orchis-theme

printf "\n[+] Clonando y aplicando temas de iconos...\n"
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh -d "$ICONS_DIR"
cd "$WORKDIR"
rm -rf WhiteSur-icon-theme

git clone --depth=1 https://github.com/vinceliuice/Fluent-icon-theme.git
cd Fluent-icon-theme
./install.sh -d "$ICONS_DIR"
cd "$WORKDIR"
rm -rf Fluent-icon-theme

printf "\n[✔] Personalización completada. Puedes seleccionar los temas e iconos desde la configuración de XFCE.\n"
