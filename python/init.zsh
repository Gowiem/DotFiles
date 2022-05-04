# function pyenv() {
#   if command -v pyenv 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"

#     # invoke the real pyenv function now
#     pyenv "$@"
#   else
#     echo "pyenv is not installed" >&2
#     return 1
#   fi
# }
