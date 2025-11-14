ll_cmds:
  file.managed:
    - name: /etc/bash_completion.d/list_files
    - user: root
    - group: root
    - mode: 0755
    - source: salt://bash/files/list_files.sh


