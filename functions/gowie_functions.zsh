# iTerm Tab Coloring, Fuck Ya!
# function tab_red() { /Users/gowie/Workspace/Colorize/colorize_tabs.rb -c 'red'; }
# function tab_yellow() { /Users/gowie/Workspace/Colorize/colorize_tabs.rb -c 'yellow'; }
# function tab_blue() { /Users/gowie/Workspace/Colorize/colorize_tabs.rb -c 'blue'; }
# function tab_green() { /Users/gowie/Workspace/Colorize/colorize_tabs.rb -c 'green'; }

# function chpwd() { ~/Workspace/Colorize/colorize_tabs.rb -d }

# Easily get IP addresses
function external_ip () { curl http://ipecho.net/plain; echo; }

# History of CG Django Helpers 

function haml_all_the_things() {
  find . -name '*erb' | \
  xargs ruby -e 'ARGV.each { |i| puts "html2haml -r #{i} #{i.sub(/erb$/,"haml")}"}' | \
  bash;
}

# Refresh the network when it starts messing up on Mac

function refresh_network() {
  sudo ifconfig en1 down;
  sudo route flush;
  sudo ifconfig en1 up;
}