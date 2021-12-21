#!/usr/bin/env bash
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
#<<<---program--->>>#
runSetup() {
  FIRST="$1"
  SECOND="$2"
  if ! hash fish > /dev/null 2>&1; then
    apt install fish -y
  fi
  chsh -s fish
cat <<- CONF > $HOME/.config/fish/config.fish
function fish_prompt
    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    if [ -z \$git_branch ]
    set git_branch "👻"
    end
    echo -e '\033[37m┌─(\033[1;49;90m${FIRST}\033[0;00;00m\033[37m@\033[34m${SECOND}\033[37m)─[\033[32m'(prompt_pwd)'\033[37m]-(\033[36m'"\$git_branch"'\033[37m)\033[00m'
    echo -ne '\033[37m└$ \033[00m'
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end
CONF
}
echo -e "
\033[1;4;32mThis will be your ps1 theme\033[0;0;00m\033[1;32m:-\033[0;00m

\033[37m┌─(\033[1;49;90mSuman\033[0;0;00m\033[37m@\033[34mBHUTUU\033[37m)─[\033[32mcurrent-dir\033[37m]-(\033[36mgit-branch\033[37m)
\033[37m└$\033[00m
"
# i don't know why i put variables for colors lol!if i am using code directly XD
while true; do
  printf "${C2}Do you want to set this theme for your ps1? [y/n]: ${R0}"
  read choice
  if [[ $choice == y || $choice == Y ]]; then
    printf "${C6}Enter name before @ to be printed: ${R0}"
    read firstName
    printf "${C6}Enter name after @ to be printed: ${R0}"
    read lastName
    runSetup $firstName $lastName
    break
  elif [[ $choice == n || $choice == N ]]; then
    printf "${C1}Exiting....!${R0}\n"
    exit 0
  else
    printf "${C2}[${C1}!${C2}]${C4}you have only two options!! just run 'y' or 'n'${R0}\n"
  fi
done
