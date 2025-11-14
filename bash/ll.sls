ll_cmds:
  file.managed:
    - name: /etc/bash_completion.d/list_files
    - user: root
    - group: root
    - mode: 0755
    - text:
      - alias ll="ls -lah"


