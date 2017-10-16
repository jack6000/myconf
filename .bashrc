# Ne rien faire en mode non interactif
[ -z "$PS1" ] && return

# Ne pas mettre les doublons dans l'historique
HISTCONTROL=ignoredups:ignorespace
# Nombre de ligne de l'historique, par session
HISTSIZE=1000
# Nombre de ligne de l'historique conservée
HISTFILESIZE=2000

# Ajuste la taille (LINES, COLUMNS), si nécessaire
# après chaque commande
shopt -s checkwinsize

# Pour avoir nvim en couleur
export TERM=xterm-256color

# Un prompt en couleur
export PS1="\[\033[38;5;113m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;113m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;110m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] > \[$(tput sgr0)\]"

# Pour utiliser neovim pour crontab
export EDITOR=nvim

# Quelques alias utiles
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Pour fermer le terminal
alias ee='exit'
alias nvimqt='~/code/tmp/neovim-qt/build/bin/nvim-qt'

# Cherche un mot dans tous les fichiers d'un répertoire
alias grepm='grep --color=always -Rnis'

alias ls='ls -F --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l -h --color=auto'

alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update'
alias saga='sudo apt-get autoremove'
alias sacs='sudo apt-cache search'

alias du='du -kh --max-depth=1'
alias df='df -kTh'

# Demande de confirmation
alias mv='mv -i'
alias rm='rm -i'

# Affiche l'aide
alias hh='echo "cd1 => ~/code/desktop"; \
    echo "cd2 => ~/code/micro"; \
    echo "cd3 => ~/code/rust"; \
    echo "cdarm => ~/code/micro/arm/projects"; \
    echo "cdavr => ~/code/micro/avr"; \
    echo "Chercher un mot dans un répertoire: grepm mot"'

alias cd1='cd ~/code/desktop'
alias cd2='cd ~/code/micro'
alias cd3='cd ~/code/rust'
alias cdarm='cd ~/code/micro/arm/projects'
alias cdavr='cd ~/code/micro/avr'
alias cdnvim='cd ~/.config/nvim'
alias myconf='git --git-dir=/home/jack/.myconf --work-tree=/home/jack'

export PATH=$PATH:$HOME/bin/rpi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
export PATH=$PATH:$HOME/Qt/Tools/QtInstallerFramework/3.0/bin/

export GOPATH=$HOME/code/go
export COLORTERM=konsole
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

# Convertit Caps-Lock en Esc
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
