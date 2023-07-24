# #!/bin/sh
# #
# # Homebrew
# #
# # This installs some of the common dependencies needed (or at least desired)
# # using Homebrew.

# Check for Homebrew + install if missing
if test ! $(which brew); then
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install homebrew packages
brew install \
  grc \
  coreutils \
  curl \
  git \
  jq \
  trash-cli
