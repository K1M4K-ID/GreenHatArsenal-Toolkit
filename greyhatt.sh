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
mypath="${path}/tmp"

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
    printf "\033[37;3m"
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
        "nmap"
    )

    for tool in "${essential_tools_names[@]}"; do
        printf "\033[37;3m%-15s" "$tool"
        
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
Make sure you have installed all the dependencies needed to run the script
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
    printf "\033[32;3m"
    read -p "> " user_input
    printf "\033[32;3m"
}

# Menu functions with animations
menu1() {
    animate "Loading reconnaissance options..."
    sleep 1
    clear
    banner
    animate_menu "Reconnaissance Menu"
    animate """
    [1]. Scanning Vulnerabilities on Windows 7
    [2]. Scanning Vulnerabilities on Windows 10
    [x]. Back
    """
    prompt
    case $user_input in
            1) scan_vulnerability_windows7;;
            2) scan_vulnerability_windows10;;
            x) break ;;
            *) animate "Invalid choice. Please try again." ;;
    esac
}
# Fungsi scanning vulnerability Windows 7
scan_vulnerability_windows7() {
    clear
    banner
    animate_menu "Scanning Vulnerabilities on Windows 7"
    animate "Enter target IP address:"
    prompt

    target="$user_input"

    animate "Running Nmap script smb-vuln-ms17-010 on $target..."
    sleep 1

    # Menjalankan Nmap script smb-vuln-ms17-010
    nmap_result=$(nmap -p445 --script smb-vuln-ms17-010 "$target")

    # Menampilkan hasil scanning
    echo -e "\nNmap Scan Results for $target:\n"
    echo "$nmap_result"

    animate "Scanning completed."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu reconnaissance
    animate "Options:"
    animate "[1]. Continue scanning"
    animate "[2]. Back to reconnaissance menu"
    prompt

    case $user_input in
        1)
            scan_vulnerability_windows7
            ;;
        2)
            menu1
            ;;
        *)
            animate "Invalid choice. Returning to reconnaissance menu."
            sleep 1;clear
            menu1
            ;;
    esac
}

# Fungsi scanning vulnerability Windows 10
scan_vulnerability_windows10() {
    clear
    banner
    animate_menu "Scanning Vulnerabilities on Windows 10"
    animate "Enter target IP address:"
    prompt

    target="$user_input"

    animate "Running Nmap script smb-vuln* on $target..."
    sleep 1

    # Menjalankan Nmap script smb-vuln*
    nmap_result=$(nmap --script smb-vuln* "$target")

    # Menampilkan hasil scanning
    echo -e "\nNmap Scan Results for $target:\n"
    echo "$nmap_result"

    animate "Scanning completed."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu reconnaissance
    animate "Options:"
    animate "[1]. Continue scanning"
    animate "[2]. Back to reconnaissance menu"
    prompt

    case $user_input in
        1)
            scan_vulnerability_windows10
            ;;
        2)
            menu1
            ;;
        *)
            animate "Invalid choice. Returning to reconnaissance menu."
            sleep 1;clear
            menu1
            ;;
    esac
}
# web aplication testing menu
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

    case $user_input in
        1) scan_url_dirsearch ;;
        2) cmseek_tool ;;
        3) whatweb_tool ;;
        4) automated_sql_injection ;;
        5) sqlmap_tool ;;
        6) subdomain_enumeration ;;
        7) waf_detection ;;
        8) aws_reconnaissance ;;
        9) dos_attack_hardening ;;
        x) exit ;;
        *) animate "Invalid choice. Please try again." ;;
    esac
}

# Fungsi untuk mengecek dan menginstal Dirsearch
check_and_install_dirsearch() {
    if command -v "dirsearch" &>/dev/null; then
        #animate "Dirsearch is already installed."
        sleep 0.1
    else
        animate "Dirsearch is not found. Installing..."
        git clone https://github.com/maurosoria/dirsearch.git
        cd dirsearch || exit
        chmod +x dirsearch.py
        ln -s "$(pwd)/dirsearch.py" /usr/local/bin/dirsearch
        cd - ;rm -fr dirsearch || exit
        sleep 1
        animate "Dirsearch has been installed successfully."
    fi
}

# Fungsi scanning URL menggunakan Dirsearch
scan_url_dirsearch() {
    clear
    banner
    animate_menu "Dirsearch - Scanning URL"
    animate "Enter target URL (e.g., http://example.com):"
    prompt

    target_url="$user_input"

    # Menjalankan Dirsearch
    animate "Running Dirsearch on $target_url..."
    check_and_install_dirsearch
    sleep 1

    dirsearch_result=$(dirsearch -u "$target_url")

    # Menampilkan hasil scanning
    echo -e "\nDirsearch Results for $target_url:\n"
    echo "$dirsearch_result"

    animate "Scanning completed."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu web application testing
    animate "Options:"
    animate "[1]. Continue scanning"
    animate "[2]. Back to web application testing menu"
    prompt

    case $user_input in
        1)
            scan_url_dirsearch
            ;;
        2)
            menu2
            ;;
        *)
            animate "Invalid choice. Returning to web application testing menu."
            sleep 1;clear
            menu2
            ;;
    esac
}










menu3() {
    animate "Loading Android hacking options..."
    sleep 1
    clear
    banner
    animate_menu "Android Hacking Menu"
    animate """
    [1]. Android Payload
    [2]. Inject Android Payload from File
    [3]. Manual Android Payload Injection
    --------------------------------------
    [4]. Windows Payload To Bypass Windows Defender
    [5]. Create Listerner
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
