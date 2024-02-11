command -v fnm &> /dev/null && eval "$(fnm env --use-on-cd)"
command -v node &> /dev/null && ln -sf $(which node) ~/.local/bin/node
