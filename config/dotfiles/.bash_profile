# Set default editor
export EDITOR="vim"

# Set the PATH
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Enable shims and autocompletion for rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Start SQL
alias smysql="/usr/local/bin/mysql.server start"

# Include my own git parse type function
source ~/.git_status_in_prompt.sh

#Sets the shell prompt to "DIRECTORY [- GIT_BARNCH]\n→"
export PS1='\[\033[36m\]\w $(git branch &>/dev/null; if [ $? -eq 0 ]; then \
echo "\[\033[34m\]- $(gitParseStatus)\[\033[33m\]$(git branch | grep ^*|sed s/\*\ //)"; fi)\[\033[32m\]\nws→ \[\033[00m\]'

export CLICOLOR=1
export LSCOLORS=dxfxcxcxbxexexbxbxDADA
# See http://softwaregravy.wordpress.com/2010/10/16/ls-colors-for-mac/

# More Git aliases
alias g='git'

# Ask for confirmation when running rm
alias rm='rm -i'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Faster npm for europeans
command -v npm > /dev/null && alias npme="npm --registry http://registry.npmjs.eu"
