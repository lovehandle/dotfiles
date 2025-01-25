# Listing files
alias lsa='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias lt='ls -lt'
alias lsize='ls -lSh'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Safety nets
alias rm='rm -i'      # Interactive removal
alias cp='cp -i'      # Interactive copy
alias mv='mv -i'      # Interactive move

# Convenience
alias h='history'
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a new line