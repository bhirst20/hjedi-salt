general_cmds:
  file.managed:
    - name: /etc/bash_completion.d/general
    - user: root
    - group: root
    - mode: 0755
    - text:
      - alias myip='curl ipinfo.io/ip'
      - alias now='date +"%T"'
      - alias nowdate='date +"%d-%m-%Y"'
