#!/bin/bash

# Header
# --------
# Author: K1M4K-ID
# Description: Multi-function tool for ethical hacking, creating and embedding APK payloads
#              for the Android platform.
# Note: Please include author name when recoding.
# License: Open source
# Version: Latest

host=$(hostname)
path=$(pwd)
mypath="${path}/Malware"

# Date and time
# -------------
bul=$(date +"%B")
tan=$(date +"%d")
tim=$(date +"%T")
yer=$(date +"%Y")
waktu=$(printf "\033[31;1m$bul \033[31;1m$tan \033[37;1m$tim \033[31;1m$yer")

# Clear screen and hide cursor
# ----------------------------
tput civis
clear

# Fungsi animasi teks
animate_text() {
    local text="$1"
    local delay=0

    for ((i = 0; i < ${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep $delay
    done
}

# Fungsi animasi
animate() {
    local text="$1"
    animate_text "$text"
    printf "\n"  # Baris baru untuk memisahkan animasi dari teks berikutnya
    sleep 1
}

# Fungsi untuk memeriksa keberadaan package
check_tools() {
    printf "\033[32;2m"
    animate """
*********************************** GHAT ***********************************
This script is only for educational purposes. Be good K1M4K-ID! 
Use it only on your own ethical hacker!!

Accepted bash version (5.2.15(1)-release). Minimum required version: 4.2

Known compatible distros with this script:
Kali Linux, Parrot Os, Ubuntu

Let's check if you have installed what script needs
    """
    printf "\033[37;1m"
    tools_ok=1

    essential_tools_names=(
        "apktool"
        "adb"
        "scrcpy"
        "zipalign"
        "java"
        "xterm"
        "apksigner"
        "sdkmanager"
    )

    nonessential_tools_names=(
        "apache2"
        "python3"
        "php"
        "ssh"
        "mitmproxy"
        "bettercap"
        "ettercap"
    )

    for tool in "${essential_tools_names[@]}"; do
        printf "%-15s" "$tool"
        
        if command -v "$tool" &>/dev/null; then
            echo -e "\033[32;3m [OK]\e[0m"
            sleep 0.1
        else
            echo -e "\e[31m error! :(\e[0m"
            tools_ok=0
            sleep 0.1
        fi
    done

    if [ $tools_ok -eq 1 ]; then
        printf "\n"
        animate "All essential tools are installed. The script can continue..."
    else
        printf "\n"
        animate "Please install the required tools before running the script."
    fi
    animate "Checking non-essential tools..."
    printf "\n"
    tools_ok=1

    for tool in "${nonessential_tools_names[@]}"; do
        printf "%-15s" "$tool"
        
        if command -v "$tool" &>/dev/null; then
            echo -e "\033[32;3m [OK]\e[0m"
            sleep 0.1
        else
            echo -e "\e[31m error! :(\e[0m"
            tools_ok=0
            sleep 0.1
        fi
    done

    if [ $tools_ok -eq 1 ]; then
        printf "\n"
        animate "All non-essential tools are installed."
    else
        printf "\033[32;2m\n"
        animate """
Certain features may not work without them.
****************************************************************************
                                [Enter] to continue & Ctrl+C to stop program
"""
read x
clear
    fi
    
}

banner() {
    printf "\033[32;3m\n"
    cat << "EOF"
  ▄██████▄     ▄█    █▄       ▄████████     ███     
  ███    ███   ███    ███     ███    ███ ▀█████████▄ 
  ███    █▀    ███    ███     ███    ███    ▀███▀▀██ 
 ▄███         ▄███▄▄▄▄███▄▄   ███    ███     ███   ▀     GreyHat Arsenal Toolkit
▀▀███ ████▄  ▀▀███▀▀▀▀███▀  ▀███████████     ███               K1M4K-ID
  ███    ███   ███    ███     ███    ███     ███     
  ███    ███   ███    ███     ███    ███     ███     
  ████████▀    ███    █▀      ███    █▀     ▄████▀   
                                                     
     ./Welcome to GreyHatArsenal Toolkit (GHAT)

EOF

animate """GreyHatArsenal-Toolkit - Your Multi-Dimensional Hacking Arsenal
Description Tools:
GHAT is intended for ethical hackers, or hackers who use their skills for good.
"""

}

# Animation function
animate_text() {
    local text="$1"
    local delay=0

    for ((i = 0; i < ${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep $delay
    done
}

# Animation function
animate() {
    local text="$1"
    animate_text "$text"
    printf "\n"  # Newline to separate the animation from the next text
    sleep 1
}

# Fancy menu prompt
prompt() {
    printf "\033[1;32m"
    read -p "> " user_input
    printf "\033[0m"
}

# Menu functions with animations
menu1() {
    animate "Loading reconnaissance options..."
    sleep 1
    clear
    banner
    animate_menu "Reconnaissance Menu"
    animate """
    [1]. Scanning Based on Name
    [2]. Scanning Victim's Network {Wireless}
    [3]. Scanning Vulnerabilities on Windows 7
    [4]. Scanning Vulnerabilities on Windows 10
    [5]. Scanning Social Media
    [6]. Whois Scanning
    [7]. Host Scanning
    [x]. Back
    """
    prompt
}

menu2() {
    animate "Loading web application testing tools..."
    sleep 1
    clear
    banner
    animate_menu "Web Application Testing Menu"
    animate """
    [1]. Dirsearch
    [2]. Cmseek
    [3]. Whatweb
    [4]. Automated SQL Injection
    [5]. Sqlmap
    [6]. Subdomain Enumeration
    [7]. WAF Detection
    [8]. AWS Reconnaissance
    [9]. DoS Attack - Hardening
    [x]. Back
    """
    prompt
}

menu3() {
    animate "Loading Android hacking options..."
    sleep 1
    clear
    banner
    animate_menu "Android Hacking Menu"
    animate """
    [1]. Inject Android Payload
    [2]. Inject Android Payload from File
    [3]. Manual Android Payload Injection
    [4]. Create Listener
    [x]. Back
    """
    prompt
}

menu4() {
    animate "Loading wireless hacking tools..."
    sleep 1
    clear
    banner
    animate_menu "Wireless Hacking Menu"
    animate """
    [1]. Wifiphisher
    [2]. Airgeddon
    [3]. Bettercap
    [4]. MitmProxy {Man in the Middle}
    [5]. Evillimiter
    [x]. Back
    """
    prompt
}

menu5() {
    animate "Loading social engineering options..."
    sleep 1
    clear
    banner
    animate_menu "Social Engineering Menu"
    animate """
    [1]. Pyphiser
    [2]. Email Spoofing
    [3]. Location Tracking
    [x]. Back
    """
    prompt
}

menu6() {
    animate "Loading forensic tools..."
    sleep 1
    clear
    banner
    animate_menu "Forensic Menu"
    animate """
    [1]. Photo Forensics
    [x]. Back
    """
    prompt
}

menu7() {
    animate "Loading miscellaneous options..."
    sleep 1
    clear
    banner
    animate_menu "Miscellaneous Menu"
    animate """
    [1]. Install Java 8
    [2]. Fix OBS Black Screen {Linux Only}
    [3]. Install PCSX2
    [x]. Back
    """
    prompt
}

# Main menu function
run() {
    while true; do
        banner
        animate "Select your hacking category: "
        animate """
    [1]. Reconnaissance
    [2]. Web Application Testing
    [3]. Android Hacking
    [4]. Wireless Hacking
    [5]. Social Engineering
    [6]. Forensic
    [7]. Miscellaneous
    [x]. Exit
    """

        prompt

        case $user_input in
            1) menu1 ;;
            2) menu2 ;;
            3) menu3 ;;
            4) menu4 ;;
            5) menu5 ;;
            6) menu6 ;;
            7) menu7 ;;
            x) break ;;
            *) animate "Invalid choice. Please try again." ;;
        esac
    done
}

# Animated menu function
animate_menu() {
    local title="$1"
    animate "------------------------- $title -------------------------"
    sleep 0.5
}

# Welcome animation
animate "Welcome to GHAT - GreyHat Arsenal Toolkit!"
sleep 1
echo
echo
clear
sleep 1

# Check tools
check_tools

# Run main menu
run
