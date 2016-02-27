
alias ap=ansible-playbook

# I like clearing the terminal..
alias c='clear'
alias cl='clear'

# emacs alias for terminal
alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

# This is Hardcore Logcat
alias tihLogcat='adb logcat com.artisan.thisishardcore:D \*:E | ~/bin/coloredlogcat.py'

# Basic aliases for editing config files
alias reload!='. ~/.zshrc'
alias zshconfig="subl $ZSH/zsh/zshrc.symlink"
alias aliases="subl $ZSH/zsh/aliases.zsh"

# grep aliases
# Coloring
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# Abbreviated greps
# greps path recursively, ignoring Binary files, printing line numbers, and ignoring case
alias grepProj='grep --color=auto -rIni'

### Aliases from: http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
# cd Aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'

alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias ports='netstat -tulanp'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
