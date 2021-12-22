#!/bin/bash
set -eo pipefail # exit on error

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask iterm2
brew install --cask google-chrome
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Xcode is needed by brew, brew is handy
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install git

# Install SDK and jvm related build tools
echo "Installing JVM related tools"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install sbt
sdk install maven

# Support Docker by using minikube
brew install hyperkit
brew install minikube
brew install docker
brew install docker-compose

# Setup minikube, should this go into .zshrc?
minikube start
eval $(minikube docker-env)
echo "`minikube ip` docker.local" | sudo tee -a /etc/hosts > /dev/null

# GH setup
ssh-keygen -t rsa -b 4096 -C $EMAIL
eval "$(ssh-agent -s)"
cat 'Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa' > $HOME/.ssh/config
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
echo "Your public key should now be copied into your clipboard"
open https://github.com/settings/ssh/new

echo -n "Press enter once you finish setting up github SSH "
read answer

# Install commonly used app
brew install --cask maccy
brew install --cask alfred
brew install --cask vlc
brew install --cask jetbrains-toolbox
brew install --cask intellij-idea-ce
brew install --cask pycharm-ce
brew install --cask visual-studio-code
brew install fasd
