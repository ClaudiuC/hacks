# Aliases to display / show hidden files on MacOS. 

alias show_files='defaults write com.apple.finder AppleShowAllFiles TRUE;
killall Finder'
alias hide_files='defaults write com.apple.finder AppleShowAllFiles FALSE;
killall Finder'
