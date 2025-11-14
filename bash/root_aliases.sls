root_aliases:
  file.append:
    - name: /etc/bash.bashrc
    - text:
      - alias ll='ls -alF --color=auto'
      - alias myip='curl ipinfo.io/ip'
      - alias now='date +"%T"'
      - alias nowdate='date +"%d-%m-%Y"'
      - alias gst="git status"
      - alias gitdebug="git add .; git commit -m 'debugging'; git push"
      - alias gitfix="git add .; git commit -m 'general fixes'; git push"
      - alias gitrelease="git add .; git commit -m 'Updated release notes'; git push"
      - alias gitreset="git reset"
