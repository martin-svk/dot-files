# =====================================================================================================================
# ZSH ruby and git centric prompt
# Made by Martin T.
# =====================================================================================================================

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# rbenv info
local ruby_info=' ruby:(%{$fg[red]%}$(rbenv_prompt_info)%{$reset_color%})'

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" git:[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[cyan]%}+"

# Prompt
PROMPT="%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${ruby_info}\
${git_info} \
%{$ %{$reset_color%}"
