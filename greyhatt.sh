#!/bin/bash

# Header
# --------
# Penulis: K1M4K-ID
# Deskripsi: Alat multi-fungsi untuk ethical hacking, pembuatan, dan penyisipan payload APK
#            untuk platform Android.
# Catatan: Sertakan nama penulis saat merekam ulang.
# Lisensi: Sumber terbuka
# Versi: Terbaru

host=$(hostname)
path=$(pwd)
mypath="${path}/tmp"

# Bersihkan layar dan sembunyikan kursor
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

# Fungsi untuk memeriksa keberadaan paket
check_tools() {
    animate """
*********************************** GHAT ***********************************
Skrip ini hanya untuk tujuan pendidikan. Jadilah ethical hacker yang baik K1M4K-ID!
Gunakan hanya pada ethical hacker milik Anda sendiri!!

Versi bash yang diterima (5.2.15(1)-release). Versi minimum yang diperlukan: 4.2

Distro yang kompatibel dengan skrip ini:
Kali Linux, Parrot Os, Ubuntu

Mari kita cek apakah Anda telah menginstal yang dibutuhkan oleh skrip
    """
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
        printf "\033[37;1m%-15s" "$tool"

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
        animate "Semua alat penting terinstal. Skrip dapat dilanjutkan..."
    else
        printf "\n"
        animate "Harap instal alat yang diperlukan sebelum menjalankan skrip."
    fi
    animate "Memeriksa alat non-penting..."
    printf "\n"
    tools_ok=1

    for tool in "${nonessential_tools_names[@]}"; do
        printf "\033[37;1m%-15s" "$tool"

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
        printf "%-15s\n"
        animate """
Semua alat non-penting terinstal.
Pastikan Anda telah menginstal semua dependensi yang diperlukan untuk menjalankan skrip
****************************************************************************
[Enter] untuk melanjutkan & Ctrl+C untuk menghentikan program

"""
read x
clear
    else
        printf "%-15s\n"
        animate """
Beberapa fitur mungkin tidak berfungsi tanpanya.
Pastikan Anda telah menginstal semua dependensi yang diperlukan untuk menjalankan skrip
****************************************************************************
[Enter] untuk melanjutkan & Ctrl+C untuk menghentikan program

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

# Prompt menu yang bagus
prompt() {
    printf "\033[32;3m"
    read -p "ght>" user_input
    printf "\033[32;3m"
}

# Fungsi menu dengan animasi
menu1() {
    animate "Memuat opsi rekognisi..."
    sleep 1
    clear
    banner
    animate_menu "Menu Reconnaissance"
    animate """
    [1]. Pemindaian Vulnerabilitas pada Windows 7
    [2]. Pemindaian Vulnerabilitas pada Windows 10
    [x]. Kembali
    """
    prompt
    case $user_input in
            1) scan_vulnerability_windows7;;
            2) scan_vulnerability_windows10;;
            x) break ;;
            *) animate "Pilihan tidak valid. Harap coba lagi." ;;
    esac
}
# Fungsi pemindaian kerentanan Windows 7
scan_vulnerability_windows7() {
    clear
    banner
    animate_menu "Pemindaian Vulnerabilitas pada Windows 7"
    animate "Masukkan alamat IP target:"
    prompt

    target="$user_input"

    animate "Menjalankan skrip Nmap smb-vuln-ms17-010 pada $target..."
    sleep 1

    # Menjalankan skrip Nmap smb-vuln-ms17-010
    nmap_result=$(nmap -p445 --script smb-vuln-ms17-010 "$target")

    # Menampilkan hasil pemindaian
    echo -e "\nHasil Pemindaian Nmap untuk $target:\n"
    echo "$nmap_result"

    animate "Pemindaian selesai."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu rekognisi
    printf "\n"
    animate "Opsi:"
    animate "[1]. Lanjutkan pemindaian"
    animate "[2]. Kembali ke menu rekognisi"
    prompt

    case $user_input in
        1)
            scan_vulnerability_windows7
            ;;
        2)
            menu1
            ;;
        *)
            animate "Pilihan tidak valid. Kembali ke menu rekognisi."
            sleep 1;clear
            menu1
            ;;
    esac
}

# Fungsi pemindaian kerentanan Windows 10
scan_vulnerability_windows10() {
    clear
    banner
    animate_menu "Pemindaian Vulnerabilitas pada Windows 10"
    animate "Masukkan alamat IP target:"
    prompt

    target="$user_input"

    animate "Menjalankan skrip Nmap smb-vuln* pada $target..."
    sleep 1

    # Menjalankan skrip Nmap smb-vuln*
    nmap_result=$(nmap --script smb-vuln* "$target")

    # Menampilkan hasil pemindaian
    echo -e "\nHasil Pemindaian Nmap untuk $target:\n"
    echo "$nmap_result"

    animate "Pemindaian selesai."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu rekognisi
    printf "\n"
    animate "Opsi:"
    animate "[1]. Lanjutkan pemindaian"
    animate "[2]. Kembali ke menu rekognisi"
    prompt

    case $user_input in
        1)
            scan_vulnerability_windows10
            ;;
        2)
            menu1
            ;;
        *)
            animate "Pilihan tidak valid. Kembali ke menu rekognisi."
            sleep 1;clear
            menu1
            ;;
    esac
}
# Menu pengujian aplikasi web
menu2() {
    animate "Memuat alat pengujian aplikasi web..."
    sleep 1
    clear
    banner
    animate_menu "Menu Pengujian Aplikasi Web"
    animate """
    [1]. Dirsearch
    [2]. Cmseek
    [3]. Whatweb
    [4]. SQL Injection Otomatis
    [5]. Sqlmap
    [6]. Enumerasi Subdomain
    [7]. Deteksi WAF
    [8]. Serangan DoS - Pengerasan
    [x]. Kembali
    """
    prompt

    case $user_input in
        1) scan_url_dirsearch ;;
        2) cmseek_tool ;;
        3) whatweb_tool ;;
        4) automated_sql_injection ;;
        5) sqlmap_tool ;;
        6) subdomain_enumeration_subfinder ;;
        7) waf_detection ;;
        8) dos_attack_hardening ;;
        x) exit ;;
        *) animate "Pilihan tidak valid. Harap coba lagi." ;;
    esac
}

# Fungsi untuk memeriksa dan menginstal Dirsearch
check_and_install_dirsearch() {
    if command -v "dirsearch" &>/dev/null; then
        sleep 0.1
    else
        animate "Dirsearch tidak ditemukan. Menginstal..."
        sudo apt-get install dirsearch &> /dev/null
        animate "Dirsearch telah berhasil diinstal."
    fi
}

# Fungsi pemindaian URL menggunakan Dirsearch
scan_url_dirsearch() {
    clear
    banner
    animate_menu "Dirsearch - Pemindaian URL"
    animate "Masukkan URL target (misalnya, http://example.com):"
    prompt

    target_url="$user_input"

    # Menjalankan Dirsearch
    animate "Menjalankan Dirsearch pada $target_url..."
    check_and_install_dirsearch
    sleep 1

    dirsearch -u "$target_url"

    animate "Pemindaian selesai."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu pengujian aplikasi web
    printf "\n"
    animate "Opsi:"
    animate "[1]. Lanjutkan pemindaian"
    animate "[2]. Kembali ke menu pengujian aplikasi web"
    prompt

    case $user_input in
        1) scan_url_dirsearch ;;
        2) menu2 ;;
        *) animate "Pilihan tidak valid. Kembali ke menu pengujian aplikasi web." ;;
    esac
}

# Fungsi untuk memeriksa dan menginstal cmseek
check_and_install_cmseek() {
    if command -v "cmseek" &>/dev/null; then
        sleep 0.1
    else
        animate "cmseek tidak ditemukan. Menginstal..."
        sudo apt-get install cmseek &> /dev/null
        animate "cmseek telah berhasil diinstal."
    fi
}

# Fungsi untuk menggunakan CMSeek
cmseek_tool() {
    clear
    banner
    animate_menu "CMSeek - Pemindaian Situs Web untuk Kebocoran CMS"
    animate "Masukkan URL target (misalnya, http://example.com):"
    prompt

    target_url="$user_input"

    # Menjalankan CMSeek
    animate "Menjalankan CMSeek pada $target_url..."
    sleep 1

    # Instal CMSeek jika belum terinstal
    if ! command -v "cmseek" &>/dev/null; then
        animate "CMSeek belum terinstal. Menginstal..."
        sudo apt-get install cmseek &> /dev/null
        animate "CMSeek telah berhasil diinstal."
    fi

    # Menjalankan CMSeek pada URL target
    cmseek -u "$target_url"

    animate "Pemindaian selesai."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu pengujian aplikasi web
    printf "\n"
    animate "Opsi:"
    animate "[1]. Lanjutkan pemindaian"
    animate "[2]. Kembali ke menu pengujian aplikasi web"
    prompt

    case $user_input in
        1) cmseek_tool ;;
        2) menu2 ;;
        *) animate "Pilihan tidak valid. Kembali ke menu pengujian aplikasi web." ;;
    esac
}

# Fungsi untuk memeriksa dan menginstal WhatWeb
check_and_install_whatweb() {
    if command -v "whatweb" &>/dev/null; then
        sleep 0.1
    else
        animate "WhatWeb tidak ditemukan. Menginstal..."
        sudo apt-get install whatweb &> /dev/null
        animate "WhatWeb telah berhasil diinstal."
    fi
}

# Fungsi untuk menggunakan WhatWeb
whatweb_tool() {
    clear
    banner
    animate_menu "WhatWeb - Pemindaian Informasi Situs Web"
    animate "Masukkan URL target (misalnya, http://example.com):"
    prompt

    target_url="$user_input"

    # Memeriksa dan menginstal WhatWeb jika belum terinstal
    check_and_install_whatweb

    # Menjalankan WhatWeb
    animate "Menjalankan WhatWeb pada $target_url..."
    sleep 1

    # Menjalankan WhatWeb pada URL target
    whatweb -v "$target_url"

    animate "Pemindaian selesai."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu pengujian aplikasi web
    printf "\n"
    animate "Opsi:"
    animate "[1]. Lanjutkan pemindaian"
    animate "[2]. Kembali ke menu pengujian aplikasi web"
    prompt

    case $user_input in
        1) whatweb_tool ;;
        2) menu2 ;;
        *) animate "Pilihan tidak valid. Kembali ke menu pengujian aplikasi web." ;;
    esac
}

# Fungsi untuk memeriksa dan mengunduh psqli-pro jika belum terinstal
check_and_install_psqli_pro() {
    if [ ! -d "psqli-pro" ]; then
        animate "Mengunduh psqli-pro..."
        git clone https://github.com/Agressiv1njector/psqli-pro.git;sleep 1;mv -f psqli-pro tmp &> /dev/null
        animate "psqli-pro telah berhasil diunduh."
    fi
}

# Fungsi untuk SQL Injection Otomatis dengan psqli-pro (Bash)
automated_sql_injection() {
    clear
    banner
    animate_menu "SQL Injection Otomatis dengan psqli-pro"

    # Memeriksa dan mengunduh psqli-pro jika belum terinstal
    check_and_install_psqli_pro
    sleep 1

    # Menjalankan psqli-pro pada URL target
    bash tmp/psqli-pro/psqli.sh

    # Menampilkan hasil psqli-pro

    animate "Pemindaian selesai."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu pengujian aplikasi web
    printf "\n"
    animate "Opsi:"
    animate "[1]. Lanjutkan pemindaian"
    animate "[2]. Kembali ke menu pengujian aplikasi web"
    prompt

    case $user_input in
        1) automated_sql_injection ;;
        2) menu2 ;;
        *) animate "Pilihan tidak valid. Kembali ke menu pengujian aplikasi web." ;;
    esac
}


# Fungsi untuk memeriksa dan menjalankan SQLMap jika sudah terinstal
sqlmap_tool() {
    if command -v "sqlmap" &>/dev/null; then
        clear
        banner
        animate_menu "SQLMap - Pemindaian SQL Injection"
        animate "Masukkan URL target (misalnya, http://example.com/page?id=1):"
        prompt

        target_url="$user_input"

        # Menjalankan SQLMap untuk SQL Injection
        animate "Menjalankan SQLMap pada $target_url..."
        sleep 1

        # Menjalankan SQLMap dengan perintah yang diinginkan
        sqlmap -u "$target_url" --crawl=1 --random-agent --batch --forms --threads=5 --level=5 --risk=3
        printf "\n"
        animate "Pemindaian selesai."

        # Memberikan opsi untuk melanjutkan atau kembali ke menu pengujian aplikasi web
        printf "\n"
        animate "Opsi:"
        animate "[1]. Lanjutkan pemindaian"
        animate "[2]. Kembali ke menu pengujian aplikasi web"
        prompt

        case $user_input in
            1) check_and_run_sqlmap ;;
            2) menu2 ;;
            *) animate "Pilihan tidak valid. Kembali ke menu pengujian aplikasi web." ;;
        esac
    else
        animate "SQLMap belum terinstal. Silakan instal SQLMap terlebih dahulu."
    fi
}

# Fungsi untuk menjalankan Subfinder
subdomain_enumeration_subfinder() {
    clear
    banner
    animate_menu "Enumerasi Subdomain dengan Subfinder"
    animate "Masukkan domain target (misalnya, example.com):"
    prompt

    target_domain="$user_input"

    # Menjalankan Subfinder untuk enumerasi subdomain
    animate "Menjalankan Subfinder pada $target_domain..."
    sleep 1

    # Memeriksa dan menginstal Subfinder jika belum terinstal
    if ! command -v "subfinder" &>/dev/null; then
        animate "Subfinder belum terinstal. Menginstal..."
        go get -u github.com/projectdiscovery/subfinder/v2/cmd/subfinder &> /dev/null
        animate "Subfinder telah berhasil diinstal."
    fi

    # Menjalankan Subfinder pada domain target
    subfinder -d "$target_domain"

    animate "Enumerasi subdomain selesai."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu pengujian aplikasi web
    printf "\n"
    animate "Opsi:"
    animate "[1]. Lanjutkan enumerasi subdomain"
    animate "[2]. Kembali ke menu pengujian aplikasi web"
    prompt

    case $user_input in
        1) subdomain_enumeration_subfinder ;;
        2) menu2 ;;
        *) animate "Pilihan tidak valid. Kembali ke menu pengujian aplikasi web." ;;
    esac
}

# Fungsi untuk mendeteksi WAF dengan wafw00f
waf_detection() {
    clear
    banner
    animate_menu "Deteksi WAF dengan wafw00f"
    animate "Masukkan URL target (misalnya, http://example.com):"
    prompt

    target_url="$user_input"

    # Menjalankan wafw00f untuk mendeteksi WAF
    animate "Menjalankan wafw00f pada $target_url..."
    sleep 1

    # Memeriksa dan menginstal wafw00f jika belum terinstal
    if ! command -v "wafw00f" &>/dev/null; then
        animate "wafw00f belum terinstal. Menginstal..."
        sudo apt-get install wafw00f &> /dev/null
        animate "wafw00f telah berhasil diinstal."
    fi

    # Menjalankan wafw00f pada URL target
    wafw00f "$target_url"

    animate "Deteksi WAF selesai."

    # Memberikan opsi untuk melanjutkan atau kembali ke menu pengujian aplikasi web
    printf "\n"
    animate "Opsi:"
    animate "[1]. Lanjutkan deteksi WAF"
    animate "[2]. Kembali ke menu pengujian aplikasi web"
    prompt

    case $user_input in
        1) waf_detection ;;
        2) menu2 ;;
        *) animate "Pilihan tidak valid. Kembali ke menu pengujian aplikasi web." ;;
    esac
}








# Fungsi utama untuk menjalankan skrip
run() {
    while true; do
        clear
        banner
        animate "Pilih kategori hacking Anda: "
        animate """
    [1]. Rekognisi
    [2]. Pengujian Aplikasi Web
    [3]. Hacking Android
    [4]. Hacking Wireless
    [5]. Social Engineering
    [6]. Forensik
    [7]. Lain-lain
    [x]. Keluar
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
            *) animate "Pilihan tidak valid. Harap coba lagi." ;;
        esac
    done
}

# Fungsi menu animasi
animate_menu() {
    local title="$1"
    animate "------------------------- $title -------------------------"
    sleep 0.5
}

# Animasi selamat datang
sleep 1
animate "Selamat datang di GHAT - GreyHat Arsenal Toolkit!"
sleep 1
echo
echo
clear
sleep 1

# Periksa alat
check_tools

# Jalankan menu utama
run
