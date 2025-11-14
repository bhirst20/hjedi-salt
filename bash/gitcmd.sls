git_cmds:
  file.managed:
    - name: /etc/bash_completion.d/list_files
    - user: root
    - group: root
    - mode: 0755
    - text:
      - alias gst="git status"
      - alias gitdebug="git add .; git commit -m 'debugging'; git push"
      - alias gitfix="git add .; git commit -m 'general fixes'; git push"
      - alias gitrelease="git add .; git commit -m 'Updated release notes'; git push"
      - alias gitreset="git reset"
