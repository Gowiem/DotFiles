# Add Visual Studio Code (code) to PATH
if [[ "$(uname -s)" == "Darwin" ]]; then
  export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
fi
