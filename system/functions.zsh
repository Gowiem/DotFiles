# Easily get IP addresses
function external_ip() {
  curl http://ipecho.net/plain
  echo
}

# History of CG Django Helpers
function haml_all_the_things() {
  find . -name '*erb' |
    xargs ruby -e 'ARGV.each { |i| puts "html2haml -r #{i} #{i.sub(/erb$/,"haml")}"}' |
    bash
}

# Refresh the network when it starts messing up on Mac
function refresh_network() {
  sudo ifconfig en1 down
  sudo route flush
  sudo ifconfig en1 up
}

# Name Tab
# Usage: nt tab_name
# Simple function to rename the current tab

function nt() {
  echo -ne "\033]0;"$@"\007"
}

# credit: http://nparikh.org/notes/zshrc.txt
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
extract() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar -jxvf $1 ;;
    *.tar.gz) tar -zxvf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.dmg) hdiutil mount $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar -xvf $1 ;;
    *.tbz2) tar -jxvf $1 ;;
    *.tgz) tar -zxvf $1 ;;
    *.zip) unzip $1 ;;
    *.ZIP) unzip $1 ;;
    *.pax) cat $1 | pax -r ;;
    *.pax.Z) uncompress $1 --stdout | pax -r ;;
    *.Z) uncompress $1 ;;
    *) echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
