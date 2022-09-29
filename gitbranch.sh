
#!/bin/zsh
function git_branch {
   
   branch="`git status 2>/dev/null|awk 'BEGIN{FS=\" \"}NR==1{print $3}'`"
   s_nothing="`git status 2>/dev/null|grep -o 'nothing to commit'|grep -o 'nothing'`"
   s_untracked="`git status 2>/dev/null|grep -o 'Untracked files'|grep -o 'Untracked'`"
   s_unstaged="`git status 2>/dev/null|grep -o 'Changes not staged for commit'|grep -o 'Changes not staged'`"
   s_changes="`git status 2>/dev/null|grep -o 'Changes to be committed'`"
   
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch->$s_nothing | $s_untracked | $s_unstaged | $s_changes)"
   fi
}


echo $(git_branch)

autoload -U colors && colors
PROMPT="%{$reset_color%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%1|%~ %{$fg[red]%}%# "


