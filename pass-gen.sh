#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
RESET='\033[0m' # Reset color

# Function to display colorful text
color_text() {
    local color="$1"
    local text="$2"
    echo -e "${color}${text}${RESET}"
}

# Function to display ASCII art with figlet
ascii_art() {
    local text="$1"
    local font="$2"
    figlet -f "$font" "$text"
}

# Main header content
clear
echo -e "${RED}"
ascii_art "Pass-Gen" "slant"
echo -e "${CYAN}"
color_text "${CYAN}" "   ===================================="
color_text "${CYAN}" "   || Version: 1.0                   ||"
color_text "${CYAN}" "   || Author: @Venom                 ||"
color_text "${CYAN}" "   || github: github.com/venom-x-999 ||"
color_text "${CYAN}" "   || instagram: iamraja_210         ||"
color_text "${CYAN}" "   ===================================="
echo -e "${RESET}"



# Additional content or menu options can be added here
echo ""
echo -e "${YELLOW}" "Only Decimal Password Generator"
echo ""
echo -e "${GREEN}" "Choose an option"
echo " ----------------"
echo ""
echo -e "${RESET}"
echo "1. Generate Password"
echo "2. Exit"

# Prompt the user for input
read -p "Enter your option: " user_input

# Perform actions based on the user input
if [[ $user_input -eq 1 ]]; then
    # Function to generate password list and save to a file
    generate_password_list() {
    	local length=$1
    	local max_number=$((10**length - 1))
    	local format="%0${length}d"

    	# Determine the unique filename
    	local counter=1
    	while [[ -e "pass${counter}.txt" ]]; do
        	((counter++))
    	done
    	local filename="pass${counter}.txt"

    	# Generate the password list and save to the file
    	for i in $(seq 0 $max_number); do
       	         printf "$format\n" $i >> "$filename"
        done

        echo "Password list saved to $filename"
    }

    # Read user input
    read -p "Enter the length of password: " digits

    # Validate input
    if ! [[ $digits =~ ^[0-9]+$ ]] || [[ $digits -lt 1 ]]; then
    	echo "Please enter a valid positive integer."
    	exit 1
    fi

    # Generate and save the password list

    generate_password_list $digits

elif [[ $user_input -eq 2 ]]; then
    echo "Exiting..."
    exit 0
else
    echo "Invalid input. Please enter 1 or 2."
fi

