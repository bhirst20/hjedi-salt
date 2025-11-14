git_cmds:
  file.managed:
    - name: /etc/bash_completion.d/git_commands
    - user: root
    - group: root
    - mode: 0755
    - source: salt://bash/files/git_commands.sh

