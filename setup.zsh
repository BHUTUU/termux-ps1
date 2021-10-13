#!/usr/bin/env zsh
CWD=$(pwd)
#<<<------colour substitution by variables------>>>
C0="\e[1;30m" B0="\e[40m"
C1="\e[1;31m" B0="\e[41m"
C2="\e[1;32m" B0="\e[42m"
C3="\e[1;33m" B0="\e[43m"
C4="\e[1;34m" B0="\e[44m"
C5="\e[1;35m" B0="\e[45m"
C6="\e[1;36m" B0="\e[46m"
C7="\e[1;37m" B0="\e[47m"
R0="\e[00m"   R1="\e[0;1m"
#<<<-----program-------->>>#
if [[ $CWD != *'com.termux'* ]]; then
printf "${C2}[${C1}!${C2}]${C1}YOU ARE NOT USING TERMUX! SO BYE!!${R0}\n"
exit 1
fi
#<<<----definig functions---->>>#
common() {
cat <<- EQF > /data/data/com.termux/files/usr/etc/zshrc
. /data/data/com.termux/files/usr/etc/profile
command_not_found_handler() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found \$1
}
#set nomatch so *.sh would not error if no file is available
setopt +o nomatch
. /data/data/com.termux/files/usr/etc/profile
EQF
}

standard() {
cat <<- CONF >> /data/data/com.termux/files/usr/etc/zshrc
PROMPT='%F{240}${firstname}%F{red}@%F{green}${lastname}-[%F{141}%1d%F{green}]\$ %F{reset}'
CONF
}

classic() {
cat <<- CONF >> /data/data/com.termux/files/usr/etc/zshrc
PROMPT='''%F{blue}┌─(${username})─[%F{red}%1d%F{blue}]
%F{blue}└\$ %F{reset}'''
CONF
}
#<<<---------configuring--------->>>
echo -e "
${C6}Choose your PS1:- ${R0}

${C3}1.\033[38;5;240msuman${C1}@${C2}mBHUTUU-[${C5}~${C2}]$ \033[00;0;000m

${C3}2.${C4}┌─(Suman@BHUTUU)─[${C1}~${C4}]${R0}
  ${C4}└\$${R0}
"
while true; do
printf "${C2}Enter your option==> ${R0}"
read option
if [[ $option == '1' || $option == '01' ]]; then
echo
printf "${C3}What username you want before @ symbol==> ${R0}"
read firstname
printf "${C3}what name you want after @ symbol==>${R0} "
read lastname
common
standard
break
elif [[ $option == '2' || option == '02' ]]; then
printf "${C2}Enter the name you want in place of suman@BHUTUU in your PS1==> ${R0}"
read username
common
classic
break
else
echo
printf "${C2}[${C1}!${C2}]${C1}Please choose a valid option!!${R0}\n"
echo
fi
done
printf "${C1}[${C2}✓${C1}]${C3}Done!! just reopen your termux or just type 'bash' and enjoy ;)${R0}\n"
