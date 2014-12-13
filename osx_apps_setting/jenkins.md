


# OS起動時にJenkinsを自動起動させる
ln -sfv /usr/local/opt/jenkins/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.jenkins.plist
