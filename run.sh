#!/bin/bash

set -e  # Exit on any command failure

# Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'  # No Color

function print_step() {
    echo -e "${YELLOW}>>> $1${NC}"
}

function print_success() {
    echo -e "${GREEN}✔ $1${NC}"
}

function print_error() {
    echo -e "${RED}✖ $1${NC}"
}

echo -e "${YELLOW}Starting setup script...${NC}"

# Step 1: Install dependencies
print_step "Updating system and installing dependencies..."
cd
sudo apt update && sudo apt upgrade -y
sudo apt install git screen python3 python3-pip python3-venv -y python3-requests
print_success "Dependencies installed."

# Step 2: Clone repository
print_step "Setting up project repository..."
if [ -d "hyperbolic-chat-ext" ]; then
    print_step "Removing existing repository..."
    rm -rf hyperbolic-chat-ext
fi
git clone https://github.com/themaleem/hyperbolic-chat-ext 
print_success "Repository cloned."


# Step 3:Create a detached screen and starting the chatbot
print_step "Setting up screen session and starting chatbot..."
SCREEN_NAME="hyperbolic-chat"

# check and kill if a screen session exists, else start a screen and run chat
print_step "Check if an existing $SCREEN_NAME screen session exists..."
if screen -list | grep -q "$SCREEN_NAME"; then
    print_success "Screen session $SCREEN_NAME exists. Killing it..."
    screen -S "$SCREEN_NAME" -X quit
    sleep 2
fi

# Show instructions BEFORE entering screen
echo -e "${GREEN}✔ You are about to enter the chatbot screen session.${NC}"
echo -e "${YELLOW}To detach (exit but keep running), press: ${NC}Ctrl+A followed by D"
echo -e "${YELLOW}To reattach later, run: ${NC}screen -r $SCREEN_NAME"
echo -e "${YELLOW}To fully exit, just close the terminal or type 'exit'.${NC}"
echo -e "\nPress Enter to continue..."
read -r  # Wait for user to acknowledge

# Start a new attached screen session running the chatbot
print_step "Starting new attached screen session..."
screen -S "$SCREEN_NAME" bash -c "python3 ~/hyperbolic-chat-ext/chatbot.py; exec bash"


