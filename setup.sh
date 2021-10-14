#!/usr/bin/env bash
chsh -s bash
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
#<<<-----Program------>>>
if [[ $CWD != *'com.termux'* ]]; then
printf "${C2}[${C1}!${C2}]${C1}YOU ARE NOT USING TERMUX! SO BYE!!${R0}\n"
exit 1
fi
#<<<-----defining functions-------->>>
common() {
cat <<- CONF > /data/data/com.termux/files/usr/etc/bash.bashrc
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi
CONF
}

classic() {
cat <<- CONFI >> /data/data/com.termux/files/usr/etc/bash.bashrc
PS1='\[\e[1;34m\]┌─(${username})─\[\e[1;35m[\e[4;31m\W\e[0m\e[1;35m]\e[0m\]\n\[\e[1;34m\]└\$ \[\e[0;37m\]'
CONFI
}

standard() {
cat <<- CONFI >> /data/data/com.termux/files/usr/etc/bash.bashrc
PS1='\[\e[0m\]\[\e[48;5;233m\]\[\e[38;5;197m\]${name1}\[\e[38;5;197m\]@\[\e[38;5;197m\]${name2}\[\e[38;5;105m\] \[\e[38;5;221m\]\W\[\e[38;5;221m\]\[\e[38;5;105m\]\[\e[0m\]\[\e[38;5;236m\]\342\226\214\342\226\214\342\226\214\[\e[0m\]'
CONFI
}
stcolorchange() {
cat <<- CONFI > /data/data/com.termux/files/usr/etc/bash.bashrc
lower=220;
topper=250;
RANGE=\$((\$topper-\$lower+1));
GET=\$RANDOM;
let "GET %= \$RANGE";
GET=\$((\$GET+\$lower));
PS1='\[\e[0m\]\[\e[48;5;\${GET}m\]\[\e[38;5;197m\]${name1}\[\e[38;5;197m\]@\[\e[38;5;197m\]${name2}\[\e[38;5;105m\] \[\e[38;5;221m\]\W\[\e[38;5;221m\]\[\e[38;5;105m\]\[\e[0m\]\[\e[38;5;236m\]\342\226\214\342\226\214\342\226\214\[\e[0m\]'
CONFI
}
#<<<---------configuring--------->>>
echo -e "
${C6}Choose your PS1:- ${R0}

${C3}1.${B0}${C1} Suman@BHUTUU${C2} ~ ${C1}▌▌▌${R0}${R1}

${C3}2.${C4}┌─(Suman@BHUTUU)─[${C1}~${C4}]${R0}
  ${C4}└\$${R0}
"
while true; do
printf "${C2}Enter your option==> ${R0}"
read option
if [[ $option == '1' || $option == '01' ]]; then
echo
printf "${C3}What username you want before @ symbol==> ${R0}"
read name1
printf "${C3}what name you want after @ symbol==>${R0} "
read name2
printf "${C5}Do you want always random backrgound color of your PS1? [y/n}==> ${R0}"
read opni
if [[ ${opni} == 'y' || ${opni} == 'Y' ]]; then
printf "${C3}Okay random bgcolor for your PS1 is enabled!${R0}\n"
sleep 0.2
common
stcolorchange
else
common
standard
fi
break
elif [[ $option == '2' || option == '02' ]]; then
printf "${C2}Enter the name you want in place of suman@BHUTUU in your PS1==> ${R0}"
read username
sleep 0.2
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

