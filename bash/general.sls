general_cmds:
  file.managed:
    - name: /etc/bash_completion.d/general
    - user: root
    - group: root
    - mode: 0755
    - source: salt://bash/files/general.sh
