#!/usr/local/bin/zsh
vim +NeoBundleInstall +qall
brew update
brew cask update

# check AppStore
open /Applications/CopyLess.app
open /Applications/QuickTime\ Player.app  # for iphone record
open /Applications/Safari.app
open /Applications/Stickies.app
open /opt/homebrew-cask/Caskroom/google-drive/latest/Google Drive.app
open ~/Applications/Flux.app

cd ~/vagrant-now
vagrant up
