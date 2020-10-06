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
