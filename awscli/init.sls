include:
  - packages.tools

download_cli:
  file.managed:
    - name: /tmp/awscliv2.zip
    - source: https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
    - source_hash: sha256=810500e78651e338c9b64956cc841f0ef36aa1eb24b9d251a68318587c465755
    - mode: '0755'

unzip_cli:
  cmd.run:
    - name: unzip /tmp/awscliv2.zip
    - cwd: /tmp
    - unless: test -f /usr/local/bin/aws

install_cli:
  cmd.run:
    - name: sudo ./aws/install
    - cwd: /tmp
    - unless: test -f /usr/local/bin/aws

