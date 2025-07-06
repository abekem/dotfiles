if status is-interactive
    # Commands to run in interactive sessions can go here
end

export LSCOLORS=Gxfxcxdxbxegedabagacad

# nvim
alias vim='nvim'

# ghqを使ってローカルリポジトリへ移動
alias g='cd $(ghq list -p | peco)'
# ローカルリポジトリをVSCodeで開く
alias vs='code $(ghq list -p | peco)'

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

set GHQ_SELECTOR peco

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

# gnupg
export GPG_TTY=$(tty)
