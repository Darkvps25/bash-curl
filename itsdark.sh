#!/bin/bash

clear

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

title() {
  clear
  echo -e "${CYAN}"
  echo "██╗████████╗███████╗██████╗  █████╗ ██████╗ ██╗  ██╗"
  echo "██║╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝"
  echo "██║   ██║   ███████╗██║  ██║███████║██████╔╝█████╔╝ "
  echo "██║   ██║   ╚════██║██║  ██║██╔══██║██╔══██╗██╔═██╗ "
  echo "██║   ██║   ███████║██████╔╝██║  ██║██║  ██║██║  ██╗"
  echo "╚═╝   ╚═╝   ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝"
  echo -e "${NC}"
  echo "          ItsDark VPS & Panel Installer"
  echo
}

pause() {
  read -p "Press Enter to continue..."
}

main_menu() {
  title
  echo "1) VPS Create"
  echo "2) Panel Install"
  echo "0) Exit"
  echo
  read -p "Select option: " choice

  case $choice in
    1) vps_menu ;;
    2) panel_menu ;;
    0) exit ;;
    *) main_menu ;;
  esac
}

vps_menu() {
  title
  echo "VPS OS Options"
  echo
  echo "1) Ubuntu 24.04 (Latest)"
  echo "2) Debian 9"
  echo "3) Debian 13"
  echo "0) Back"
  echo
  read -p "Select OS: " os

  case $os in
    1) echo -e "${GREEN}Selected Ubuntu 24.04${NC}" ;;
    2) echo -e "${GREEN}Selected Debian 9${NC}" ;;
    3) echo -e "${GREEN}Selected Debian 13${NC}" ;;
    0) main_menu ;;
    *) vps_menu ;;
  esac

  echo
  echo -e "${RED}NOTE:${NC} OS installation must be done via VPS provider API or panel."
  echo "This script can be extended with provider APIs (Hetzner, DO, etc.)"
  pause
  main_menu
}

panel_menu() {
  title
  echo "Panel Options"
  echo
  echo "1) Pterodactyl Panel"
  echo "2) Airlink Panel"
  echo "0) Back"
  echo
  read -p "Select Panel: " panel

  case $panel in
    1) install_ptero ;;
    2) install_airlink ;;
    0) main_menu ;;
    *) panel_menu ;;
  esac
}

install_ptero() {
  title
  read -p "Enter your domain (panel.example.com): " DOMAIN

  echo
  echo -e "${GREEN}Installing Pterodactyl Panel on $DOMAIN${NC}"
  echo

  bash <(curl -s https://pterodactyl-installer.se)

  pause
  main_menu
}

install_airlink() {
  title
  read -p "Enter your domain (panel.example.com): " DOMAIN

  echo
  echo -e "${GREEN}Installing Airlink Panel on $DOMAIN${NC}"
  echo

  # Placeholder (replace with real Airlink installer)
  echo "Airlink installer not official."
  echo "Add install commands here."

  pause
  main_menu
}

main_menu
