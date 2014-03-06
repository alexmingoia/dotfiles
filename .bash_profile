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
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/go/bin:$PATH
export ANDROID_HOME="/Applications/Android Studio.app/sdk"

# Aliases
alias bh-up="(cd ~/Projects/bloodhound/vagrant; vagrant up bloodhound.com)"
alias bh-halt="(cd ~/Projects/bloodhound/vagrant; vagrant halt)"
alias bh-log="(cd ~/Projects/bloodhound/vagrant; vagrant ssh bloodhound.com -c 'tail -f /var/log/syslog')"
alias bh-ssh="(cd ~/Projects/bloodhound/vagrant; vagrant ssh bloodhound.com)"
alias bh-api="(cd ~/Projects/bh-auth; npm start & cd ~/Projects/bh-api; npm start)"
