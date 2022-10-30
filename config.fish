alias ls 'exa -l --group-directories-first --git --no-user --no-permissions --icons -s=extension'
alias ll 'exa -l --group-directories-first -h --git --icons -s=extension -a'
alias svim 'vim -u ~/.SpaceVim/vimrc'
alias p 'prevd'
alias n 'nextd'
alias gst 'git status'
alias gg 'lazygit'
alias n 'nvim'

bind \cf 'forward-char'
set -U FZF_CTRL_R_OPTS "--reverse"
set -U FZF_TMUX_OPTS "-p"

# git log --graph --date-order --date=short --pretty=format:'%C(cyan)%h %C(blue)%ar%C(auto)%d %C(yellow)%s%+b %C(black)%ae'

starship init fish | source
fish_add_path $HOME/.config/bin

