manix "" | grep '^# ' | sed 's/^# \(.*\) (.*/\1/;s/ (.*//;s/^# //' | fzf --reverse --border=rounded --preview="manix '{}'" | xargs manix
