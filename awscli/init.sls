include:
  - packages.tools

download_cli:
  file.managed:
    - name: /tmp/awscliv2.zip
    - source: https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
    - source_hash: sha256=91320f9ce4e420246dbc4c624da24d70b6e68a601688bab3c74da2c6460323a5
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

