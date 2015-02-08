# Prompt
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="λ \W\$(parse_git_branch): "

# Default directory is ~/Projects
cd ~/Projects

# PATHs
export GOPATH="/usr/local/go"
export NODE_PATH="/usr/local/share/npm/lib/node_modules"
export GEM_HOME="/usr/local/lib/ruby/gems"
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/go/bin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/bin:$HOME/.cabal/bin:$PATH
export ANDROID_HOME="/Applications/Android Studio.app/sdk"
