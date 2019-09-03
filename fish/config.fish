# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch 62A
set __fish_git_prompt_color_upstream_ahead (set_color green)
set __fish_git_prompt_color_upstream_behind (set_color red)

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '^'
set __fish_git_prompt_char_untrackedfiles '+'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

# Greeting screen
set fish_greeting ""

# Alias
alias ll='ls -aghf'
alias g='git'

set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

export ERL_AFLAGS="-kernel shell_history enabled"
export TERM="xterm-256color"

 #Vi-mode
fish_vi_key_bindings

function fish_mode_prompt
end

function fish_prompt
  set last_status $status

  set_color blue
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)
  printf "\n"
  printf "\$ "

  set_color normal
end
set -g fish_user_paths "/usr/local/opt/bison/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libiconv/bin" $fish_user_paths
set -g fish_user_paths $fish_user_paths "/usr/local/Cellar/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/simonprevost/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/simonprevost/Downloads/google-cloud-sdk/path.fish.inc'; end
