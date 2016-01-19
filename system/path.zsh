# System Bin Paths
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:./bin:$PATH"

# Add this dotfiles repo bin folder to the path
export PATH="$ZSH/bin:$PATH"

# Add Android tools
export ANDROID_HOME=/opt/adt-bundle-mac-x86_64-20130219/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

# Add git
export PATH="$PATH:/usr/local/git/bin:"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin:"
export PATH="$PATH:$HOME/.rvm/gems/:"

# Add Heroku
export PATH="$PATH:/usr/local/heroku/bin:"

# Add Node
export PATH="$PATH:/usr/local/lib/node_modules:"

# Add postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/MacOS/bin/:"

# Mappath
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home

# Gradle
export PATH="$PATH:/Applications/Android Studio.app/Contents/gradle/gradle-2.8/bin/"