terraform_cmds:
  file.append:
    - name: /etc/bash_completion.d/terraform
    - user: root
    - group: root
    - mode: 0755
    - text:
      - alias tfclean="rm -rf .terraform*; tfinit"
      - alias tfinit="terraform init; terraform plan"
      - alias tfplan="if [ ! -d .terraform ]; then terraform init; fi; terraform plan"
      - alias tfapply="if [ ! -d .terraform ]; then terraform init; fi; terraform apply;"
      - alias tfdestroy="terraform destory"
