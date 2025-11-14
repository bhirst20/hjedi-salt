terraform_cmds:
  file.managed:
    - name: /etc/bash_completion.d/terraform
    - user: root
    - group: root
    - mode: 0755
    - source: salt://bash/files/terraform.sh