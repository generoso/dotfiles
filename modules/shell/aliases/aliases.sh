# Minor customisations to very used commands
alias em="emacs -nw"
alias qdu='du -hs * | sort -h'
alias gop='gnome-open'
alias vim='vim -v'
alias top='top -c'
alias htop="htop -u `whoami`"
alias route='route -n'
alias cal='cal -3'
alias grep='grep --color=always'

complete -d cd

alias r='readlink -e '

# Save and go to last saved directory
alias sd='pwd > ~/.last-dir'
alias gd='cd $(cat ~/.last-dir)'

# Show tree in a fancy way
alias tree='tree -s -h -f --du'

# Open a file
alias gopen='nemo'

# Open an editor
alias notepad='gedit'

# Show our documents
function qhelp() {
    ranger $DOTFILES/docs/
}

# Search a file in the current directory or sub directories
function qf(){
    find | qgrep $1
}

# Edit an alias that matches a given pattern
function qalias-edit() {
	local ALIAS=$1
	echo "Alias: $ALIAS"
	FILES="`grep --color=never $ALIAS -l -R $DOTFILES/modules/shell/aliases/`"
    if [ -z "$FILES" ];
    then
     echo "Alias \"$ALIAS\" not found"
    else
      echo "Found: "
      echo $FILES
      vim $FILES
    fi
}

function qsplit-line() {
    local LINE=$1
    local SEP=$2
    echo $LINE | tr $SEP '\n'
}

alias gpl="gpaste-client history | less"
alias gps="gpaste-client select" # usage: gps 3 (select 3rd item of gpl output)
