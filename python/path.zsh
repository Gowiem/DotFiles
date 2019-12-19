export PATH="/Library/Python/2.7/site-packages:$PATH"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Workspace

if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
source /usr/local/bin/virtualenvwrapper.sh
fi
