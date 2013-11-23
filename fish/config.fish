# Global vars
# =====================================================================================================================
set -lx TERM xterm-256color

# Git integration
# =====================================================================================================================
function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  echo $branch
end

# Custom prompt
# =====================================================================================================================
function fish_prompt
   set_color yellow
   printf '%s' (whoami)
   set_color normal
   printf ' at '

   set_color magenta
   printf '%s' (hostname|cut -d . -f 1)
   set_color normal
   printf ' in '

   set_color $fish_color_cwd
   printf '%s' (prompt_pwd)
   set_color normal
   
   if test -d .git
     printf ' on '
     set_color yellow
     printf '%s' (parse_git_branch)
   end

   set_color normal
   printf ' -> '
end
