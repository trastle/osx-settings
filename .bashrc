# ---------------------------------------------------------------------
# .bashrc for OSX
# ---------------------------------------------------------------------

# Turn on colors (black background)
# ---------------------------------
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Some aliases I like
# -------------------
alias rebash="source ~/.bashrc"
alias ll="ls -la"
alias ls='ls -G'
alias quit='exit'
alias reboot='shutdown -r now'

function zipdir
{
    if [ -z "$1"  ] || [ -z "$2" ] || [ -n "$3" ];
    then
       echo " "
       echo "INCORRECT USAGE:"
       echo "Expected: zipdir source destination"
       echo "Example:  zipdir  ./example ./example.zip"
       echo " "
    else
       zip -r "$2" "$1"
    fi
}


# Brew completion
if [ -f ~/Scripts/brew-completion.sh ]; then
    . ~/Scripts/brew-completion.sh
fi

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
