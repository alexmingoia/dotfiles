# Prompt
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="λ \W\$(parse_git_branch): "

alias git-clean-branches='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
