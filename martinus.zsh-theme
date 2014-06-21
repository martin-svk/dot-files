# =====================================================================================================================
# ZSH ruby and git centric prompt
# Made by Martin T.
# =====================================================================================================================

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# RVM info
local ruby_info=' rvm:(%{$fg[red]%}$(rvm-prompt i v g)%{$reset_color%})'

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" git:[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[cyan]%}o"

# Prompt
PROMPT="%{$fg[cyan]%}%n \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${ruby_info}\
${git_info} \
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
