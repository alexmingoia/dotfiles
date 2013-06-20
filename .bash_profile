# Prompt
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="λ \W\$(parse_git_branch): "

# PATHs
export GOPATH="/usr/local/go"
export NODE_PATH="/usr/local/lib/node_modules"
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/go/bin:$PATH

# Aliases
alias bhlog="cd ~/Projects/bldhnd; vagrant ssh -c 'tail -f /tmp/bh_development.log'"
