export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Workspace

if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
source /usr/local/bin/virtualenvwrapper.sh
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
