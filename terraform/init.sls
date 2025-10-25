include:
  - packages.unzip

terraform_exec:
  file.managed:
    - name: /root/terraform_1.0.4_linux_amd64.zip
    - user: root
    - group: root
    - mode: "0660"
    - source: https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip
    - source_hash: https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_SHA256SUMS

terraform_decompress:
  cmd.run:
    - name: cd /root/; unzip terraform_1.0.4_linux_amd64.zip
    - creates: /root/terraform

terraform_copy:
  cmd.run:
    - name: mv /root/terraform /usr/local/bin/terraform_1.0.4
    - creates: /usr/local/bin/terraform_1.0.4

terraform_simplified:
  file.symlink:
    - name: /usr/local/bin/terraform
    - target: /usr/local/bin/terraform_1.0.4
